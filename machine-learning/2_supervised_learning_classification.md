# Supervised Learning: Classification

- supervised learning has two main tasks: 
  1. ***Classification***: predict categories
  2. ***Regression***: predict continuous values

#### Examples
| Examples | Type |
| -- | -- |
| Predicting if a person will default on a loan | Classification |
| Predicting house prices | Regression |
| Determining if an email is spam or not | Classification |
| Predicting future stock price | Regression |

#### Rule of Thumb:
- if the output is a label (e.g., "Yes/No", "Cat/Dog") -> Classification
- if the output is a number (e.g., 10.5, $200k, 75%) -> Regression

## Classification
- task of assigning objects to one of several predefined categories also known as class
***predict categories***
<br />

#### Goal
- finding a model to map each attribute to a predefined class, so that we can use this model on new records to assign them to a class as accurately as possible in future
- in simpler terms, find a model (or function) that maps input attributes -> correct class labels, then use it to predict new, unseen data

#### Example
| Income | Homeowner | Marital Status | Creditworthy |
| -- | -- | -- | -- |
| 90K | No | Single | Yes |
| 60K | No | Married | No | 

- we can have a rule like: 
  - if income < 80K -> No
  - if income > 80K and Single -> Yes
- that rule (or model) can then classify new people

## Terminology

***Dataset*** -> a collection of data objects
- ***Examples***: 10 customer records

<br />

***Instance / Record / Point / Case / Sample / Entity*** -> an object, a row in a dataset
- ***Examples***: One person's info

<br />

***Attribute / Feature*** -> property or characteristic describing an instance/object
- ***Examples***: eye color of a person, temperature, age, income, marital status, etc.
- attribute is also known as a variable, field, characteristic, dimension, or feature

<br />

***Target Concept*** -> the true mapping function you want to learn
- inference of the concept from the training instances so that it maps inputs with outputs
- ***Examples***: "Creditworthy = ?"

<br />

***Training Set*** -> the set of instances that are used to figure out the target concept
- includes the inputs and output pairs
- it is the data used to teach the model
- ***Examples***: 80% of dataset

<br />

***Inductive Learning*** -> gives lots of examples of instances, and what their labels are
- the goal is to generalize these examples

<br />

***Candidate Concept*** -> a potential hypothesis for the target concept, a concept that might tbe the target concept
- ***Examples***: "if income > 90K -> Yes"

<br />

***Test Set*** -> the set of instances that are used to evaluate the candidate concept
- it is the data used to test the model
- test and training set should have different instances for unbiased evaluation

<br />

***Training = "learning"***
***Testing = "checking how well it learned"***

<img width="325" height="333" alt="Image" src="https://github.com/user-attachments/assets/a198d37f-11d6-40f2-9ad4-015dec8f337e" />


## Classification: Definition
Task: 
- learn a model that maps each attribute set ```x``` into one of the predefined class labels ```y```
<br />

Given a colleciton of instances (training set)
- each instance is by characterized by a tuple ```(x, y)```, where ```x``` is the attribute set and ```y``` is the class label
  - ***```x```***: attribute, independent variable, input
  - ***```y```***: class, response, dependent variable, output

<br />

In Simpler terms, mathematically:
- you have input ```x``` (attributes)
- and output ```y``` (class labels)
- you want to learn a function ```f(x) = y```

<br />

Example:
```
x = (income = 100K, homeowner = No, married = Yes)
y = No
```
- you train a model to predict ```y``` from ```x``` for unseen data

## Examples of Classification Task
| Task | Attribute set, ```x``` | Class label, ```y``` |
| -- | -- | -- | 
| Email Classification: Categorizing email messages | word frequency, subject, sender: features extracted from email message header and content | spam or non-spam |
| Identifying tumor cells | size, shape, texture: features extracted from medical images | malignant or benign cells |

## Classification Techniques/Algorithms
These are the main families of algorithms:
- Decision Trees
- Neural Networks
- Ensemble methods (Boosting, Bagging)
- Support Vector Machines (SVM)
- Bayesian Learning / Naive Bayes
- Rule-based Methods
- Nearest-neighbor (KNN)

## General Approach for Building Classification Model

