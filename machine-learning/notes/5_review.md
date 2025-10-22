# Notes 1-4 Review

## Note 1 - Introduction to Machine Learning

### What is Machine Learning?
- **Definition**:
  - A field of computer science that enables systems to learn patterns from data rather than being explicitly programmed.

- **Goal**:
  - Build models that generalize well to unseen data.

### Types of Machine Learning

| Type | Description | Example |
| -- | -- | -- |
| Supervised Learning | Learn from labeled data (input + known output) | Predicting house prices, email spam detection |
| Unsupervised Learning | Learn from unlabeled data (input only) | Customer segmentation, topic modeling |
| Reinforcement Learning | Learn by interacting with environment via rewards | Training a robot, playing chess |

### Common Terms
- **Training Data** -> used to build the model
- **Testing Data** -> used to evaluate model
- **Features (X)** -> input variables
- **Labels (Y)** -> output variable (target)

### Supervised Learning Tasks
- **Classification** -> predicting discrete labels (e.g., spam vs not spam)
- **Regression** -> predicting continuous values (e.g., house prices)

## Note 2 - Supervised Learning: Classification

### Decision Tree Overview

- a decision tree splits data based on feature values to predict a target class.

### Entropy

- measures impurity (uncertainty) of a dataset.

$$Entropy(S) = -p_+ \log_2(p_+) - p_- \log_2(p_-)$$

**Example**:

- if a node has 4 positive and 4 negative:

```
Entropy = -0.5*log2(0.5) - 0.5*log2(0.5) = 1
```

### Weighted Entropy

- used when splitting dataset by an attribute

$$Entropy_{split} = \sum_i \frac{|S_i|}{|S|} Entropy(S_i)$$

### Information Gain

- reduction in entropy after splitting on an attribute

$$IG(A) = Entropy(S) - Entropy_{split}(A)$$

### Split Information & Gain Ratio

- used to penalize attributes with many splits.

$$GainRatio(A) = \frac{IG(A)}{SplitInfo(A)}$$

### Purity
- **Pure Node**: all samples belong to one class (Entropy = 0)
- **Impure Node**: samples belong to multiple classes (Entropy > 0)

### Splits: Binary vs Multi-way
- **Binary Split**: splits data into two groups (e.g., Yes/No)
- **Multi-way Split**: splits data into multiple groups based on attribute values (e.g., Color: Red, Blue, Green)

### Continous Attribute Split
- find a threshold where entropy is minimized (e.g., x < 4.5)

### Stopping Criteria
- stop splitting when:
  - all samples in node are same class
  - no attribute remains
  - depth limit reached
  - information gain below threshold

### Example
- **Feature**: Weather (Sunny, Overcast, Rain)
- **Target**: Play (Yes, No)
- Calculate entropy for entire dataset (roots and splits) - see which attribute gives highest information gain.

## Note 3 - Supervised Learning: Model Overfitting, Regression, and Gradient Descent

### Model Underfitting vs Overfitting
- **Underfitting**: model too simple, poor training performance
- **Overfitting**: model memorizes training data, poor generalization
- solution: use cross-validation, regularization, pruning

### Cross-Validation
- split data into k folds and test model k times, each time using a different fold for testing.

### Linear Regression
- predict continuous output using linear combination of input features.

$$y = \beta_0 + \beta_1 x$$

- beta 0 formula (the intercept):

$$\beta_0 = \bar{y} - \beta_1 \bar{x}$$

- beta 1 formula (the slope):

$$\beta_1 = \frac{n(\sum xy) - (\sum x)(\sum y)}{n(\sum x^2) - (\sum x)^2}$$

- **Goal**: minimize the cost function (Mean Squared Error):

$$MSE = \frac{1}{n}\sum_i (y_i - \hat{y}_i)^2$$

### Gradient Descent
- iterative optimization algorithm to minimize cost function.
- update weights in direction of negative gradient.

$$\beta_j = \beta_j - \alpha \frac{\partial J}{\partial \beta_j}$$
- **α** -> learning rate
- **J** -> cost function

### Partial Derivatives in Linear Regression

$$\frac{\partial J}{\partial \beta_0} = -2 \sum (y - \hat{y})$$  
$$\frac{\partial J}{\partial \beta_1} = -2 \sum x (y - \hat{y})$$

### Logistic Regression
- used for binary classification
- applies a sigmoid function to model probailities. 

$$p = \frac{1}{1 + e^{-(\beta_0 + \beta_1x)}}$$

- classify:
  - if p >= 0.5 -> class 1
  - else -> class 0

## Note 4 - Supervised Learning: Alternate Classification Methods

### Support Vector Machines (SVM)
- finds the optimal hyperplane that maximizes margin between classes.

$$y_i (w \cdot x_i + b) \ge 1$$

- **Margin** -> distance between support vectors
- **Kernel Trick** -> projects non-linear data to higher dimensions for linear separation.

### Naïve Bayes Classifier
- probabilistic classifier based on Bayes' theorem with independence assumptions.

