Christian
January 5, 2017

-   [Statistical Learning](#stat-learning)
    -   [Notes](#notes)
    -   [Exercises](#exercises)
        -   [Conceptual](#conceptual)

Statistical Learning
====================

Notes
-----

Exercises
---------

### Conceptual

**Question 1**

Indicate whether we would generally expect the performance of a flexible statistical learning method to be better or worse than an inflexible method. Justify your answer.

1.  With a large sample size *n* and a small number of predictors *p* a flexible statistical learning method will perform better than inflexible because a flexible method will have enough training data and a large parameter space to search to create a good model

2.  With a large number of predictors *p* and a small number of observations *n* an inflexible method will perform better because the solution space will be too sparse for a flexible method and it will likely over-fit. With an inflexible or parameterized method the solution space is constrained and it will likely create a more general model

3.  With a relationship between predictors and response that is highly non-linear a more flexible method will perform better because an inflexible model can't accurately model non-linear relationships (usually)

4.  With a high variance of the error terms a less flexible model will be better because a more flexible method may over-fit due to the high amount of error.

**Question 2**

Explain whether each scenario is a classification or regression problem, indicate whether we are most interested in inference or prediction and provide *n* and *p*

1.  For the CEO salary we are creating a regression problem and are interested in inference. *n* = 500, *p* = 3 (profit, \# employees, industry)

2.  With the product launch we are creating a classification problem where we are most interested in prediction. *n* = 20, *p* = 13

3.  For the Forex change are creating a regression problem we are creating a regression problem where we are most interested in prediction. *n* = 50, *p* = 3

**Question 3**

Bias-variance decomposition

``` r
library(tidyverse)
# plot bias, variance, training error, test error and Bayes/irreducible error curves going from less flexible to more flexible stat learning methods
# bias is high initially for inflexible with low var
# training error likely reduces assymptotically
# test error is U-shaped
# Bayes error is minimum dotted line
#df <- tibble(flexibility=seq(0,2*pi,0.001))
#df <- mutate(df,bias=1/flexibility+1/flexibility^(1/2),variance=flexibility^(1/2),training_error=1/flexibility + 1, test_error=1,irreducible_error=rep(1,100))
```

**Question 4**

Think of real-life applications for statistical learning, describe response & predictors, is your goal inference or prediction?

1.  For classification:

-   bcd

1.  Ibid, regression

2.  Cluster-analysis