Process:
1. Split data into training and test sets
2. Use a learning algorithm (e.g., Decision Tree) to learn patterns
3. Apply the model on new (test) data to predict classes

<img width="585" height="403" alt="Image" src="https://github.com/user-attachments/assets/c7907b94-b30a-49f7-a1c0-7ef2b34d266c" />

## Example of a Decision Tree

<img width="639" height="372" alt="Image" src="https://github.com/user-attachments/assets/83ac5512-70c9-4ce4-b354-ef5d84ebca30" />

## Apply Model to Test Data

<img width="528" height="341" alt="Image" src="https://github.com/user-attachments/assets/9d938530-3a98-462e-b565-686ef1591eaa" />

<img width="538" height="325" alt="Image" src="https://github.com/user-attachments/assets/57a50be6-43ea-47c4-b4d7-e1bdd062f826" />

<img width="543" height="319" alt="Image" src="https://github.com/user-attachments/assets/30be9782-b346-45cb-8b64-e5b30e2594cf" />

<img width="550" height="322" alt="Image" src="https://github.com/user-attachments/assets/f6fe5bc8-6048-472a-a3e9-b8dff8fe5ada" />

<img width="552" height="322" alt="Image" src="https://github.com/user-attachments/assets/6a250f80-64b6-4f76-91a7-a6e619a7a2c1" />

<img width="599" height="325" alt="Image" src="https://github.com/user-attachments/assets/961ea53e-243e-4eb5-a5d8-fa47df627075" />

## Another Example of Decision Tree

<img width="701" height="338" alt="Image" src="https://github.com/user-attachments/assets/cbf60ec8-7a6c-48b0-94bd-764e067d7544" />


## General Strcuture of Hunt's Algorithm
- Let ```Dt``` be the set of training instances that reac a node ```t```

General Procedure:
1. if ```Dt``` contains instances that belong the same class ```yt```, then ```t``` is a leaf node labeled with class ```yt```
2. if ```Dt``` contains records that belong to more than one class, use an attribute to split the data into smaller subsets
3. recursively apply the procedure to each subset

<br />

Simpler Idea:
1. Start with all data at the root
2. If all instances have the same class -> stop
3. Else, pick the ***best attribute*** to split on
4. Split the data -> create branches
5. Repeat for each branch (recursively)

<br />

This process continues until: 
- all data in a node are the same class, or
- no more attributes to split on

<img width="801" height="436" alt="Image" src="https://github.com/user-attachments/assets/01d33f47-39fd-44c0-b028-d6377f92b753" />

## Design Issues of Decision Tree Induction
- how should training instances be split?
  - method for expressing test conditions
  - measure for evaluating the goodness of a test condition

- how should the splitting procedure stop?

## How Should Training Instances Be Split?

#### Test Conditions
- Multi-way splits
  - use as many partitions as distinct values

<img width="487" height="153" alt="Image" src="https://github.com/user-attachments/assets/890d77f4-583f-44c3-945c-96d0c02fac24" />

- Binary split:
  - divides values into two subsets
  - preserve order property among attribute values
  - this grouping violates order property among attribute values

<img width="412" height="169" alt="Image" src="https://github.com/user-attachments/assets/7041a774-056a-4317-9fb9-894fcb5deb6a" />


## How To Select the Best Split?
- how do we decide which attribute is the best to split on?
- we need a measure of ***purity*** or ***impurity***
<br />

Greedy approach: select the attribute that most effectively splits the data into subsets enriched in one class or the other
- nodes with purer class distributions are preferred
- need a measure of node impurity

<br />
Imagine: 
- Node A: 5 Yes, 5 No -> Impure
- Node B: 9 Yes, 1 No -> Purer

<br />
- we want splits that make nodes as pure as possible

### Measures Of Node Impurity
Common Impurity Measures:

***Gini Index***:
```
               (c-1)
Gini Index = 1 - ∑ pi(t)^2
               (i=0)
```

***Entropy***:
```
          (c-1)
Entropy = - ∑ pi(t)(log2)pi(t)
          (i=0)
```

***Classification Error***:
```
Classification Error = 1 - max[pi(t)]
```

## Entropy

- entropy at give node ```t```: 

