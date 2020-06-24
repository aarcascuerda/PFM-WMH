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
    if test -f $number/bigrbrain_2/result.nii.gz; then
        echo "$number already done"

    # Run the specific docker container and executed, then copy results and clean remains
    else
        echo $number
        CONTAINERID=`docker run --gpus all -dit -v $number/input/orig:/input/orig:ro -v $number/input/pre:/input/pre:ro -v /output wmhchallenge/bigrbrain_2`
        docker exec $CONTAINERID /bin/bash -c "python /path/in/container/Testing_CNN.py"
        docker cp $CONTAINERID:/output $number/bigrbrain_2
        docker stop $CONTAINERID
        docker rm -v $CONTAINERID
    fi
done
