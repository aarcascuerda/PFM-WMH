#!/bin/bash

# Find parent folder path
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Move to results folder
cd $parent_path

# Loop over all the T1-weichted images with face cropped.
for file in data/orig/*3DT1.nii.gz
do

  # Register FLAIR and T1-weighed images
  elastix -f data/${file:10:16}*flair.nii.gz -m ${file} -out elastix_tmp -p elastix_config.txt
  mv elastix_tmp/TransformParameters.0.txt data/orig/${file:10:16}reg_3DT1_to_FLAIR.txt

  # Apply final transformations to the result
  transformix -in elastix_tmp/result.0.nii -out elastix_tmp -tp data/orig/${file:10:16}reg_3DT1_to_FLAIR.txt
  mv elastix_tmp/result.nii data/orig/${file:10:16}T1.nii.gz
  echo File ------------- ${file}
done
