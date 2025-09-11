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

