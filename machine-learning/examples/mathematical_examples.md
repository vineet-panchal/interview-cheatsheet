# Machine Learning Math Practice

## Entropy and Information Gain

### Question 1: Entropy of a Node
- Suppose a node has:
  - 8 samples total
  - 6 "Yes" and 2 "No"
- What is the entropy of the node?

<br />

**Answer**:

```
P(Yes) = 6 / 8 = 0.75
P(No) = 0.25

Entropy = -[0.75log2(0.75) + 0.25log2(0.25)]
        = -(0.75 * -0.415 + 0.25 * -2)
        = 0.811
```

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

```
Weighted Entropy = (6 / 12) * 0.65 + (6 / 12) * 0.92 = 0.785
```

- Therefore, the weighted entropy after the split is 0.785

<br />

### Question 3: Information Gain
- What is the information gain from the previous question?

<br />

**Answer**:

```
Gain = Entropy(parent) - WeightedEntropy(children)
Gain = 0.98 - 0.785 = 0.195
```

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

```
Gain Ratio = 0.2 / 1.0 = 0.2
```

- Therefore, the gain ratio is 0.2.
- if another split has:
  - Information Gain = 0.15
  - Split Info = 0.2

```
Gain Ratio = 0.15 / 0.2 = 0.75
```

- The second split is better (higher gain ratio).

<br />

### Question 5: Entropy of a collection
- given this collection of training examples:

| Instance | a1 | a2 | a3 | Target Class |
| -- | -- | -- | -- | -- |
| 1 | T | T | 1.0 | + |
| 2 | T | T | 6.0 | + |
| 3 | T | F | 5.0 | - |
| 4 | 5 | T | 4.0 | + |
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

```
H = - ∑ p(c)log2(p(c)) = -(p(+)log2(p(+)) + p(-)log2(p(-)))
     (c)
```



<br />

## Linear Regression and Gradient Descent
- given data:

| X | Y | 
| -- | -- |
| 1 | 2 |
| 2 | 3 |
| 3 | 5 |

- Find β1 and β0 