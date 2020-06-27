# Bash Scripts

## Overview

In this folder there are the main scripts necessary to preprocess and prepare the MRI data to feed the segmentation methods. Then, there is also the necessary scripts we used to generalized/fix each and run each segmentation methods.

Note that this process has many dependencies, it relies on a certain input data, certain software versions or the OS system. We tried to do it as general as possible and explaining each step such that in case of failure, one could fix the failure issue as easy as possible.

## Requirements

* Ubuntu 18.04 or above with `sudo` privilegies.
* FSL, Elastix and SPM12 softwares installed and properly configured (refer to [Report](https://github.com/aarcascuerda/PFM-WMH/blob/master/report.pdf) for more information).
* Docker 19.03 and nvidia-docker installed and properly configured.

## Process

### Prepare and preprocess data

1. Insert the FLAIR and T1 MRI sequences to be preprocessed and segmented inside the [Data](https://github.com/aarcascuerda/PFM-WMH/blob/master/data) folder. Note that the names of the files must fulfil the pattern `"{subject_code}t1.nii.gz"` for the T1-weighted and `"{subject_code}flair.nii.gz"` for the FLAIR. Moreover the subject code must be exactly 16 characters long. If they are not, just add some random characters.
2. Open a bash shell in this folder and run:
   ```bash
   sudo chmod -x defaceData.sh
   ```
2. Open a bash shell in this folder and run:
   ```bash
   sudo chmod -x elastixPrerprocess.sh
   ```
4. (Optional) Use the SPM12 Tool and run the Segment module on all original data. Safe the output on the [Pre](https://github.com/aarcascuerda/PFM-WMH/blob/master/data/pre) folder. Let all the parameters to the default and set the *Light Reguralization*.

This last preprocess step is not compulsory as must algorithm don't relay on the preprocessed data. To avoid it just copy all the data of the [Orig](https://github.com/aarcascuerda/PFM-WMH/blob/master/data/orig) folder to the  [Pre](https://github.com/aarcascuerda/PFM-WMH/blob/master/data/pre) folder.

### Run the methods

1. Open a bash shell in this folder and run:
    ```bash
    sudo chmod -x createResultsFolder.sh
    ```
2. Run a method and compute result masks:
   ```bash
   sudo chmod -x run{methodName}.sh
   ```
