# Supervised Learning: Alternative Classification Methods

## Support Vector Machines (SVM)

<img width="308" height="299" alt="Image" src="https://github.com/user-attachments/assets/0b82fc64-9dca-4398-9fb0-c537a93580da" />

- find a linear hyperplane (decision boundary) that will seperate the data
- One possible solution: 

<img width="331" height="308" alt="Image" src="https://github.com/user-attachments/assets/d1ee45b6-e563-48dc-9175-e6e4a7f0fd00" />

- Another possible solution:

<img width="355" height="305" alt="Image" src="https://github.com/user-attachments/assets/8d4cabc0-fb56-4b25-8473-2de004d9a346" />

- Other possible solutions:

<img width="382" height="306" alt="Image" src="https://github.com/user-attachments/assets/7e166767-5861-4975-8bb7-3435abc32335" />

- which one is better? B1 or B2?

<img width="324" height="305" alt="Image" src="https://github.com/user-attachments/assets/2edf2e1c-856e-4d59-bec6-e419fa4349af" />

- How do you define better?
- find hyperplane maximizes the margin => B1 is better than B2

<img width="353" height="318" alt="Image" src="https://github.com/user-attachments/assets/0740c2d0-03d3-4fb2-b2da-9015677b0b7f" />

- hard margin classificaiton: instances should be linearly separable

<img width="555" height="305" alt="Image" src="https://github.com/user-attachments/assets/6c92136b-b3cf-4600-83e5-abcbc499466c" />

- what if the problem is not linearly separable?

<img width="315" height="299" alt="Image" src="https://github.com/user-attachments/assets/b115eda5-298e-4cab-9ece-ca3c8365f9af" />

- ***Soft margins***: balance between keeping. margins as large as possible & limiting margin violations
- balance through the 'C' hyperparameter. Default value: 1
- ***Small c values***: large margins, but higher training errors => prioritize simplicity
- ***Larger c values***: emphasis on minimizing the training error, but smaller margins
- what if the decision boundary is not linear?

<img width="385" height="298" alt="Image" src="https://github.com/user-attachments/assets/aa05098e-40d0-45ff-bb84-e064f11b6e8a" />

- ***Idea***: transform data into higher dimensional space so taht it is linearly separable by a hyperplane

<img width="386" height="311" alt="Image" src="https://github.com/user-attachments/assets/236ce098-a4f9-458d-b2d8-1989dc02d957" />

<br />

- rather than run SVM on data X, run it on mapped data ```Φ(X)```
- what mapping function ```Φ``` should be used?
- many functions may linearly separate the data in higher dimensions
- in reality, data has many features -> need to find and use functions with complex combinations to properly separate the data -> very high computational costs

<br />

- compute the pairwise dot product between the data vectors
- the dot product gives a notion of similarity between the data vectors

<img width="345" height="116" alt="Image" src="https://github.com/user-attachments/assets/21082776-369d-4d88-88b0-8f8e0282e3ff" />

<img width="376" height="306" alt="Image" src="https://github.com/user-attachments/assets/f5a902e8-c97b-4318-a3bc-f65f3711317f" />

<br />

- ***Kernel trick***: less expensive
- a kernel function computes the relationsips (similarity) between each data points, as if these data points had been transformed to higher dimensions
- the data set is now represented by an n * n kernel matrix of pairwise similarity comparisons

<img width="355" height="115" alt="Image" src="https://github.com/user-attachments/assets/39550a66-7149-40c1-af95-774a6a4e0cec" />

- some kernel options: 

<img width="392" height="106" alt="Image" src="https://github.com/user-attachments/assets/4860b5fe-b337-48d0-9ea8-ad1e8ec3b6c0" />

- these similarities are used to separate the data using the simple linear method

<img width="706" height="326" alt="Image" src="https://github.com/user-attachments/assets/5f5a0e8f-7844-4141-91c5-848124e0cc6a" />

#### Why is the kernel trick a trick?

- because the relationship between the data points is directly computed as if the data points had been transformed to higher dimensions, but without actually transforming these points
  - we only plug information (parameters and feature values)
  - this gives us the similarity between the points as if tehy had been transformed
  - the similarity is used to separate the points using the simple linear SVM method

## Naïve Bayes
- a probabilitic framework for solving classification problems
- Bayes Theorm:

<img width="261" height="70" alt="Image" src="https://github.com/user-attachments/assets/6ea2a32a-5cab-4cde-addd-a8b0449169ad" />

- ```P(Y|X)``` is the posterior probability of class ```Y``` given the attribute ```X```
- ```P(X|Y)``` is the likelihood of the attribute ```X``` given the class ```Y```
- ```P(Y)``` is the prior probability of the class
- ```P(X)``` is the prior probability of the attribute

<br />

- given an instance with attributes ```(X1, X2, ... , Xd)```, the goal is to predict class ```Y```
  - specifically, we want to find the value of ```Y``` that maximizes ```P(Y|X1, X2, ... , Xd)```

