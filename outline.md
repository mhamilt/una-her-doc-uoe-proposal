# UoE UnaHerDoc Proposal

## Overview

Mode measurement is useful tool for instrument makers to understand the
materials with which they are working. Modes give an understanding of material
frequency response but also provide a means of estimating material properties
that would typically be derived through destructive means.

One of the methods of measure is via laser vibrometry, which has been a useful
tool for acousticians for a number of decades. Laser vibrometry provides both
accurate measurement but is also non-obtrusive. Laser vibrometry does have a
limitation in the form of cost. A modest laser doppler vibrometry would be in
the order of €20k. This is a cost that is difficult to justify for the usage it
would see by instrument collector and museums. The market for laser vibrometer
is also domniated by a handful of companies and it seems unlikely this cost will
shrink any time soon. Laser vibrometers are precision engineered for all
vibration analysis, a level accuracy unlikely to be utlilsed when applied t o
musical instrumebts. 

The barrier to entry for technical projects of this kind has been lowered over
the past few decades. What was once quite a technical undertaking is now more
achievable with readily available micro-controller units (MCUs) like the Arduino
or single-board computers (SBCs) like the Raspberry Pi, which can easily
interface with sensors and actuators to prototype haptic devices. This proposal
will cover what components will be required in the project and what function
they will serve. . Thesis [x] demonstrates it should be possible to compromise
on component precision and still obtain useful measurements.

Goal of the project would be the design of a non-contact measurement system that
is economic to fabricate in comparison to current commercially available laser
vibrometers. The output would consist of:

- a framework for designing a low-cost, non-contact measurement system for
  musical instrument soundboards.
    - comprehensive instructions for self assembly
    - cad models for fabrications
    - document outlining:
      -  the design process
      -  justification for any design decision
      -  technichal background to make modification in the design easier to undertake.
      -  record each tier of precision, it's relative cost to the entire tool and benefits it introduces.
  - open source software toolkit for
    - control
    - data processing


- rough outline of the problem
- motivations
  - Affordable modal anaylis on plates
    - "Polytec" or "OMS Corporation" sort of have a monopoly
    - field lartgely dominited by only a handful of companies.
  - Youn'gs estimation of material without additonal cost of FEM modelling
    software
- introduction of the solution
- some definitions of terms

Laser Doppler virbo

## Recent Research

- what has been in the field
- what is the trajectory
- where is there room for improvement

## Project Description

Look at three methods for measurement.

- Laser Doppler
- Grazing Laser
- MEMs microphone array

For each there is a base cost. 

Look at a simple version for each and how promising it is. 
proceed with whichever methods showed the most pronmised.

This section lay out objectives, give a rough timeline and stipulate which materials are required along with a rough costing.

### Objectives

- what hope to achieve
  - a framework for designing a low-cost, non-contact measurement system for
    musical instrument soundboards.
    - comprehensive instructions for self assembly
    - cad models for fabrications
    - document outlining:
      -  the design process
      -  justification for any design decision
      -  technichal background to make modification in the design easier to
         undertake.
  - open source software toolkit for
    - control
    - data processing

### Timeline

- how long will each section take.

### Materials

- What will be needed

#### General electronics
  - bench power
  - function generator
  - oscilloscope
  - electronics sundries
    - bread boards
    - jumper cabling
    - resistor
    - capacitors
    - potentiometers
    - variable capacitors
  - Soldering facilities
    - Soldering iron
    - reflow oven
  - PCB facilities
    - outsourced: (but time consuming)
### Costing

#### MEMs Microphone

- MEMs microphones
  - For FRF [Farshidi] showed positive results
    - should be enough for estimating young's modulus
  - for plate mode shapes [van Velsen] results suggests such an experiment setup
    is not accurate.
  
#### GLV

- components
  - lm384 op-amps
  - laser 
    - 650nm
    - infrared
    - BPW34 photodiodes
- analysis
    - ni mydaq

##### LDV

- beam splitter(s)
- mirror
- Bragg Cell
  - fibre optics
  - From Matiss Malahs _If the information about the direction in which the
    object is moving is not necessary, the Bragg cell can be omitted. [9.]_

- Questions
  - x3 beam splitters
  - mirror
  - brag cell in the order of £1500
    - the cell
    - fibre optics
    - focal lens

  - digital signal processing
    - 
- Linear Scanning rig
  - steppers
  - arduino
  - extrusion

#### From Mark Rau

- _"One common method is known as the “roving hammer” method"_ [Brian J Schwarz and Mark H Richardson. Experimental modal analysis. CSI Reliability
week, 35(1):1–12, 1999.].
- An alternative and preferred method for 2D modal scans is a scanning laser Doppler vibrometer such as the Polytec PSV-500 [Polytec. PSV-500 Scanning Vibrometer. https://www.polytec.com/eu/vibrometry/ products/full-field-vibrometers/psv-500-scanning-vibrometer. Accessed 04-10-2023.]
- 
- Wonsung. 20kpps galvo galvanometer based optical scanner including show card for animation light. https://www.amazon.com/Generic-Galvanometer-Optical-Scanner-Including/dp/B01IZPMUPO/ref=cm_cr_arp_d_product_top?ie=UTF8. Accessed 04-10-2023. stage animation laser lights

### Safety

> When designing a system which uses a laser that is not enclosed in a casing
> the maxi- mum output power of the laser must be carefully considered, as
> improper design may lead to lasting health damage. The lasers used in LDV
> systems available on the market essentially do not exceed 5 mW output power
> and can be used without particular caution.
- Matiss Malahs design was a 3R laser, safety precaustions would need to be
  taken iof recreating.
- Design is intended to battery powered or from a commercial Power Supply Unit.
  No high-voltage power amplification will be taking place. 

### Outcomes

- Phases of the project
  - First sensor fabrications
    - testing / reproducibility
    - cost tracking
  - automation