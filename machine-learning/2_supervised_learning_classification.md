# Supervised Learning: Classification

## Classification
- task of assigning objects to one of several predefined categories also known as class
- **Goal:** finding a model to map each attribute to a predefined class, so that we can use this model on new records to assign them to a class as accurately as possible in future

## Terminology

- a ***dataset*** is a collection of data objects
  - an object is also known as: ***instance***, ***record***, ***point***, case, sample, entity

<br />

- an ***attribute*** is a property or characteristic of an object
  - **Examples**: eye color of a person, temperature, etc.
  - attribute is also know as variable, field, characteristic, dimension, or feature

<br />

- a ***target concept*** is the function to be learned
  - inference of the concept from the training instances so that it maps inputs with outputs

<br />

- a ***training set*** is the set of instances that are used to figure out the target concept
  - includes the inputs and outputs pairs
  - **Inductive Learning**: give lots of examples of instances, and what their labels are. The goal is to generalize these examples

<br />

- a ***candidate*** is a concept that might be the target concept

<br />

- a ***test set*** is the set of instances that are used to evaluate the candidate concept
  - test and training set should have different instances for unbiased evaluation

<img width="325" height="333" alt="Image" src="https://github.com/user-attachments/assets/a198d37f-11d6-40f2-9ad4-015dec8f337e" />

## Classification: Definition
Task: 
<br />

- learn a model that maps each attribute set ```x``` into one of the predefined class labels ```y```
<br />
Given a colleciton of instances (training set)
<br />

- each instance is by characterized by a tuple ```(x, y)```, where ```x``` is the attribute set and ```y``` is the class label
  - ***```x```***: attribute, independent variable, input
  - ***```y```***: class, response, dependent variable, output

## Examples of Classification Task
| Task | Attribtue set, ```x``` | Class label, ```y``` |
| -- | -- | -- | 
| Categorizing email messages | Features extracted from email message header and content | spam or non-spam |
| Identifying tumor cells | Features extracted from medical images | malignant or benign cells |

## Classification Techniques
- Decision Trees
- Neural Networks
- Ensemble (Boosting, Bagging)
- Support Vector Machines
- Bayesian Learning
- Rule-based Methods
- Nearest-neighbor

## General Approach for Building Classification Model

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

<img width="801" height="436" alt="Image" src="https://github.com/user-attachments/assets/01d33f47-39fd-44c0-b028-d6377f92b753" />

## Design Issues of Decision Tree Induction
- how should training instances be split?
  - method for expressing test conditions
  - measure for evaluating the goodness of a test condition

- how should the splitting procedure stop?

## Test Conditions
- Multi-way splits
  - use as many partitions as distinct values

<img width="487" height="153" alt="Image" src="https://github.com/user-attachments/assets/890d77f4-583f-44c3-945c-96d0c02fac24" />

- Binary split:
  - divides values into two subsets
  - preserve order property among attribute values
  - this grouping violates order property among attribute values

<img width="412" height="169" alt="Image" src="https://github.com/user-attachments/assets/7041a774-056a-4317-9fb9-894fcb5deb6a" />


## How To Select the Best Split?
Greedy approach: select the attribute that most effectively splits the data into subsets enriched in one class or the other
- nodes with purer class distributions are preferred
- need a measure of node impurity

### Measures Of Node Impurity

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

- entropy at give node ```t```

```
          (c-1)
Entropy = - ∑ pi(t)(log2)pi(t)
          (i=0)
```
- where ***pi(t)*** is the grequency of class ***i*** at node ***t***, and ***c*** is the total number of classes

- ***Maximum*** of ```log2(c)``` when records are equally distributed among all classes, implying the least beneficial situation for classification

- ***Minimum*** of 0 when all records belong to one class, implying most beneficial situation for classification

## Computing Entropy of a Single Node

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
Entropy = -(0)log0 - (1)log1 = - 0 - 0 = 1
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

```
                          (k)
Gain(split) = Entropy(p) - ∑ (ni/n)Entropy(i)
                         (i=1)
```
- parent node, ```p``` is split into ```k``` partitions (children)
- ```ni``` is the number of records in child node ```i```

- choose the split that achieves most reduction (maximizes GAIN)

## Binary Attributes: Computing Entropy
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

## Continuous Attributes: Computing Entropy
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
- Node impurity measures tend to prefer splits that result in large number of partitions, each being small but pure

<img width="546" height="131" alt="Image" src="https://github.com/user-attachments/assets/6b843235-6b4c-4139-9818-edd039b597ea" />

## Gain Ratio

```
Gain Ratio = Gain(split) / Split Info

               (k)
Split Info. = - ∑ (ni/n)log2(ni/n)
              (i=1)
```
- Parent Node, ```p``` is split into ```k``` partitions (children)
- ```n``` is the number of instances in parent node
- ```ni``` is the number of instances in child node ```i```
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
- stop expanding a node when all the instances belong to the same class
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