<br />

***Approach***:
- compute posterior probability ```P(Y|X1, X2, ... , Xd)``` using the Bayes theorem

<img width="420" height="55" alt="Image" src="https://github.com/user-attachments/assets/08a1a9bc-9b26-4b56-86b9-6d190f69d502" />

- maximum a-posteriori: Choose ```Y``` that maximizes ```P(Y|X1, X2, ... , Xd)```
- equivalent to choosing value of ```Y``` that maximizes ```P(Y|X1, X2, ... , Xd)P(Y)```

#### Example
- you are given the test record ```X = (Refund = No, Divorced, Income = 120K)```

<img width="345" height="409" alt="Image" src="https://github.com/user-attachments/assets/1ffea9bd-384e-401e-94fe-7726a078106d" />

- using Bayes Theorem:

```
P(Yes | X) = P(X | Yes)P(Yes) / P(X)

P(No | X) = P(X | No)P(No) / P(X)
```

```
P(Y) = fraction of instances of class Y
P(No) = 7 / 10
P(Yes) = 3 / 10
```
How to estimate ```P(X | Yes) and P(X | No)?

<br />

- assume independence among attributes ```Xi``` when class is given:
```
P(X1, X2, ... , Xd | Yj) = P(X1 | Yj) * P(X2 | Yj) * ... * P(Xd | Yj)
```

<br />

Estimates:
```
P(X | Yes) = 
  P(Refund = No | Yes) *
  P(Divorced | Yes) *
  P(Income = 120K | Yes)

P(X | No) =
  P(Refund = No | No) *
  P(Divorced | No) *
  P(Income = 120K | No)
```

- for categorical attributes:
```
P(Xi = c | y) = nc / n
```
- where ```nc``` is the number of instances having attribute value ```Xi = c``` and belonging to class ```y```
- ```n``` is the number of instances belonging to class ```y```
- Example:
```P(Status = Married | No) = 4 / 7```

<br />

- for continuous attributes:
- ***Discretization***: Partition the range into partitions:
  - replace continuous value with partition value
  - attribute changed from continuous to ordinal
- ***Probability density estimation***:
  - assume attribute follows a normal distribution
  - use data to estimate parameters of distribution (e.g., mean and standard deviation)
  - once probability distribution is known, use it to estimate the conditional probability ```P(Xi | Y)```

<img width="351" height="175" alt="Image" src="https://github.com/user-attachments/assets/32db282c-f992-47c4-a4f5-da14df4491df" />

### Example

<img width="253" height="297" alt="Image" src="https://github.com/user-attachments/assets/1b02cf79-03dc-4c62-bb17-bda2f5b4c202" />

#### Naïve Bayes Classifier:
```
P(Refund = Yes | No) = 3 / 7
P(Refund = No | No) = 4 / 7
P(Refund = Yes | Yes) = 0
P(Refund = No | Yes) = 1
P(Marital Status = Single | No) = 2 / 7
P(Marital Status = Divorced | No) = 1 / 7
P(Marital Status = Married | No) = 4 / 7
P(Marital Status = Single | Yes) = 2 / 3
P(Marital Status = Divorced | Yes) = 1 / 3
P(Marital Status = Married | Yes) = 0

For Taxable Income: 
if class = No: sample mean = 110k
          sample variance = 2975
if class = Yes: sample mean = 90k
          sample variance = 25
```

- ***Example***: you are given the test record ```X = (Refund = No, Divorced, Income = 120k)```

```
P(X | No) = P(Refund = No | No)
            * P(Divorced = No)
            * P(Income = 120K | No)
          = (4/7) * (1/7) * 0.0072 = 0.0006

P(X | Yes) = P(Refund = No | Yes)
            * P(Divorced | Yes)
            * P(Income = 120K | Yes)
          = (1) * (1/3) * (1/2) * (10^-9) = 4 * 10^-10

P(No) = 7 / 10
P(Yes) = 3 / 10

Since P(X | No) * P(No) > P(X | Yes) * P(Yes)

