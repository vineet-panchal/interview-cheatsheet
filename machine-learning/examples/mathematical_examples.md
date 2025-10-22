# Machine Learning Math Practice

## Entropy and Information Gain

### Question 1: Entropy of a Node
- Suppose a node has:
  - 8 samples total
  - 6 "Yes" and 2 "No"
- What is the entropy of the node?

<br />

**Answer**:

- the entropy formula:

$$Entropy = -\sum_{i} p_i \log_2 p_i$$

- compute probabilities:

$$p(\text{Yes})=\frac{6}{8}=0.75,\quad p(\text{No})=\frac{2}{8}=0.25$$

- calculate entropy:

$$
\begin{aligned}
Entropy &= -\big(0.75\log_2 0.75 + 0.25\log_2 0.25\big)\\[6pt]
\log_2 0.75 &\approx -0.415037499\\
\log_2 0.25 &= -2\\[6pt]
Entropy &\approx -\big(0.75\times(-0.415037499) + 0.25\times(-2)\big) = 0.811278124 \approx 0.81
\end{aligned}
$$

- Therefore, the entropy of the node is 0.81

<br />

### Question 2: Weighted Entropy (after a split)
- parent node entropy = 0.98 (from 12 total records)
- we split into two child nodes:
  - Left node: 6 records, Entropy = 0.65
  - Right node: 6 records, Entropy = 0.92
- What is the weighted entropy?

<br />

**Answer**:

- weighted entropy formula:

$$H_{weighted} = \frac{n_1}{n}H_1 + \frac{n_2}{n}H_2$$

- compute (with n1 = n2 = 6, n = 12)

$$H_{weighted} = \frac{6}{12}\cdot 0.65 + \frac{6}{12}\cdot 0.92 = 0.785$$

- Therefore, the weighted entropy after the split is 0.785

<br />

### Question 3: Information Gain
- What is the information gain from the previous question?

<br />

**Answer**:

$$Gain = H_{parent} - H_{weighted} = 0.98 - 0.785 = 0.195$$

- Therefore, the information gain is 0.195
- so this split slightly improves the purity.
- when building a tree, you'd compare multiple attributes and pick the one with the highest gain

<br />

### Question 4: Gain Ratio
- Suppose a split produces: 
  - Information Gain = 0.2
  - Split Info = 1.0
- What is the Gain Ratio?

<br />

**Answer**:

$$GainRatio = \frac{InformationGain}{SplitInfo}$$

$$GainRatio_A=\frac{0.20}{1.0}=0.20,\quad GainRatio_B=\frac{0.15}{0.20}=0.75$$

- Therefore, the gain ratio is 0.2.
- if another split has:
  - Information Gain = 0.15
  - Split Info = 0.2
- The second split is better (higher gain ratio).

<br />

### Question 5: Entropy of a collection
- given this collection of training examples:

| Instance | a1 | a2 | a3 | Target Class |
| -- | -- | -- | -- | -- |
| 1 | T | T | 1.0 | + |
| 2 | T | T | 6.0 | + |
| 3 | T | F | 5.0 | - |
| 4 | F | T | 4.0 | + |
| 5 | F | T | 7.0 | - |
| 6 | F | T | 3.0 | - |
| 7 | F | F | 8.0 | - |
| 8 | T | F | 7.0 | + |
| 9 | F | T | 5.0 | - |

- What is the entropy of this collection of training examples with respect to the target class? (round to 2 decimal places, e.g., if the result is 1.1111, report 1.11)

<br />

**Answer**:

- from the table there are 9 instances, counting the target column gives:
  - `+` (positive) = 4
  - `-` (negative) = 5

**Step 1: Count class labels**
- so the class probabilities are:
  - $p(+) = \frac{4}{9}$
  - $p(-) = \frac{5}{9}$

**Step 2: Entropy formula**
- Entropy for a binary target:

$$H = - \sum_c p(c)\log_2 p(c)$$

**Step 3: Substitute values**

