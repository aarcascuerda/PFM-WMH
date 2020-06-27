# Python Codes

In this folder you will find all the python codes to perform the evaluation once the methods are ran on the data.

## Evaluation Process

The order in which the notebooks should be ran is the following.

1. `DataAnalytics.ipynb` to perform the analytics on the manual reference standard data.
2. `BuildReferenceStandardMasks.ipynb` to build the reference standard masks.
3. `ComputeMetrics.ipynb` to compute the metrics of the methods once the reference standard masks are build and the methods ran through the whole data.
4. `MethodsEvaluation.ipynb` to output the different evaluation plots and statistics of the methods performance.

## Python utils

Here we also added the different pythons we used to ran the previous notebooks. Those are the following three.

* `constants.py` with the constants used.
* `utils.py` with some utils needed to run the different notebooks.
* `metrics.py` with the evaluation functions.