```
          (c-1)
Entropy = - ∑ pi(t)(log2)pi(t)
          (i=0)
```
- where ***pi(t)*** is the frequency of class ***i*** at node ***t***, and ***c*** is the total number of classes

  - ***Maximum*** of ```log2(c)``` when records are equally distributed among all classes, implying the least beneficial situation for classification

  - ***Minimum*** of 0 when all records belong to one class, implying most beneficial situation for classification


### Computing Entropy of a Single Node

```
          (c-1)
Entropy = - ∑ pi(t)(log2)pi(t)
          (i=0)
```

#### Example 1: 
| C1 | 0 |
| -- | -- |
| C2 | 6 |

```
P(C1) = 0/6 = 0
P(C2) = 6/6 = 1
Entropy = -(0)log0 - (1)log1 = - 0 - 0 = 0
```
- in practical implementations, if any probability is 0, the entropy calculation shoudl simply ignore that term

#### Example 2
| C1 | 1 |
| -- | -- |
| C2 | 5 |

```
P(C1) = 1/6
P(C2) = 5/6
Entropy = - (1/6)log2(1/6) - (5/6)log2(5/6) = 0.65
```

#### Example 3
| C1 | 2 |
| -- | -- |
| C2 | 4 |

```
P(C1) = 2/6
P(C2) = 4/6
Entropy = - (2/6)log2(2/6) - (4/6)log2(4/6) = 0.92
```

#### Key Idea:
- Entropy = 0 -> node is pure (all one class)
- Entropy = 1 -> node is mixed (50/50 classes)


## How Should Training Instances Be Split?

### Finding the Best Split

1. Compute impurity measure (P) before splitting
2. Compute impurity measure (M) after splitting
  - compute impurity measure of each child node
  - M is the weighted impurity of child nodes
3. Choose the attribute test condition that produces the highest gain
```
Gain = P - M
```
  - or equivalently, lowest impurity measure after splitting (M)


<img width="562" height="322" alt="Image" src="https://github.com/user-attachments/assets/6313a906-1d33-48a9-9e60-554db73f8aca" />


## Computing Entropy for a Collection of Nodes

- when a node ```p``` is split into ```k``` partitions (children)

```
                (k)
Entropy(split) = ∑ (ni/n)Entropy(i)
               (i=1)
```
where, 
- ```ni``` = number of records at child ```i```
- ```n``` = number of records at parent node ```p```

## Computing Information Gain After Splitting
- when you split, you want the largest drop in Entropy

```
Gain = Entropy(parent) - WeightedAverage(Entropy(children))

                          (k)
Gain(split) = Entropy(p) - ∑ (ni/n)Entropy(i)
                         (i=1)
```
- parent node, ```p``` is split into ```k``` partitions (children)
- ```ni``` is the number of records in child node ```i```

- choose the split that achieves most reduction (maximizes GAIN)

### Binary Attributes: Computing Entropy
```
                (k)
Entropy(split) = ∑ (ni/n)Entropy(i)
               (i=1)

                          (k)
Gain(split) = Entropy(p) - ∑ (ni/n)Entropy(i)
                         (i=1)
```

| | Parent |
| -- | -- |
| C1 | 7 |
| C2 | 5 |
Entropy = 0.980

| | N1 | N2 |
| -- | -- | -- |
| C1 | 5 | 2 |
| C2 | 1 | 4 |
Entropy = 0.785

```
         A?
 (Yes) /    \ (No)
 Node N1     Node N2
```

```
Entropy(N1) = -(5/6)log(5/6) - (1/6)log(1/6) = 0.65

Entropy(N2) = -(2/6)log(2/6) - (4/6)log(4/6) = 0.92

Weighted Entropy of N1 & N2
= 6/12 * 0.65 + 6/12 * 0.92
= 0.785

Gain = 0.0980 - 0.785 = 0.195
```
***Higher Gain = Better Split***

## Continuous Attributes: Computing Entropy
- for numeric data (like income), we find a threshold

Steps:
1. Sort values
2. Try split points between them (e.g., 70K, 85K, 100K)
3. Compute entropy for each split
4. Choose the one with the lowest entropy (highest information gain)

***Best threshold gives purest groups***

<img width="299" height="297" alt="Image" src="https://github.com/user-attachments/assets/e7b251b0-0b14-4c68-906e-7bdf34654a2f" />

