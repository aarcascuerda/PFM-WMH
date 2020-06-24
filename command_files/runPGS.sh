#!/bin/bash

# Find parent folder path
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Move to results folder
cd $parent_path
cd results

# Loop over all subjects
for number in *
do
    # Check if results are already computed
    if test -f $number/pgs/result.nii.gz; then
        echo $(number)_already_done
    
    # Run the specific docker container and executed, then copy results and clean remains
    # Note that the PGS fixes are done during runtime
    else
        echo $number
        CONTAINERID=`docker run --gpus all -dit -v $number/input/orig:/input/orig:ro -v $number/input/pre:/input/pre:ro -v /output wmhchallenge/pgs`
        docker exec $CONTAINERID bash -c "sed -i 's/ml = 500/ml = 512/' WMHs_segmentation_PGS.py && sh /WMHs_segmentation_PGS.sh T1.nii.gz FLAIR.nii.gz result.nii.gz"
        docker cp $CONTAINERID:/output $number/pgs
        docker stop $CONTAINERID
        docker rm -v $CONTAINERID
    fi
done
