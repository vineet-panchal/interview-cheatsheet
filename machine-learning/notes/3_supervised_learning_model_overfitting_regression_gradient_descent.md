# Supervised Learning: Model Overfitting, Regression, and Gradient Descent

## Example Data Set

<img width="630" height="334" alt="Image" src="https://github.com/user-attachments/assets/f043abe2-36dd-4e9b-ab07-23be7cbbda4b" />

- small training sets + noise -> higher chance of overfitting if model is too complex.

## Decision Tree With 4 Nodes

- the following shows a simple tree with coarse decision boundaries

<img width="603" height="371" alt="Image" src="https://github.com/user-attachments/assets/67ef38d4-5d5b-4471-be8c-0ce81566d4fa" />

<img width="635" height="369" alt="Image" src="https://github.com/user-attachments/assets/65d3755e-d15e-4750-bd3d-3ccc54e61527" />

- ***Interpretation***: underfits complex structure, training error might be non-zero, but generalization could be okay if true pattern is simple
- few nodes -> simple model -> low variance, possible bias

## Decision Tree With 50 Nodes

- the following shows a complex tree carving very detailed regions to fit training points

<img width="618" height="375" alt="Image" src="https://github.com/user-attachments/assets/6410388b-f793-49fd-a981-ee1ac4a3cb3b" />

- ***Interpretation***: likely perfect or near-perfect training fit, but risky, may not generalize
- many nodes -> high model variance -> overfitting risk

## Which Tree Is Better?

- ***Contrast Question***: there is no free lunch, "better" depends on test error, not training error

<img width="626" height="377" alt="Image" src="https://github.com/user-attachments/assets/9a169436-12af-471f-88f4-b537c60fe5e0" />

***always prefer the model with lower expected test (generalization) error, not the lowest training error***


## Model Underfitting and Overfitting

<img width="658" height="251" alt="Image" src="https://github.com/user-attachments/assets/d8aa2720-7977-4330-b070-7279b9f35ffa" />

- as the model becomes more and more complex, test errors can start increasing even though training error may be decreasing

- ***Graphical Intuition***: training error decreases monotonically with complexity; test error typically has a U-shape (decreases then increases)

- optimal complexity at bottom of test error curve (bias-variance tradeoff)

<br />

***Underfitting***
- model is too simple, both training and test errors are large

<br />

***Overfitting***:
- model is too complex, training error is small but test error is large


## Reasons For Model Overfitting
- not enough training data (model learns noise)
- high model complexity (too many parameters, flexible model)

<br />

***Practical Implication***:
- get more data, reduce model complexity, or use regularization


## Classification Errors

***Training Errors*** -> errors committed on the training set

<br />

***Test Errors*** -> errors committed on the test set

```
Error Rate = Number of incorrect predictions / Total predictions
```

## Model Evaluation

***Purpose***:
- to estimate performance of classifier on previously unseen data (test set)

<br />

***Holdout***
- reserve k% for training and (100-k)% for testing
- repeated holdout, optionally repeat with different random splits
- ***When used***: quick and simple, but high variance in small datasets

<br />

***Cross Validation***
- partition data into k disjoin subsets
- ***k-fold***: train on k-1 partitions, test on the remaining one
- ***Leave-one-out***: k=n

## Cross-Validation Example

K-fold Cross-Validation: 
- partition data into k subsets
- train on k-1 folds, test on the remaining fold; repeat k times; average performance

<br/>

***Benefits***: lower variance estimate than one holdout split.

<br />

***Leave-one-out = k = n***

<br />

The following is an example of a 3-fold Cross-Validation (CV) runs three experiments to cover all data as test once

<img width="471" height="256" alt="Image" src="https://github.com/user-attachments/assets/56a2cd3e-bada-45fa-8136-6a14b2438e1f" />

## Variations of Cross-Validation

***Repeated Cross-Validation***
- perform cross-validation a number of times
- gives an estimate of the variance of the generalization error
- repeat CV multiple times to estimate variance of error

<br />

***Stratified Cross-Validation***
- gurantee the same percentage of class labels in training and test
- important when classes are imbalanced and the sample is small
- maintain class proportions across folds (important for imbalanced classes)

<br />

***Nested Cross-Validation***
- used for model selection and evaluation (outer loop for evaluation, inner loop for hyperparameter tuning)


## Model Selection
- there are many options: 
  - select the kind of model to deploy: best algorithm and hyperparameters
  - cannot select best model on the test set: will lead to optimistic estimate of the generalization error

<br />

- divide data into training, validation, and test sets: 
  - ***Validation Set***: 
    - use for measuring prediction error of the different models

- if you choose hyperparameters using the test set, you bias your estimate (optimistic), instead:

1. Train multiple models on training set
2. Evaluate on validation set to pick best
3. Retrain selected model on training + validation and evaluate once on final test set
4. Estimate generalization error on test set

## Variations on Cross-Validation
- use nested cross-validation approach for model selection and evaluation

- ***Example***: 3-fold nested cross-validation