$$H = -\Big(p(+) \log_2 p(+) + p(-)\log_2 p(-)\Big)$$

**Step 4: Compute**

$$p(+) = \frac{4}{9} \approx 0.444, \quad p(-) = \frac{5}{9} \approx 0.556$$

$$H = -\big(0.444\log_2(0.444) + 0.556\log_2(0.556)\big)$$

$$H = -\big(0.444(-1.17) + 0.556(-0.85)\big) = 0.99$$

$$H = 0.99$$

- Therefore, the entropy of the collection is 0.99

<br />

### Question 6: Gain of a collection
- given the collection same as the previous question:

| Instance | a1 | a2 | a3 | Target Class |
| -- | -- | -- | -- | -- |
| 1 | T | T | 1.0 | + |
| 2 | T | T | 6.0 | + |
| 3 | T | F | 5.0 | - |
| 4 | F | T | 4.0 | + |
| 5 | F | T | 7.0 | - |
| 6 | F | T | 3.0 | - |
| 7 | F | F | 8.0 | - |
| 8 | T | F | 7.0 | + |
| 9 | F | T | 5.0 | - |

- given the entropy of the training examples is 0.99, compute teh gain of splitting using the attribute a1. (round to 2 decimals places, e.g., if the result is 1.1111, report 1.11)
- **Hint**: take your time, compute the (weighted) entropy for a1, then compute the gain.

<br />

**Answer**:

**Step 1: Read the data (classes by a1)**
- from the table 9 instances give these (a1, class):
  - `a1 = T` -> instances 1, 2, 3 -> classes: ```+, +, -``` -> 2 positives, 1 negative -> 3 total
  - `a1 = F` -> instances 4, 5, 6, 7, 8, 9 -> classes: ```+, -, -, -, +, -``` -> 2 positives, 4 negatives -> 6 total

**Step 2: Parent entropy**
- the problem stated that the entropy of the whole training set is: 

$$H_{\text{parent}} = 0.99$$

**Step 3: Entropy of each child (after splitting on a1)**

***Left child (a1 = T)***

- Counts: + = 3, - = 1, n(left) = 4
- so probabilities: 

$$p(+) = \frac{3}{4}, \quad p(-) = \frac{1}{4}$$

- Entropy:

$$H_T = -\left(\frac{3}{4}\log_2\frac{3}{4} + \frac{1}{4}\log_2\frac{1}{4}\right) = 0.8113$$


***Right child (a1 = F)***

- Counts: + = 1, - = 4, n(right) = 6
- so probabilities:

$$p(+) = \frac{1}{5}, \quad p(-) = \frac{4}{5}$$

- Entropy:

$$H_F = -\left(\frac{1}{5}\log_2\frac{1}{5} + \frac{4}{5}\log_2\frac{4}{5}\right) = 0.7219$$

**Step 4: Weighted entropy after the split**

- Weighted entropy:

$$H_{\text{split}} = \frac{4}{9}H_T + \frac{5}{9}H_F = \frac{4}{9}(0.8113) + \frac{5}{9}(0.7219) = 0.7627$$

**Step 5: Information Gain for a1**

$$\text{Gain}(a_1) = H_{\text{parent}} - H_{\text{split}} = 0.99 - 0.7627 = 0.23$$

- Therefore, the information gain for a1 is 0.23

***Interpretation**:
- splitting on a1 only yields a small reduction in entropy (~0.07), so a1 is not a very informative attribute compared with a split that would produce much purer child nodes (which would give higher gain)
- for tree building you would compare this gain to gains from other attributes and pick the attribute with the largest gain.


## Linear Regression and Gradient Descent

### Question 1: Fit Linear Regression model on given data

- given data:

| X | Y | 
| -- | -- |
| 1 | 2 |
| 2 | 3 |
| 3 | 5 |

- Fit simple linear regression by hand

<br />

**Answer**:

- slope formula:

$$\beta_1 = \frac{\sum_i (x_i - \bar{x})(y_i - \bar{y})}{\sum_i (x_i - \bar{x})^2}$$