- use binary decisions based on one value

<img width="246" height="144" alt="Image" src="https://github.com/user-attachments/assets/5a44abde-bb2a-428c-99a8-8c0beeb2dfbc" />

- for efficient computation: for each attribute, 
  - sort the attribute on values

<img width="654" height="113" alt="Image" src="https://github.com/user-attachments/assets/67f427c6-5ac1-47df-8d11-b68950da90ba" />

  - the candidate split values are halfway between two sorted values

<img width="637" height="125" alt="Image" src="https://github.com/user-attachments/assets/a9f5e918-c2d1-43e6-877d-3196fcdca6ec" />

  - compute the entropy for each candidate split values

<img width="642" height="219" alt="Image" src="https://github.com/user-attachments/assets/e71eb0db-2c0a-4326-b8c8-e33ea6398119" />

<img width="654" height="218" alt="Image" src="https://github.com/user-attachments/assets/c0748987-994b-4e3f-be53-392cc4331faa" />

  - choose the split position that has the least entropy

<img width="641" height="210" alt="Image" src="https://github.com/user-attachments/assets/31dc6315-761f-4f0b-912e-fc8c07f14689" />


## Problem with large number of partitions
- if you split too finely (like by Customer ID), every node becomes pure (one record each).
- that's called ***overfitting***, the tree memorizes data instead of learning patterns

- Node impurity measures tend to prefer splits that result in large number of partitions, each being small but pure

<img width="546" height="131" alt="Image" src="https://github.com/user-attachments/assets/6b843235-6b4c-4139-9818-edd039b597ea" />

## Gain Ratio
- to fix overfitting, we use Gain Ratio, which adjusts for splits that create too many tiny branches
```
Gain Ratio = Gain(split) / Split Info

               (k)
Split Info. = - ∑ (ni/n)log2(ni/n)
              (i=1)
```
- Split Info measures how "spread out" the data is among child nodes
- Parent Node, ```p``` is split into ```k``` partitions (children)
- ```n``` is the number of instances in parent node
- ```ni``` is the number of instances in child node ```i```

***reward good splits, penalize overly complex ones***
<br />

- Adjusts Information Gain by the uncertainty of the split (Split Info)
***Larger number of small partitions is penalized***
- Designed to overcome the disadvantage of Information Gain

<img width="675" height="149" alt="Image" src="https://github.com/user-attachments/assets/0e18c905-3b46-485c-a802-8829bdbb0ec5" />

## Design Issues Of Decision Tree Induction
- How should training records be split?
  - method for expressing test condition
  ***depending on attribute types***
  - measure for evaluating the goodness of a test condition
- How should the splitting procedure stop?

## Stopping Criteria for Tree Induction
When do we stop growing the tree: 
- all instances in a node belong to the same class
  - stop expanding a node when all the instances belong to the same class
- no attribute left to split on
- stop expanding a node when all the instances have similar attribute values
- early termination when number of instances below minimum threshold

## Decision Tree Based Classification
- Advantages:
  - relatively inexpensive to construct
  - extremely fast at classifying unknown records
  - easy to interpret for small-sized trees
  - robust to noise (especially when methods to avoid overfitting are employed)
  - can easily handle redudant attributes
  - can easily handle irrelevant attributes (unless the attributes are interacting)

- Disadvantages:
  - greedy nature of splitting criterion: attributes that can distinguish between classes together but not individually, may be passed over in favor of other attributes
  - each decision boundary involves only a single attribute


# Summary
| Concept | Meaning | Example | 
| -- | -- | -- |
| Classification | Predict discrete labels | Spam vs not Spam |
| Regression | Predict continuous values | House prices |
| Entropy | Measures impurity | 0 = pure, 1 = mixed/impure |
| Information Gain | Drop in entropy after a split | Gain = Parent - Child | 
| Gain Ratio | Adjusted info gain (avoids overfitting) | Penalizes many small branches |
| Decision Tree | Splits data based on attribute conditions | "If income > 80K -> Yes" |
| Hunt's Algorithm | Recursively splits data until pure | Builds the decision tree |
| Stopping Criteria | When to stop splitting | All same class or no data left |