<img width="597" height="258" alt="Image" src="https://github.com/user-attachments/assets/917bf986-99b7-4ab7-80f4-cf542294109c" />


## Regression
- ***Classification***: the output is categorical, discrete labels
- ***Regression***: the output is continuous, ```y∈R```

```
Input Vector: X^T = (x1, x2, ... , xp)
```
- output ```y``` has real values
- ***Goal***: find mapping to predict the output ```y``` from the input ```x```
- regression problems predict numbers (prices, temperatures)

<img width="346" height="157" alt="Image" src="https://github.com/user-attachments/assets/06783ab8-424a-4726-9c63-3320a51021b9" />

- linear regression and logistic regression

<img width="344" height="171" alt="Image" src="https://github.com/user-attachments/assets/fe17a657-e347-4859-9cd7-d80db64a630f" />


## Linear Regression

- here is an example of predicting house price from square footage

<img width="706" height="373" alt="Image" src="https://github.com/user-attachments/assets/9a9931f4-37c7-4544-88da-a3a435a7e5ef" />

Model for of linear Regression:

```
           (p)
f(X) = β0 + ∑ (xj)(βj)
          (j=1)​
```
where, 
- ***β0*** -> intercept, constant (bias)
- ***βj*** -> weighted for feature ```xj```

<br />

- use the linear model to predict output ```y``` given input ```X```
- ***Interpretation***: output is weighted sum of features plus bias

<img width="707" height="401" alt="Image" src="https://github.com/user-attachments/assets/0a674024-4929-42e6-9e8d-7c66a178bd0f" />

<br />

- the difference between the predicted and the actual outputs is the ***residue***
- ***Residue*** is frequently the ***sum of squared errors (SSE)***, aka residual sum of squares (RSS), and varies based on the weights and biases of the model

```
                  (n)
RSS(β) or SSE(β) = ∑ (yi - f(Xi))^2
                 (i=1)
```
***Goal***: find β that maximizes SSE, finding the optimized weights and biases

## Regression: Finding The Optimized Model Parameters

- the direct result using mathmatical equation: 
```
           (p)
f(X) = β0 + ∑ (xj)(βj)
          (j=1)​
```
- if arranged to matrix form: ```ŷ = X * β```, where: 
  - ```ŷ``` is the predicted value ```(f(X))```
  - ```β``` is the model's parameter vector containing the bias ```β0``` and the weights ```β1 to βp```
  - ```X``` is the feature vector ```x0 to xp```, where ```x0 = 1```

<br />

- ***Goal***: finding ```β``` so that ```ŷ``` is as 'similar' as possible to y: ```y = X * β```
- i.e. ```y = β0 + x1β1 + ... + xpβp``` and you have N instances in your dataset:

<img width="737" height="103" alt="Image" src="https://github.com/user-attachments/assets/3da3538b-a147-424d-981a-de2bebb71fdb" />

<br />

Then: 
```
Y = X * β
β = X^-1 * Y
```

## Data Quality Issues
- why is "finding ```β``` so that ```ŷ``` is as 'similar' as possible to ```y```" the goal
- training data has some errors in it
  - noise and outliers
  - fake data
  - wrong data
  - missing data

## Logistic Regression
- output is binary (True vs False, e.g.: is a client worthy or not?)
- fit data with a sigmoidal/logistic curve rather than a line
  - probability of output given the input

<img width="580" height="222" alt="Image" src="https://github.com/user-attachments/assets/f085d256-cc85-4e8f-ad71-90b9c57079b3" />

- ***Goal***: map input features to a number between 0 and 1, which is the probability of having the output value 'True'
- map linear combination to probabilty via using the sigmoid/logistic function:
```
σ(t) = 1 / (1 + (e^-t))
```
```
f(X) = 1 / (1 + e^(β0 + x1B1 + ... + xpβp))

                       (p)
f(X) = 1 / (1 + e^(β0 + ∑ (xj)(βj)))
                      (j=1)
```
- we want high probabilities when output y = 1 and low probabilities when output y = 0

#### Example
- suppose your logistic regression classifier outputs a prediction ```f(x) = 0.2``` on a new example ```x```. 

- then ```𝑃(𝑦 = 1 ∣ 𝑥) = 0.2``` and ```𝑃(𝑦 = 0 ∣ 𝑥) = 0.8```

<br />

- cost function to minimize by varying

<img width="255" height="72" alt="Image" src="https://github.com/user-attachments/assets/4e3fbad5-25ba-4ebb-95c8-60e6aac89d8c" />

- compute average cost over all training instances
- single expression called the Log Loss/Cross-Entropy:

<img width="480" height="70" alt="Image" src="https://github.com/user-attachments/assets/b99dbf08-4806-46a6-a93f-a1ddde7dae41" />

- ***Property***: convex in ```β``` (so global optimum exists). No closed form; optimize numerically (e.g., gradient descent)

- no closed-form equation to compute the value of ```β``` that minimizes this cost function
- the higher the discrepancy, the higher the cost: cost function is convex
- can use ***Gradient Descent*** (among other optimization algorithms) to find ```β``` that minimizes the cost function ```J(B)```

