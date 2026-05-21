# Metagel-ultrasonic-pressure-sensing

This repository provides the peak-frequency tracing code used in the research article:
**"Injectable, bioadhesive ultrasonic sensor for continuous and wireless on-demand pressure monitoring in acute compartment syndrome"**

## Overview

The repository contains a MATLAB script that extracts the peak frequency
evolution from ultrasound radio-frequency (RF) data acquired during a
pressure-monitoring experiment. 

## Repository Contents

| File | Description |
| --- | --- |
| `Metagel_Sensing_Data.mat` | Ultrasound RF data acquired by the ultrasound probe during pressure monitoring session. |
| `Peak_Frequency_Tracing.m` | MATLAB script that performs peak frequency tracing on the RF data. |

## Requirements

- **Operating system:** Windows 11
- **Software:** MATLAB R2023a
- **Toolboxes:** Signal Processing Toolbox (required for the `envelope` function)

The script has been tested and verified under the configuration above.
It is expected to run on other platforms or recent MATLAB versions.


## Usage

1. Clone or download this repository.
2. Open MATLAB and set the working directory to the repository folder.
3. Run the script:

   ```matlab
   Peak_Frequency_Tracing
