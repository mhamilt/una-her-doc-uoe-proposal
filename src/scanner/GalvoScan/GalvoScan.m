%% DIY laser Doppler Vibrometer mirror galvonometer scanner.
%  Mark Rau
%  May, 2022
%
%  A stepper motor is used to excite the system, and a mirror galvonometer redirects the laser beam.
%  This version assumes the use of a Teensy 3.6 which is used because it has two 12-bit DACs to control the galvonometers. Other microcontrollers could be used, but some code may need to be changed.
%  This code is accompanied by "TeensyGalvoGridSerial.ino"



clear all
close all
clc

% Close any serial ports that may have been left open by previous instances
allSerialPorts = instrfind;
for i =1:length(allSerialPorts)
    fclose(allSerialPorts(i)); % To close
end



tic % for timing how long a run takes

%% Set Variables

% Number of horizontal and vertical scan points
horizontalScanPoints = 60;
verticalScanPoints = 60;

fs = 48000;             % sample rate
recordLength = 3;       % recording length in seconds for each impact
nChans = 2;             % number of channels to record

hammerThresh = 0.02;    % threshold for a hammer strike to be detected
doubleHitThresh = 0.05; % time threshold to check if a hammer double hit occured

% Name of the current measurement, and make a directory
measurementName = 'MartinBack_60x60';
mkdir(measurementName)

% Sensitivity factors for impact hammer and LDV
sensitivityFactors = [0.02455^(-1),0.025]; % mini hammer, LDV (100mm/s)

% Iterative variables for number of bad measurements and full measurements
badMeas = 0;
fullMeasCount = 0;

% Setup an e-mail service so you can get notified when the measurement
% finishes or if it goes wrong
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail','your_email@gmail.com');
setpref('Internet','SMTP_Username','your_email6@gmail.com');
setpref('Internet','SMTP_Password','');
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

%%
% Open serial connection
s = serial('COM3','BaudRate',9600);
fopen(s);

sHamm = serial('COM4','BaudRate',115200);
fopen(sHamm);


%% Set up daq, assuming a National Instruments DAQ device. I used a National Instruments USB-4431
d = daq.getDevices;
daqSession = daq.createSession('ni');

% Add channels
daqSession.addAnalogInputChannel(d.ID,0,'IEPE');
daqSession.addAnalogInputChannel(d.ID,1,'Voltage');

% daqSession recording parameters
daqSession.Rate = fs;
daqSession.DurationInSeconds = recordLength;

% Set input channel coupling
for n = 1:nChans
    daqSession.Channels(1,n).Coupling = 'AC'; % 'AC' or 'DC'
end



%% Run the measurement Loops, the loop points can be be set to smaller limits if measureing a smaller area.

for n = 0:horizontalScanPoints - 1
    for m = 0:verticalScanPoints - 1
        gotHit = 0;
        hasDoubleHit = 0;
        measurementCount =0;
        
        while(gotHit<1 && measurementCount < 5)
            x = n/(horizontalScanPoints-1);
            y = m/(verticalScanPoints-1);
            
            x_pos = round(4095-x*4095);
            y_pos = round(y*4095);
            
            
            % Move the LDV position and strike with hammer
            fullMessage = strcat("h",num2str(x_pos),"v",num2str(y_pos));
            fprintf(s,fullMessage); % horizonatal LDV position with 0-4095
            
            fprintf(sHamm,"s1"); % hammer message
            
            % Start recording
            data = daqSession.startForeground();
            
            % Confirm that a tap happened
            [Y,I] = max(data(:,1));
            if(Y > hammerThresh)
                data = data(I-100:I+2*fs-1,:);
                gotHit = 1;
            end
            
            % Check for a double hit
            [Y_d,I_d] = max(data(150:end,1));
            if(Y_d > Y*doubleHitThresh && measurementCount < 5)
                gotHit = 0;
            end
            
            % Plot measurement to quickly confirm that it looks okay
            plot(data(1:1500,1))
            
            if (gotHit == 1)
                data(:,1) = data(:,1)*sensitivityFactors(1);
                data(:,2) = data(:,2)*sensitivityFactors(2);
                % Save the recorded data
                save([measurementName,'/',measurementName,'_x',num2str(n),'_y',num2str(m),'.mat'],'data')
            elseif(measurementCount==4)
                data(:,1) = data(:,1)*sensitivityFactors(1);
                data(:,2) = data(:,2)*sensitivityFactors(2);
                % Save the recorded data
                save([measurementName,'/',measurementName,'_x',num2str(n),'_y',num2str(m),'_bad.mat'],'data')
                
                % Send an e-mail if bad
                badMeas = badMeas+1;
                if (badMeas == 1)
                    sendmail('your_email@gmail.com','Measurement messed up!');
                end
            end
            
            measurementCount = measurementCount+1;
        end
        
        % Send an e-mail every 1000 points to confirm the measurement is
        % still running
        if (fullMeasCount > 0 && mod(fullMeasCount,1000)==0)
            sendmail('your_email6@gmail.com',strcat('Got the to: ',num2str(fullMeasCount),' measurements'));
        end
        fullMeasCount = fullMeasCount+1;
    end
end




%% Close the serial port
fclose(s);
allSerialPorts = instrfind;
for i =1:length(allSerialPorts)
    fclose(allSerialPorts(i)); % To close
end

%E-mail when done
sendmail('your_email@gmail.com','Measurement Finished!');

toc % print how long the measurement took