$$P(C|X) = \frac{P(X|C)P(C)}{P(X)}$$

- assumes features are independent

**Example**:
- spam detection using words -> compute ```P(Spam|Words)```

### k-Nearest Neighbors (k-NN)
- classify a point based on the majority label of its k nearest neighbors
- use distance metrics, e.g.:

$$d(x_1, x_2) = \sqrt{\sum_i (x_{1i} - x_{2i})^2}$$

### Normalization vs Standardization

| Method | Formula | Description |
| -- | -- | -- |
| Normalization | $$x' = \frac{x - x_{min}}{x_{max} - x_{min}}$$ | Scale 0-1 |
| Standardization | $$x' = \frac{x - \mu}{\sigma}$$ | Mean 0, Std 1 |

### Neural Networks
- composed of layers of neurons connected by weights
- each neuron computes:

$$y = f(w_0 + \sum_i w_i x_i)$$

- **Activation Functions** -> sigmoid, ReLU, Tanh
- **Training** -> gradient descent via backpropagation

### Model Evaluation Metrics

#### Confusion Matrix

| Actual / Predicted | Predicted Positive | Predicted Negative |
| -- | -- | -- |
| Actual Positive | True Positive (TP) | False Negative (FN) |
| Actual Negative | False Positive (FP) | True Negative (TN) |

#### Metrics

$$Accuracy = \frac{TP + TN}{TP + TN + FP + FN}$$

$$Precision = \frac{TP}{TP + FP}$$

$$Recall = \frac{TP}{TP + FN}$$

$$F_1 = 2 \times \frac{Precision \times Recall}{Precision + Recall}$$

$$Specificity = \frac{TN}{TN + FP}$$

### ROC and AUC
- **ROC Curve** -> plots TPR vs FPR at various thresholds
- **AUC** -> area under ROC curve, measures model's ability to distinguish classes, the overall performance

$$TPR = \frac{TP}{TP + FN}, \quad FPR = \frac{FP}{FP + TN}$$

- **Good Model** -> AUC close to 1
- **Random Model** -> AUC around 0.5

| Concept | Key Formula |
| -- | -- |
| Entropy | $$Entropy(S) = -p_+ \log_2(p_+) - p_- \log_2(p_-)$$ |
| Weighted Entropy | $$Entropy_{split} = \sum_i \frac{|S_i|}{|S|} Entropy(S_i)$$ |
| Information Gain | $$IG(A) = Entropy(S) - Entropy_{split}(A)$$ |
| Gain Ratio | $$GainRatio(A) = \frac{IG(A)}{SplitInfo(A)}$$ |
| Gini Index | $$Gini(S) = 1 - \sum_i p_i^2$$ |
| Linear Regression | $$y = \beta_0 + \beta_1 x$$ |
| Beta 0 | $$\beta_0 = \bar{y} - \beta_1 \bar{x}$$ |
| Beta 1 | $$\beta_1 = \frac{n(\sum xy) - (\sum x)(\sum y)}{n(\sum x^2) - (\sum x)^2}$$ |
| Mean Squared Error | $$MSE = \frac{1}{n}\sum_i (y_i - \hat{y}_i)^2$$ |
| Gradient Descent | $$\beta_j = \beta_j - \alpha \frac{\partial J}{\partial \beta_j}$$ |
| Partial Derivative β0 | $$\frac{\partial J}{\partial \beta_0} = -2 \sum (y - \hat{y})$$ |
| Partial Derivative β1 | $$\frac{\partial J}{\partial \beta_1} = -2 \sum x (y - \hat{y})$$ |
| Logistic Regression | $$p = \frac{1}{1 + e^{-(\beta_0 + \beta_1x)}}$$ |
| Support Vector Machines | $$y_i (w \cdot x_i + b) \ge 1$$ |
| Naïve Bayes Classifier | $$P(C|X) = \frac{P(X|C)P(C)}{P(X)}$$ |
| k-NN Distance Metric | $$d(x_1, x_2) = \sqrt{\sum_i (x_{1i} - x_{2i})^2}$$ |
| Normalization | $$x' = \frac{x - x_{min}}{x_{max} - x_{min}}$$ |
| Standardization | $$x' = \frac{x - \mu}{\sigma}$$ |
| Neural Network Neuron | $$y = f(w_0 + \sum_i w_i x_i)$$ |
| Accuracy | $$Accuracy = \frac{TP + TN}{TP + TN + FP + FN}$$ |
| Precision | $$Precision = \frac{TP}{TP + FP}$$ |
| Recall | $$Recall = \frac{TP}{TP + FN}$$ |
| F1 Score | $$F_1 = 2 \times \frac{Precision \times Recall}{Precision + Recall}$$ |
| Specificity | $$Specificity = \frac{TN}{TN + FP}$$ |
| TPR | $$TPR = \frac{TP}{TP + FN}$$ |
| FPR | $$FPR = \frac{FP}{FP + TN}$$ |