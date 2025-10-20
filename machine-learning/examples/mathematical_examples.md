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
- given data:

| X | Y | 
| -- | -- |
| 1 | 2 |
| 2 | 3 |
| 3 | 5 |

- Find β1 and β0 