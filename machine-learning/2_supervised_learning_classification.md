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