Therefore P(No | X) > P(Yes | X)
=> Class = No
```


## Nearest Neighbor Classifiers

- ***Basic Idea***: if it walks like a duck, quacks like a duck, then it's probably a duck

<img width="633" height="268" alt="Image" src="https://github.com/user-attachments/assets/e77011f0-197e-4891-b143-0484de9022dc" />

- requires three things
  - the set of stored records
  - Distance Metric to compute distance between records
  - The value of k, the number of nearest neighbors to retrieve

<br />

- to classify an unknown record:
  - compute distance to other training records
  - identify k nearest neighbors
  - use class labels of nearest neighbors to determine the class label of unknown record (e.g., by taking majority vote)

<img width="335" height="285" alt="Image" src="https://github.com/user-attachments/assets/eee64ae3-2abe-47fa-ba25-6aefb4d58e95" />


<br />

- K-nearest neighbors of a record x are data points that have the k smallest distance to x

<img width="627" height="290" alt="Image" src="https://github.com/user-attachments/assets/efd5ca03-2447-4924-a8c0-0d7eb62246df" />

<br />

- compute distance between two points:
  - Euclidean distance

<img width="222" height="41" alt="Image" src="https://github.com/user-attachments/assets/687954a4-f2a4-4c5e-be99-d7f882a044bf" />

- determine the class from nearest neighbor list
  - take the majority vote of class labels among the k-nearest neighbors
  - weigh the vote according to distance

```weight factor, w = 1 / d^2```

<br />

- choosing the value of k:
  - if k is too small, sensitive to noise points
  - if k is too large, neighborhood may include points from other classes

<img width="262" height="251" alt="Image" src="https://github.com/user-attachments/assets/06cbc315-5e62-42ad-8076-636bc1a7a810" />

<br />

- scaling issues
  - attributes may have to be scaled to prevent distance measures from being dominated by one of the attributes
- ***Example***:
  - Height of a person may vary from 1.5m to 1.8m
  - Weight of a person may vary from 90lb to 300lb
  - Income of a person may vary $10K to $1M

### Attribute Transformation
- ***Attribute Transform***: a function that maps the entire set of values of a given attribute to a new set of replacement values such that each old value can be identified with one of the new values
  - Simple functions: x^k, log(x), e^x, |x|

<br />

- Normalization / Standardization
  - refers to various techniques to adjust to differences among attributes in terms of frequency of occurrence, mean, variance, range
  - ***Standardization***
    - ```χ(scaled) = χ - mean / sd```
  - ***Normalization***
    - ```χ(normalized) = χ - χ(min) / χ(max) - χ(min)```

<br />

- K-NN classifiers are lazy learners
  - it does not build models explicitly 
  - unlike eager learners such as decision tree induction and rule-based systems
  - classifying unknown records are relatively expensive

## Artificial Neural Networks

<img width="823" height="188" alt="Image" src="https://github.com/user-attachments/assets/4afef26a-897a-4cb7-b384-d5d094b3c397" />

- ***Basic Idea***: complex non-linear function that can be learned as a composition of simple processing units
- ANN is a collection of simple processing units (nodes) that are connected by directed links (edges)
  - every node receives signals from incoming edges, performs computations, and transmits signals to outgoing edges
  - analogous to human brain where nodes are neurons and signals are electrical impulses

<img width="390" height="190" alt="Image" src="https://github.com/user-attachments/assets/dba38927-45b8-40bc-8b57-88facedccaff" />

<br />

- output Y is 1 if at least two of the three inputs are equal to 1

<img width="789" height="336" alt="Image" src="https://github.com/user-attachments/assets/d6a1a688-9852-459a-a637-e6bd56602a05" />

<br />

<img width="312" height="362" alt="Image" src="https://github.com/user-attachments/assets/709d32a3-a61f-4896-b4e2-3b74f0410cd0" />

- ANN usually has more than one hidden layer of computing nodes
- every node in a hidden layer operates on activations (outputs) from nodes in preceding layer, and transmits activations to nodes of next layer

<img width="395" height="182" alt="Image" src="https://github.com/user-attachments/assets/59c2c3d5-6402-4cc4-952a-331b7c30431f" />

- number of layers is known as depth of ANN
- training ANN means learning the weights

<br />

- ***Activation Functions***:

<img width="796" height="344" alt="Image" src="https://github.com/user-attachments/assets/687d856c-f669-44af-b1ce-502ea8ea4809" />

<br />

***Algorithm***:
- randomly initialize all the weights ```(w0, w1, ... , wk)```
- adjust the weights such that the final output is consistent with class labels y of training examples
  - forward propagation to estimate output ```Yi``` given input ```Xi```, and weights ```wi```
  - backpropagation to find the weights that minimize the output estimation error => measured using objective function, for example: 

<img width="206" height="64" alt="Image" src="https://github.com/user-attachments/assets/8a9adcdf-9d80-4994-9b6a-048a0e4b75e4" />

<br />

***Forward Propagation***:
- weights have some values
- data described by 3 features -> 3 input units
- 2 classes -> 2 output units
  - for example, if classes are dog and cat, then output will be [1 0] for dog or [0 1] for cat
- 1 hidden layer

<br />

***Forward Propagation***:
- feed data to the input layer
- each value (x1, x2, ... , xm) assigned to each unit is forwarded to the first hidden layer
- each unit in the hidden layer multiplies each of these values (x1, x2, ... , xm) with its weight vector (w1, w2, ... , wm), sums the multiplied values (x1 * w1 + x2 * w2 + ... + xm * wm), adds a bias, applies the activation function and forward the resulting value to the next layer (in this example, the outer layer)

<img width="314" height="185" alt="Image" src="https://github.com/user-attachments/assets/fcd975f7-3d50-4d4c-be0c-d0227d1afd84" />

