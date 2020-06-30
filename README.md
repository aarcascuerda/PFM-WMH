# Validation of White Matter Hyperintensities Automatic Segmentation Methods

This repository is part of my master's degree thesis. In it, you will find a summary of all the work done through the process. Then, you will also find all the codes needed to run the different packages, methods, configurations and data needed to output the results of the thesis. Note that you won't find the MRI data due to privacy reasons.

## Work done

During the whole process of developing this thesis, we could separate the work done in five big steps. These are summarized below.

1. **Systematic Review:** From mid February to finals of March, we basically worked on the Systematic Review. This consisted mainly in reading through articles with WMHs segmentations methods selecting the papers or discarding them. There was also a lot of effort put into trying to code/run some of the methods found and which clamed to be powerful. This process was really tough as the codes were written in different progamming languages and without taking much care into being *well coded*. With this I mean that even those source codes which were publicly available didn't ran at first an the process of debugging them plus trying to train them was not easy at all. Then, we found the WMH Challenge.
2. **Prepare and preprocess the data:** This took about one moth as we had to search and configure the different packages to do these steps. Moreover, some of the packages were not free or deprecated and we had to find a way around. Moreover, the size of our dataset was about 20GB and running the different computations was slow and had to be really well prepared.
3. **Debugging and runing the methods:** We started by selecting the top 10 methods from the WMH Challenge for evaluation. From those, only NeuroML 2 ran directly. For all the others which were available, 8 in total, we went throught the whole source code, understanding it and seeing if it could be addapt it to our data. In those 3 in which we could we did. Once we had the methods operative, we ran them through our data which again, took around a week or so.
4. **Developing and running the evaluation codes:** This was probably the most straight forward and *fun* part which was developing and testing the notebooks and functions to evaluate the methods and output the graphics.
5. **Analysing the results and writing the memory:** As it names says, it basically consisted in trying to understand the results obtained with the help of some experiments on the data as well as discussions with my supervisors. Then, writting the whole memory and conclusions.

## Codes

The codes are separated in two different folders. All the requirments needed for each part are detailed in the respective codes and `README` file.

* [Bash scripts folder](https://github.com/aarcascuerda/PFM-WMH/blob/master/bash_scripts) in where you will find all the scripts needed to preprocess the data and run the method container's as well as a `README` file detailing the process to run them.
* [Pythons folder](https://github.com/aarcascuerda/PFM-WMH/blob/master/pythons) in where you will find all the python notebooks needed to analyze the data, create the reference standard masks, compute the metrics and do the evaluation. Then, there is also a set of python files used to run those codes. All the descriptions are detailend in each file and the process to run them is detailed in the `README` file.
