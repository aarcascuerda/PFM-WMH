#!/bin/bash
# Note that this container can't be pulled directely from DockerHub and it has to be build from the source code which
# should be requested to the authors.

# Find parent folder path
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Move to results folder
cd $parent_path
cd results

# Loop over all subjects
for number in *
do
    # Check if results are already computed
    if test -f $number/coroflo/result.nii.gz; then
        echo "$number already done"

    # Run the specific docker container and executed, then copy results and clean remains
    else
        echo $number
        CONTAINERID=`docker run --gpus all -dit -v $number/input/orig:/input/orig:ro -v $number/input/pre:/input/pre:ro -v /output coroflo`
        docker exec $CONTAINERID /bin/bash -c "sh /code_final/main.sh"
        docker cp $CONTAINERID:/output /home/aarcas/Neuro/results/$number/coroflo
        docker stop $CONTAINERID
        docker rm -v $CONTAINERID
    fi
done
