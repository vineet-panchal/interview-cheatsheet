# Supervised Learning: Ensemble Techniques

## Data Preprocessing: Sampling

- sampling is selecting a subset of data from the original dataset
- sampling is the main technique employed for data reduction
  - it is often used for both preliminary investigation of the data and the final data analysis
- sampling is typlically used in data mining because processing the entire set of data of interest is too expensive or time consuming

<br />

**Examples**:

- if dataset = 1000 rows
- you select 200 rows -> that is a sample

<br />

- Sampling is needed when:
- Data is large
- You want fast experiments
- You want multiple slightly different datasets (for ensemble methods)

### Types Of Sampling

**Simple Random Sampling**
- there is an equal probability of selecting any particular item
- Bootstrap Sampling: sampling without replacement
  - as each item is selected, it is removed from the population
- sampling with replacement
  - objects are not removed from the population as tehy are selected for the sample
  - in sampling with replacement, the same object can be picked up more than once

**Stratified Sampling**
- split the data into several partitions; then draw random samples from each partition

### Bootstrap Sampling: sampling without replacement

- **The Rule**: from a dataset of size n, pick n samples with replacement

**Example**:

- lets say the original dataset: ```{1, 2, 3, 4, 5}```
- the bootstrap sample may be: ```{1, 1, 2, 4, 5}```
- or: ```{2, 2, 2, 5, 1}```
- or: ```{3, 5, 5, 5, 1}```
- some items may appear multiple times, some not at all

## Ensemble Methods

##### What is Ensemble?
- an ensemble combines predictions from multiple models to produce a final output
- It works because multiple weak models can average out their scores

<br />

- Ensemble methods = using multiple classifiers, then combining them
- construct a set of base classifiers learned from the training data
- predict class label of test records by combining the rpedictions made by multiple classifiers (e.g., by taking majority vote)

<br />

**Why?**:
- a single model may be unstable 
- multiple models smooth out noise
- combined predictions are most robust

## General Approach of Ensemble Learning

**Majority vote**
- If most models say “class 1,” the final answer becomes class 1.

**Weighted vote**
- Better models get higher weight.

<img width="865" height="473" alt="Image" src="https://github.com/user-attachments/assets/330ebb7d-98e7-4b12-978a-4f831356245a" />

**Example**:
- let's say there are three classifiers
- Model 1 -> dog
- Model 2 -> dog
- Model 3 -> cat
- the majority vote would be dog

<br />

**Use many weak opinions, get a strong final decision.**

## Why do Ensemble Methods work?

- If you have many weak classifiers, each slightly better than random (error < 50%), and their errors are uncorrelated, then as you combine more of them:
  - The probability that many of them make the same mistake becomes extremely small
  - So the ensemble becomes very accurate

<br />

**Analogy**:
- Guessing jelly beans in a jar:
  - One person is inaccurate
  - The AVERAGE of 100 guesses is very accurate
- This is called the wisdom of the crowd effect.

## Some Ways to Construct Ensemble Classifiers

1. Change/Manipulate the training dataset
- **Examples:** bagging, boosting, random forests

2. Change/Manipulate the input features
- **Examples:** Random Forest -> selects random subsets of features at each split

3. Change/Manipulate the learning algorithm
- **Examples:** Neural Networks -> randomness from weight initialization

## Bagging (Boostrap AGGregatING)
- **Bagging**: train many models on many bootstrap samples
- **Bootstrap Sampling**: sampling with replacement
- **bagging round**, picks different data points
- duplicate values appear because sampling is with replacement
- this creates diversity among the models

| | | | | | | | | | | | |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| Original Data | -- | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| Bagging (Round 1) | -- | 7 | 8 | 10 | 8 | 2 | 5 | 10 | 10 | 5 | 9 |
| Bagging (Round 2) | -- | 1 | 4 | 9 | 1 | 2 | 3 | 2 | 7 | 3 | 2 |
| Bagging (Round 3) | -- | 1 | 8 | 5 | 10 | 5 | 5 | 9 | 6 | 3 | 7 |

- build classifier on each bootstrap sample

## Bagging Algorithm Steps

1. take k be the number of bootstrap samples from the dataset
2. train a model on each of these k samples
3. predict test data using each model
4. combine predictions using: 
  - Majority vote (classification)
  - Average (regression)
- Bagging reduces variance.

## Bagging Example

- consider the following 1-dimensional dataset: 

| | | | | | | | | | | | 
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| x | -- | 0.1 | 0. 2 | 0.3 | 0.4 | 0.5 | 0.6 | 0.7 | 0.8 | 0.9 | 1 |
| y | -- | 1 | 1 | 1 | -1 | -1 | -1 | -1 | 1 | 1 | 1 |

- The classifier/model used is a decision stump (decision tree of size 1)
- decision rule: x <= k versus x > k
- split point k is chosen based on entropy
- if x <= k, then class A, else class B

<br />

**Original Data**

| | | | | | | | | | | | 
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| x | -- | 0.1 | 0. 2 | 0.3 | 0.4 | 0.5 | 0.6 | 0.7 | 0.8 | 0.9 | 1 |
| y | -- | 1 | 1 | 1 | -1 | -1 | -1 | -1 | 1 | 1 | 1 |

- different bootstrap samples, different stumps

