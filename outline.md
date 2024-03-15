# UoE UnaHerDoc Proposal

## Overview

- rough history
- rough outline of the problem
- motivations
  - Affordable modal anaylis on plates
    - "Polytec" or "OMS Corporation" sort of have a monopoly
    - field lartgely dominited by only a handful of companies.
  - Youn'gs estimation of material without additonal cost of FEM modelling software
- introduction of the solution
- some definitions of terms

## Recent Research

- what has been in the field
- what is the trajectory
- where is there room for improvement

## Project Description

### Objectives

- what hope to achieve
  - a framework for designing a low-cost, non-contact measurement system for musical instrument soundboards.
    - comprehensive instructions for self assembly
    - cad models for fabrications
    - document outlining:
      -  the design process
      -  justification for any design decision
      -  technichal background to make modification in the design easier to undertake.
  - open source software toolkit for
    - control
    - data processing

### Timeline

- how long will each section take.

### Materials

- What will be needed

- General electronics
  - bench power
  - function generator
  - oscilloscope
  - electronics sundries
    - bread boards
    - jumper cabling 
    - resistor
    - capacittors
    - potentiometers
    - variable capacitors
  - Soldering fascilities
    - Soldering iron
    - reflow oven
  - PCB fascilities
    - outsourced: time consuming.

#### Microphone

- MEMs microphones
  - For FRF [Farshidi] showed positive results
    - should be enough for estimating young's modulus
  - for plate mode shapes [van Velsen] results suggests such an experiment setup is not accurate.
  
#### Laser
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
  - From Matiss Malahs _If the information about the direction in which the object is moving is not necessary, the Bragg cell can be omitted. [9.]_

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

### Safety

> When designing a system which uses a laser that is not enclosed in a casing the maxi- mum output power of the laser must be carefully considered, as improper design may lead to lasting health damage. The lasers used in LDV systems available on the market essentially do not exceed 5 mW output power and can be used without particular caution.
- Matiss Malahs design was a 3R laser, safety precaustions would need to be taken iof recreating.
- Design is intended to battery powered or from a commercial Power Supply Unit. No high-voltage power amplification will be taking place. 

### Outcomes

- Phases of the project
  - First sensor fabrications
    - testing / reproducibility
    - cost tracking
  - automation