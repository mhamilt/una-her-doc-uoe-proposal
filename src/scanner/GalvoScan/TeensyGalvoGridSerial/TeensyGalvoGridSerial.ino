// DIY laser Doppler Vibrometer mirror galvonometer scanner.
// Mark Rau
// May, 2022
//
// A stepper motor is used to excite the system, and a mirror galvonometer redirects the laser beam.
// This version assumes the use of a Teensy 3.6 which is used because it has two 12-bit DACs to control the galvonometers. Other microcontrollers could be used, but some code may need to be changed.

// Includes the Arduino Stepper Library
#include <Stepper.h>

// Defines the number of steps per rotation
const int stepsPerRevolution = 2048; // 2038

// Creates an instance of stepper class
// Pins entered in sequence IN1-IN3-IN2-IN4 for proper step sequence
Stepper myStepper = Stepper(stepsPerRevolution, 2, 4, 3, 5);

int incomingByte = 0; // for incoming serial data

void setup()
{
  // Changhe the analog resolution for the 12-bit DACs of the Teensy used to control the galvonometers
  analogWriteResolution(12);
  Serial.begin(115200);
}

void loop()
{
  // put your main code here, to run repeatedly:
  // Set the speed of the stepper motor.
  myStepper.setSpeed(17);

  if (Serial.available() > 0)
  {
    // read the incoming byte:
    char commandChar = Serial.read();
    int commandInt = Serial.parseInt();

    if (commandChar == 's' && commandInt == 1)
    {
      // If the commandChar == 's', impact the system with the hammer. Note, this is a simple setup where the hammer is suspended like a pendulum and the stepper motor just moves it back to strat a free-fall excitation.
      myStepper.step(stepsPerRevolution);
      delay(1);
    }
    else if (commandChar == 'h' && commandInt >= 0 && commandInt <= 4095)
    {
      // If the commandChar == 'h', move the horizontal direction
      analogWrite(A22, commandInt); // 12-bit DAC!, 0-4095 max, 0-3.3V
      delay(1);
    }
    else if (commandChar == 'v' && commandInt >= 0 && commandInt <= 4095)
    {
      // If the commandChar == 'v', move the horizontal direction
      analogWrite(A21, commandInt); // 12-bit DAC!, 0-4095 max, 0-3.3V
      delay(1);
    }

    delay(1);
  }
}
