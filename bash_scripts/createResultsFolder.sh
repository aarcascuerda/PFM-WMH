#!/bin/bash

# Find parent folder path
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Move to results folder
cd $parent_path

# Loop over all original FLAIR sequences
for number in data/orig/*FLAIR.nii.gz
do
    echo ${number:10:16}

    # Create original results forlder for a given subject
    mkdir -p results/${number:10:15}/input/orig

    # Copy subject all original data
    for file in ${number:0:26}*
    do
        echo results/${number:10:15}/input/orig/${file:26}
        cp $file results/${number:10:15}/input/orig/${file:26}
    done

    # Create preprocessed results forlder for a given subject
    mkdir -p results/${number:10:15}/input/pre

    # Copy subject all preprocessed data
    for file in data/pre/m${number:10:16}*
    do
        echo results/${number:10:15}/input/pre/${file:26}
        cp $file results/${number:10:15}/input/pre/${file:26}
    done
done