- intercept formula:

$$\beta_0 = \bar{y} - \beta_1 \bar{x}$$

**Step 1: Compute means**:

$$\bar{x} = \frac{1+2+3}{3}=2,\quad \bar{y}=\frac{2+3+5}{3}=\frac{10}{3}\approx 3.333333$$

**Step 2: Compute numerator and denominator**:

$$\sum (x_i-\bar{x})(y_i-\bar{y}) = 3.0,\quad \sum (x_i-\bar{x})^2 = 2$$

$$\beta_1 = \frac{3}{2} = 1.5,\quad \beta_0 = \bar{y} - \beta_1 \bar{x} = \frac{10}{3} - 1.5\cdot2 = 0.333333$$

- Therefore, the final linear regression model is: 

$$\hat{y} = 0.3333 + 1.5x$$

<br />

### Question 2: One iteration of Gradient Descent

- given: 
```
x = [1, 2]
y = [2, 4]
β0 = 0
β = 0
α = 0.1
```
- do one iteration of gradient descent

<br />

**Answer**:

- predictions and errors:

$$\hat{y} = \beta_0 + \beta_1 x = [0,0],\quad \text{errors }(y-\hat{y})=[2,4]$$

- gradients for ```SSE J = ∑ (y - y^)^2```

$$\frac{\partial J}{\partial \beta_0} = -2 \sum (y-\hat{y}) = -12$$
$$\frac{\partial J}{\partial \beta_1} = -2 \sum x (y-\hat{y}) = -20$$

- update: 

$$\beta_0 := 0 - 0.1(-12) = 1.2$$
$$\beta_1 := 0 - 0.1(-20) = 2.0$$

- Therefore, the results after one iteration is:

$$\beta_0 = 1.2,\quad \beta_1 = 2.0$$

<br />

### Question 3: Effect of normalization

- given ```x = [1, 2, 3]```

<br />

**Answer**:

- Z-score standardization:

$$\mu = 2,\quad \sigma = \sqrt{\frac{(1-2)^2+(2-2)^2+(3-2)^2}{3}}=\sqrt{\frac{2}{3}}\approx0.8165$$
$$z = \frac{x-\mu}{\sigma}\approx[-1.2247,\ 0,\ 1.2247]$$

<br />

## SVM, Naive Bayes, K-NN, and ANN

### Question 1: SVM margin width from w

- given ```w = [2, 2]```

<br />

**Answer**:

- margin width (distance width parallel support hyperplanes) is:

$$margin = \frac{2}{\|w\|}$$

- compute:

$$\|w\|=\sqrt{2^2+2^2}=\sqrt{8}=2\sqrt{2}\approx2.82842712$$
$$margin=\frac{2}{2.82842712}\approx0.70710678$$

- Therefore, margin = 0.7071

<br />

### Question 2: Naive Bayes posterior

- given

```
P(Yes) = 0.6, P(No) = 0.4
P(Sunny | Yes) = 0.5, P(Sunny | No) = 0.1
P(Hot | Yes) = 0.3, P(Hot | No) = 0.5
```

<br />

**Answer**:

- compute unnormalized posteriors:

$$P(\text{Yes}\mid Sunny,Hot)\propto 0.5\times0.3\times0.6 = 0.09$$

$$P(\text{No}\mid Sunny,Hot)\propto 0.1\times0.5\times0.4 = 0.02$$

- normalize:

$$Total = 0.09+0.02 = 0.11$$
$$P(\text{Yes}\mid Sunny,Hot) = \frac{0.09}{0.11}\approx0.8182$$
$$P(\text{No}\mid Sunny,Hot) = \frac{0.02}{0.11}\approx0.1818$$

- Therefore, Play = Yes (~81.82%)

<br />

### Question 3: 1-NN 

- consider the one dimensional data set shown in this table.

| x | 0.5 | 3.0 | 4.5 | 4.6 | 4.9 | 5.2 | 5.3 | 5.5 | 7.0 | 9.5 |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| y | - | - | + | + | + | - | - | + | - | - |

