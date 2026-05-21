# Metagel-ultrasonic-pressure-sensing

This repository contains the code and sample data used for **peak frequency tracing** in the study *"Ultrasonic Metagel Sensing of Intra-Compartmental Pressure"*.

## Overview

The repository provides a MATLAB-based pipeline that extracts and tracks the peak frequency of ultrasonic radio-frequency (RF) signals acquired during a pressure-monitoring experiment. The peak frequency shift serves as the key indicator of intra-compartmental pressure variation in the proposed metagel sensing scheme.

## Repository Contents

| File | Description |
|------|-------------|
| `Metagel_Sensing_Data.mat` | Ultrasonic RF data collected by an ultrasound transducer during a single pressure-change monitoring session. |
| `Peak_Frequency_Tracing.m`  | MATLAB script that performs segmented FFT, envelope extraction, and peak frequency tracking on the RF data. |

## Requirements

- **Operating System:** Windows 11
- **Software:** MATLAB R2023a
- **Toolboxes:** Signal Processing Toolbox (required by the `envelope` function)

> The script has been tested and verified under the configuration above. It is expected to run on other platforms or recent MATLAB versions, but compatibility is not guaranteed.

## Usage

1. Clone or download this repository to a local directory.
2. Open MATLAB and set the current folder to the repository root.
3. Run the script:

   ```matlab
   Peak_Frequency_Tracing
