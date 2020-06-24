#!/bin/bash

# Find parent folder path
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Move to results folder
cd $parent_path

# Loop over all the T1-weighted images and apply fsl_deface tool
for file in data/*t1.nii.gz
do
  fsl_deface ${file} orig/${file:5:16}3DT1.nii.gz -d orig/${file:5:16}3DT1_mask.nii.gz
done