<img width="1007" height="564" alt="Image" src="https://github.com/user-attachments/assets/4a2e081c-d56c-479d-b91b-9001c2f5e89f" />

<img width="1018" height="576" alt="Image" src="https://github.com/user-attachments/assets/cee1fd89-f73f-4cd7-8a05-af0eea2bfcc4" />

- each stump differs because the bootstrap samples differ

- **The Idea**: bagging creates diversity by using randomized datasets

#### Bagging Rounds Summary Table

- summary of 10 different trained decision stumps:

| Round | Split Point | Left Class | Right Class |
| -- | -- | -- | -- |
| 1 | 0.35 | 1 | -1 |
| 2 | 0.7 | 1 | 1 |
| 3 | 0.35 | 1 | -1 |
| 4 | 0.3 | 1 | -1 |
| 5 | 0.35 | 1 | -1 |
| 6 | 0.75 | -1 | 1 |
| 7 | 0.75 | -1 | 1 |
| 8 | 0.75 | -1 | 1 |
| 9 | 0.75 | -1 | 1 |
| 10 | 0.05 | 1 | 1 |

- use majority vote (sign of sum of predictions) to determine class of ensemble classifier

<img width="1007" height="409" alt="Image" src="https://github.com/user-attachments/assets/46680571-27ab-4ddb-ad0d-045cb4bda813" />

- To predict a new sample:
1. Compute the output of all 10 decision stumps
2. Combine them:

- Majority vote -> Final class = most common vote
- OR, using sign:

$$\hat{y} = \text{sign}\left(\sum_{t=1}^T h_t(x)\right)$$

- bagging reduces overfitting for unstable models like trees
- bagging can also increase teh complexity (representation capacity) of simple classifiers such as decision stumps

## Boosting

- boosting is different from bagging:
  - **Bagging** -> parallel models
  - **Boosting** -> sequential models
- in boosting,
  - each round focuses on mistakes from the previous round
  - misclassified points gain higher weight
  - correct ones lose weight
- thus, boosting builds progressively stronger classifiers

<br />

- boosting is an iterative procedure to adaptively change distribution of training data by focusing more on previously misclassified records
  - initially, all N records are assigned equal weights (for being selected for training)
  - unlike bagging, weights may change at the end of each boosting round

<br />

- records that are wrongly classified will have their weights increased in the next round
- records that are classified correctly will have their weights decreased in the next round

| | | | | | | | | | | |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| Original Data | -- | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| Boosting (Round 1) | 7 | 3 | 2 | 8 | 7 | 9 | 4 | 10 | 6 | 3 |
| Boosting (Round 2) | 5 | 4 | 9 | 4 | 2 | 5 | 1 | 7 | 4 | 2 |
| Boosting (Round 3) | 4 | 4 | 8 | 10 | 4 | 5 | 4 | 6 | 3 | 4 |

## AdaBoost: Weighted Error & Classifier Weight

**Weighted Error**
- the weighted error is the sum of weights of misclassified points

$$\epsilon = \sum_i w_i \, I(y_i \ne h(x_i))$$

**Classifier Weight (α)**
- if ε is the weighted error, then classifier "importance" =

$$\alpha = \frac{1}{2}\ln\left(\frac{1-\epsilon}{\epsilon}\right)$$

**Interpretation**:
- If ε is small → α is large → classifier is strong
- If ε = 0.5 → α = 0 → classifier is useless
- If ε > 0.5 → α is negative → meaning classifier is worse than random

## AdaBoost: Weight Update Rule

- if classifier predicts correctly, weights decrease

$$w_i \leftarrow w_i e^{-\alpha}$$

- if classifier predicts incorrectly, weights increase

$$w_i \leftarrow w_i e^{\alpha}$$

## AdaBoost Algorithm

1. Intialize all weights equally
2. Train weak classifier
3. Compute weighted error ε
4. Compute α
5. Update weights
6. Normalize weights
7. add classifier to final model
8. Repeat

- this process builds a strong classifier by combining many weak classifiers

## AdaBoost Example

**Original Data**

| | | | | | | | | | | | 
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| x | -- | 0.1 | 0.2 | 0.3 | 0.4 | 0.5 | 0.6 | 0.7 | 0.8 | 0.9 | 1 |
| y | -- | 1 | 1 | 1 | -1 | -1 | -1 | -1 | 1 | 1 | 1 |

<img width="1018" height="513" alt="Image" src="https://github.com/user-attachments/assets/85370e00-5892-45b8-8fd6-ba939a075d20" />

- Shows 3 consecutive boosting rounds:
  - Round 1 → sample reflects equal weights
  - Round 2 → misclassified points appear more often
  - Round 3 → again weights adapt
- This shows adaptive resampling.

<img width="1020" height="467" alt="Image" src="https://github.com/user-attachments/assets/2d448fc2-506e-41f0-bbba-c08a78291cb9" />

**Boosting progressively learns a better boundary focusing on difficult points.**

- Construct an ensemble of decision trees by manipulating training set as well as features
  - Use bootstrap sample to train every decision tree (similar to Bagging)
  - Use the following tree induction algorithm:
    - At every internal node of decision tree, randomly sample p attributes for selecting split criterion
    - Repeat this procedure until all leaves are pure