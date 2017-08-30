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

-   Predicting who will purchase a product: response ~ conversions, predictors ~ demographics (age, sex, location) + behavior (clicks/views of site, usage of other products, etc.). Goal is inference to better target
-   Predicting who will click on an ad: response ~ conversions, predictors ~ similar to above, but goal is just prediction to better deliver advertising, additional features could be added even if they don't help intuition
-   Medical Diagnosis: response ~ disease/not disease, predictors ~ depending on domain, but could be demographics, behavior (e.g. diet, exercise), test results (e.g. cholesterol levels), goal is prediction as simply trying to deliver an accurate diagnosis

1.  Ibid, regression

-   Forecasting sales of watermelons: response ~ sales, predictors ~ temperature, date (seasonality effects), price of product. Goal is inference to better understand consumer demand so product isn't wasted or short of supply and promotions can be planned.
-   Predicting tax liability for IRS: response ~ tax owed, predictors ~ features from 1040, other tax forms, history of prior tax filings. Goal is prediction, can regress predicted tax liability against actual to determine when/if to launch an audit
-   Predicting score of basketball game: response ~ final score, predictors ~ team features (wins, losses, margins, etc.), player info like injuries, starting lineup. Goal is prediction for purposes of gambling.

1.  Cluster-analysis

-   Finding similar groups of people to those who are currently customers to target for marketing
-   Identifying characteristics of different pathologies, e.g. tumorous cells have a bunch of different gene markers, what other cells have similar markers?
-   Exploratory analysis to understand what features might be important/relevant in constructing a model

**Question 5**

What are the advantages and disadvantages of a very flexible (vs less flexible) approach for regression or classification? Under what circumstances might a more flexible approach be preferred?

A more flexible approach (often) has the benefit of being a better fitting model (ie less bias), meaning better predictions. However, there can be some disadvantages if that model becomes very complex and less generalizeable AND potentially it is prone to overfitting. A more flexible approach may be preferred when there is a greater emphasis on predictive performance vs model inference, when there is ample data (to prevent overfitting) and if the behavior being modeled is complex, so that a less flexible model wouldn't be a good representation.

**Question 6**

Describe the differences between a parametric and non-parametric statistical learning approach. What are the advantages/disadvantages (vs non-parametric)?

A parametric learning approach means that a functional form for a model is specified to describe the relationship, then parameters of that model are estimated given the training data. By contrast a non-parametric approach don't make any assumptions about the form/model of the relationship and try to estimate some function that fits the data as closely as possible. The benefits of a parametric approach are that the model is generally more interpretable, giving more inferential power, and that it may be more generalizeable; however parametric approaches may not be able to fit the data as well and cannot necessarily fit to more complex functions.

**Question 7**

The table below provides a training data set containting six observations, three predictors and one qualitative response variable.

``` r
tmp <- data.frame(x1=c(0,2,0,0,-1,1),x2=c(3,0,1,1,0,1),x3=c(0,0,3,2,1,1),y=c('Red','Red','Red','Green','Green','Red'))
tmp
```

    ##   x1 x2 x3     y
    ## 1  0  3  0   Red
    ## 2  2  0  0   Red
    ## 3  0  1  3   Red
    ## 4  0  1  2 Green
    ## 5 -1  0  1 Green
    ## 6  1  1  1   Red

Suppose we wish to use this data set to make a prediction for *Y* when X1 = X2 = X3 = 0 using K-nearest neighbors.

1.  Compute the Euclidean distance between each observation and the test point, X1 = X2 = X3 = 0

``` r
tmp$distance <- ((tmp$x1 - 0)^2 + (tmp$x2 - 0)^2 + (tmp$x3 - 0)^2)^(1/2)
tmp
```

    ##   x1 x2 x3     y distance
    ## 1  0  3  0   Red 3.000000
    ## 2  2  0  0   Red 2.000000
    ## 3  0  1  3   Red 3.162278
    ## 4  0  1  2 Green 2.236068
    ## 5 -1  0  1 Green 1.414214
    ## 6  1  1  1   Red 1.732051

1.  What is our prediction with K=1? Why?

Our prediction is `Green` because that is the single closest observation (distance of 1.414)

1.  What is our prediction with K=3? Why?

Prediction of `Red` because our closes observations are 2, 5 and 6 which are `Red`, `Green` and `Red` thus by simple majority we go with `Red`

1.  If the Bayes decision boundary in this problem is highly non-linear then would we expect the *best* value for K to be large or small? Why?

Small K because the decision boundary needs to be very flexible to accomidate the non-linearity; a large K would produce a less flexible model that is unlikely to fit the complex data well.