## Gradient Descent
- ***Gradient Descent***: iterative method to tweak the model's parameters until cost is minimized

<img width="334" height="219" alt="Image" src="https://github.com/user-attachments/assets/27a821c7-a5a5-43ef-85cb-95fed372545a" />

- suppose you want to reach the nearest village, at the bottom of a valley
  - but you cannot see (it's night, there is dense fog) and you cell phone ran out of battery
  - What would you do?
- to get to the bottom of the valley, go in the direction of the steepest slope
  - feel the slope of the ground below your feet

<img width="554" height="260" alt="Image" src="https://github.com/user-attachments/assets/7d4a5b62-9b82-46d4-903d-3762aa71cb34" />

- randomly initialize ```β``` values, then improve them iteratively, each time by decreasing the cost function
- measure the local gradient of the cost function with regards to the model's parameters ```β```
- modify the parameter ```β``` in the direction with the steepest descent of the cost
- repeat until the gradient is 0

<img width="334" height="226" alt="Image" src="https://github.com/user-attachments/assets/6c2598b9-ee8f-4161-b8ec-6cbbbacd8447" />

- examples with 2 parameters to optimize: 
- at each iteration, we simultaneously update ```β0``` and ```β1``` using the equation:

<img width="213" height="56" alt="Image" src="https://github.com/user-attachments/assets/d5ba6cbb-506e-43cc-bef7-5f513e6ec5d5" />

- for ```j=0``` and ```j=1```, where ```α``` is the learning rate (```α``` always positive)

<img width="411" height="208" alt="Image" src="https://github.com/user-attachments/assets/49f325e0-bf7b-433f-b29b-1c063566e8e3" />

- for example, suppose: 

<img width="224" height="53" alt="Image" src="https://github.com/user-attachments/assets/4489607c-926d-48ac-85ef-623b5cc1e47d" />

- what are the gradients 

<img width="112" height="52" alt="Image" src="https://github.com/user-attachments/assets/ce8b585c-149d-4966-962e-35f97b464d45" />

and

<img width="125" height="59" alt="Image" src="https://github.com/user-attachments/assets/1acd3ad4-cfa8-48fb-a3e0-4bd597b9f13b" />

<img width="431" height="80" alt="Image" src="https://github.com/user-attachments/assets/b33fc154-30b5-40bf-a230-9df95357b019" />

- suppose that ```α = 0.1``` and, initially, ```β0 = 4``` and ```β1 = 3```
- what will ```β0``` and ```β1``` be after the first iteration?

<img width="356" height="96" alt="Image" src="https://github.com/user-attachments/assets/7f1a5bb1-87cd-428b-9f61-e1ac591d299a" />

- what will ```β0``` and ```β1``` be after the 2nd iteration?

<img width="346" height="90" alt="Image" src="https://github.com/user-attachments/assets/82c67d3c-704e-4b75-991a-c9f54e4065b2" />

<img width="323" height="250" alt="Image" src="https://github.com/user-attachments/assets/20b274b6-b804-4a1b-b97f-b9a2af013fc8" />

### Gradient Descent: Summary

- ***Gradient Descent***: iterative method to tweak the model's parameters until cost is minimized
- ***Important Parameter***: learning rate. It is the size of the steps: if too small, need many iterations to converge. If too high, algorithm may diverge
- the learning rate ```α``` is always positive, and does not need to be decreased over time, because the gradient will decrease as we approach a minimum

<img width="670" height="206" alt="Image" src="https://github.com/user-attachments/assets/d2436843-17c8-4e75-ab04-26cb4fb942ef" />

<img width="699" height="292" alt="Image" src="https://github.com/user-attachments/assets/72a4a4bf-6187-41ec-ac5e-7eb6b8509af5" />

- measure the local gradient of the cost function with regards to the model's parameters ```β```
- ***Batch GD***: use the whole training set to compute the local gradients at every iteration
- ***Stochastic GD***: randomly pick a training instance to compute the local gradients at every iteration, faster algorithm, but cost function converges in erratic way
- ***Mini-Batch GD***: use small random set of instances to compute the local gradients: trade-off between batch and stochastic methods

<img width="755" height="214" alt="Image" src="https://github.com/user-attachments/assets/fc96250c-f498-4621-a335-c8fc6c37ed45" />

## Feature Transformation

- function that maps the entire set of values of a given feature to a new set of replacement values
- simple functions: ```x^k, log(x), e^x, |x|```
- Normalization / Standardization
  - refers to various techniques to adjust to differences among attributes in terms of frequency of occurrence, mean, variance, range
  - Standardization:
    ```
    χ(scaled) = χ - mean / sd
    ```
  - Normalization:
    ```
    χ(normalized) = χ - χ(min) / χ(max) - χ(min)
    ```

## Partial derivatives of the sum of squares cost function

<img width="750" height="390" alt="Image" src="https://github.com/user-attachments/assets/367496c6-4c25-45a0-afeb-bc438c2cf9e0" />

# Summary