- classify the data point ```x = 5.0``` according to its 1-nearest neighbor using majority vote

<br />

**Answer**:

- we need to find the single training point with the smallest distance to 5.0

- distances to nearby points
  - ```|5.0 - 4.9| = 0.1```
  - ```[5.0 - 5.2] = 0.2```

- the closest point is ```x = 4.9``` (distance 0.1), whose label is ```0.1```

- Therefore, by 1-NN majority vote (i.e., take the single nearest neighbor's label), the predicted class for ```x = 5.0``` is ```+```

<br />

### Question 4: 3-NN

- consider the same dataset as the previous question

| x | 0.5 | 3.0 | 4.5 | 4.6 | 4.9 | 5.2 | 5.3 | 5.5 | 7.0 | 9.5 |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| y | - | - | + | + | + | - | - | + | - | - |

- classify the data point ```x = 5.0``` to its 3-nearest neighbor using majority vote.

<br />

**Answer**:

- Compute distances to each point:

$$
\begin{aligned}
|5.0 - 0.5| &= 4.5\\
|5.0 - 3.0| &= 2.0\\
|5.0 - 4.5| &= 0.5\\
|5.0 - 4.6| &= 0.4\\
|5.0 - 4.9| &= 0.1\\
|5.0 - 5.2| &= 0.2\\
|5.0 - 5.3| &= 0.3\\
|5.0 - 7.0| &= 2.0\\
|5.0 - 9.5| &= 4.5
\end{aligned}
$$

- Sort by distance (smallest first) and take the 3 nearest points:

| x | y | Distance | Rank |
|:--|:--|:--|:--|
| 4.9 | + | 0.1 | 1 |
| 5.2 | − | 0.2 | 2 |
| 5.3 | - | 0.3 | 3 |

- there are 1 ```+``` classes and 2 ```-``` class
- Therefore, the majority class is ```-```
- Therefore, ```x = 5.0``` is classified as ```-```

<br />

### Question 5: K-NN distances (numerical)

- training points:
```
A(1, 2) Red
B(2, 3) Blue
C(3, 3) Blue
```

- Test point: T(2, 2)

<br />

**Answer**:

$$d(A,T)=\sqrt{(2-1)^2+(2-2)^2}=1$$
$$d(B,T)=\sqrt{(2-2)^2+(2-3)^2}=1$$
$$d(C,T)=\sqrt{(2-3)^2+(2-3)^2}=\sqrt{2}\approx1.4142$$

- Therefore, the distance is 1.4142
- with k = 2, nearest are A and B (tie)
- tie-breaking rule needed (e.g., choose smallest average distance class or random)

<br />

### Question 6: ANN weighted sum + sigmoid

- given inputs ```x = [1, 2]```, weights ```w = [0.4, 0.3]```, bias ```b = 0.2```

<br />

**Answer**:

- weighted sum:

$$z = 0.4\cdot 1 + 0.3\cdot 2 + 0.2 = 1.2$$

- sigmoid activation:

$$\sigma(z)=\frac{1}{1+e^{-z}}=\frac{1}{1+e^{-1.2}}\approx0.7685$$

- Therefore, the output is 0.7685

<br />

### Question 7: F1 Score from Precision and Recall

- given Precision ```P = 0.8```, Recall ```R = 0.5```

- formula: 

$$F1 = 2\cdot \frac{P\cdot R}{P+R}$$

- compute:

$$F1 = 2\cdot\frac{0.8\cdot 0.5}{0.8+0.5} = \frac{0.8}{1.3}\approx0.6154$$

- Therefore, the answer is F1 = 0.6154

<br />

### Question 8: Model Evaluation: Comparing classifers

- you are asked to evaluate the performance of two classification models, M1 and M2
- the table shows the posterior probabilities obtained by applying the models to a dataset.
- only posterior probabilities for the positive class are shown

| Instance | True Class | ```P(+ | A, ..., Z, M1)``` | ```P(+ | A, ..., Z, M2)``` |
| -- | -- | -- | -- |
| 1 | + | 0.73 | 0.61 |


| Instance | True Class | ```P(+ | A, ..., Z, M1)``` | ```P(+ | A, ..., Z, M2)``` |
| -- | -- | -- | -- |
| 1 | + | 0.73 | 0.61 |
| 2 | + | 0.69 | 0.03 |
| 3 | - | 0.44 | 0.68 |
| 4 | - | 0.55 | 0.31 |
| 5 | + | 0.67 | 0.45 |
| 6 | + | 0.47 | 0.09 |
| 7 | - | 0.08 | 0.38 |
| 8 | - | 0.15 | 0.05 |
| 9 | + | 0.45 | 0.01 |
| 10 | - | 0.35 | 0.04 |


- assume that we are mostly interested in detecting instances from the positive class
- plot the ROC curve for both M1 and M2
- Which model do you think is better?

<br />

**Answer**:

**Step 1**: understand the data
- we have posterior probabilties for the positive class (+) from two models
- There are 5 positives (instances 1, 2, 5, 6, 9) and 5 negatives (3, 4, 7, 8, 10)

**Step 2**: What ROC curve means
- each threshold ```t``` between 0 and 1 gives a different True Positive Rate (TPR) and False Positive Rate (FPR)
- ROC curves plots TPR vs FPR as threshold decreases
- Larger area = better model (AUC closer to 1)

$$TPR = \frac{TP}{TP+FN}, \quad FPR = \frac{FP}{FP+TN}$$

**Step 3**: Rank by predicted probability

- for M1 (sort descending):

| Rank | Instance | True Class | P(+|M₁) |
|:--|:--:|:--:|:--:|
| 1 | 1 | + | 0.73 |
| 2 | 2 | + | 0.69 |
| 3 | 5 | + | 0.67 |
| 4 | 4 | − | 0.55 |
| 5 | 3 | − | 0.44 |
| 6 | 6 | + | 0.47 |
| 7 | 9 | + | 0.45 |
| 8 | 10 | − | 0.35 |
| 9 | 8 | − | 0.15 |
| 10 | 7 | − | 0.08 |

- notice some probabilities slightly out of order (4 > 6 > 9 > 3)
- Let’s fix that order properly: 1 (0.73), 2 (0.69), 5 (0.67), 4 (0.55), 6 (0.47), 9 (0.45), 3 (0.44), 10 (0.35), 8 (0.15), 7 (0.08).

- for M2 (sort descending):

| Rank | Instance | True Class | P(+|M₂) |
|:--|:--:|:--:|:--:|
| 1 | 3 | − | 0.68 |
| 2 | 1 | + | 0.61 |
| 3 | 5 | + | 0.45 |
| 4 | 7 | − | 0.38 |
| 5 | 4 | − | 0.31 |
| 6 | 8 | − | 0.05 |
| 7 | 10 | − | 0.04 |
| 8 | 6 | + | 0.09 |
| 9 | 2 | + | 0.03 |
| 10 | 9 | + | 0.01 |

**Step 4**: Sketch ROC qualitatively

- for M1:
  - as we lower the threshold, positives tend to appear earlier (top ranks)
  - High TPR with relatively low FPR

- for M2:
  - notice instance 3 (negative) has the highest probability (0.68)
  - that means at the top threshold we already have FP = 1 and TP = 0, so FPR starts high.

- so ROC(M1) lies above ROC(M2)

**Step 5**: Approximate AUC by ranking logic
- AUC ≈ Probability that a random positive is ranked above a random negative.
- you can count pairwise comparisons or reason visually.
- For M1:
  - Most positives (0.73, 0.69, 0.67, 0.47, 0.45) are higher than negatives (mostly 0.55, 0.44, 0.35, 0.15, 0.08) → AUC ≈ 0.9
- For M2:
  - Negative 3 is ranked top; several negatives are above positives → AUC ≈ 0.6

**Step 6**: Conclusion

$$AUC(M_1) > AUC(M_2)$$  

- Therefore, Model M1 is better (it ranks positives higher and has a better ROC curve)

<br />

### Question 9: 

- consider the same table as the previous question:

| Instance | True Class | ```P(+ | A, ..., Z, M1)``` | ```P(+ | A, ..., Z, M2)``` |
| -- | -- | -- | -- |
| 1 | + | 0.73 | 0.61 |
| 2 | + | 0.69 | 0.03 |
| 3 | - | 0.44 | 0.68 |
| 4 | - | 0.55 | 0.31 |
| 5 | + | 0.67 | 0.45 |
| 6 | + | 0.47 | 0.09 |
| 7 | - | 0.08 | 0.38 |
| 8 | - | 0.15 | 0.05 |
| 9 | + | 0.45 | 0.01 |
| 10 | - | 0.35 | 0.04 |

- for model M1, suppose you choose the cutoff threshold to be ```t = 0.5```.
- in other words, any test instances whose posterior probability is greater than ```t``` will be classified as a positive example
- Compute the precision at this threshold value.

<br />

**Answer**: 

**Step 1**: Apply the threshold ```t = 0.5```

- so predictions:

| Instance | P(+|M1) | Predicted | True |
|:--|:--:|:--:|:--:|
| 1 | 0.73 | + | + |
| 2 | 0.69 | + | + |
| 3 | 0.44 | – | – |
| 4 | 0.55 | + | – |
| 5 | 0.67 | + | + |
| 6 | 0.47 | – | + |
| 7 | 0.08 | – | – |
| 8 | 0.15 | – | – |
| 9 | 0.45 | – | + |
| 10 | 0.35 | – | – |

**Step 2**: Count outcomes

- define:
  - TP (True Positives) = predicted +, actual +
  - FP (False Postives) = predicted +, actual -
  - TN (True Negatives) = predicted -, actual -
  - FN (False Negatives) = predicted -, actual +
- now count:

| Category | Instances | Count |
| -- | -- | -- |
| TP | 1, 2, 5 | 3 |
| FP | 4 | 1 |
| TN | 3, 7, 8, 10 | 4 |
| FN | 6, 9 | 2 |

**Step 3**: Compute Precision
- precision is the fraction of predicted positives that are correct:

$$\text{Precision} = \frac{TP}{TP + FP}$$

- substitute values:

$$\text{Precision} = \frac{3}{4} = 0.75$$

- Therefore, the Precision at ```t = 0.5 = 0.75```

<br />

- consider the same table as the previous question:

| Instance | True Class | ```P(+ | A, ..., Z, M1)``` | ```P(+ | A, ..., Z, M2)``` |
| -- | -- | -- | -- |
| 1 | + | 0.73 | 0.61 |
| 2 | + | 0.69 | 0.03 |
| 3 | - | 0.44 | 0.68 |
| 4 | - | 0.55 | 0.31 |
| 5 | + | 0.67 | 0.45 |
| 6 | + | 0.47 | 0.09 |
| 7 | - | 0.08 | 0.38 |
| 8 | - | 0.15 | 0.05 |
| 9 | + | 0.45 | 0.01 |
| 10 | - | 0.35 | 0.04 |

- for model M1, suppose you choose the cutoff threshold to be ```t = 0.5```
- in other words, any instances whose posterior probability is greater than t will be classified as a positive example
- Compute the recall at this threshold value.

<br />

**Answer**:

- what we found:

| Metric | Count | Instances |
| -- | -- | -- |
| TP | 3 | 1, 2, 5 |
| FP | 1 | 4 |
| TN | 4 | 3, 7, 8, 10 |
| FN | 2 | 6, 9 |

- recall is the fraction of actual positives that are correctly predicted:

$$\text{Recall} = \frac{TP}{TP + FN}$$

- substitute values:

$$\text{Recall} = \frac{3}{5} = 0.6$$

- Therefore, the Recall at ```t = 0.5``` is 0.6