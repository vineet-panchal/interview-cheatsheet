# Data Preprocessing

- **Sampling** -> taking a smaller representative chunk of your dataset
- **Discretization and Binarization** -> converting numeric or categorical values into forms that algorithms can use more easily
- **Feature subset selection and transformation** -> reducing irrelevant data and modifying features to be more useful

##  Sampling

- sampling = selectign a smaller subset of your dataset
- sampling is the main technique employed for data selection
- often used for both preliminary investigation of the data
- used when processing the entire dataset is too expensive or time consuming

<img width="928" height="277" alt="Image" src="https://github.com/user-attachments/assets/0379e2bd-68ef-4151-8c2b-8f4cc2206b6d" />

## Types Of Sampling

**Simple Random Sampling**
  - equal probability of selecting any particular item
**Stratified Sampling**
  - split the data into several partitions; then draw random samples from each partition
**Sampling Without Replacement**
  - as each item is selected, it is removed from the population
**Sampling With Replacement**
  - objects are not removed from the population as they are selected for the sample
  - in sampling with replacement, the same object can be picked up more than once

## Stratified Sampling
- split the data into several partitions; then draw samples from each partition
- you split the data by group (age groups, genders, class labels, etc.)
- then you sample separately within each group
- this prevents "imbalanced sampling" where one group is underrepresented

## Discretization

- discretization is the process of converting a continuous attribute into a discrete attribute
  - a potentially infinite number of values are mapped into a small number of categories
- **Key Idea**: Discretization turns continuous values (like age = 22.583, 47.09) into categories

- data consists of four groups of points and two outliers
- data is one-dimensional, but a random y component is added to reduce overlap

<img width="782" height="323" alt="Image" src="https://github.com/user-attachments/assets/4f19c883-f0e1-4b83-a13b-784ea01c8ffd" />

- this illustration shows raw data before discretization
- the x-axis is the real variable; y-axis is randomly addded noise just to spread the points visually

<img width="775" height="268" alt="Image" src="https://github.com/user-attachments/assets/d303863b-6293-4cda-a8cb-5caf9dee9fa8" />

- equal interval width approach used to obtain 4 values
- you divide the numerical range into equal-sized "chunks"

<img width="789" height="328" alt="Image" src="https://github.com/user-attachments/assets/0115e2b4-8aba-48eb-bfe4-0f1d90b03c51" />

- equal frequency approach used to obtain 4 values
- each bin contains the same number of data points, even if bin widths are very different

<img width="778" height="260" alt="Image" src="https://github.com/user-attachments/assets/a217871a-9110-41dd-9da2-476ee3276cab" />

- K-means approach to obtain 4 values
- instead of equal width or equal frequency, k-means finds clusters and uses them as bins
- this creates bins based on natural groupings in the data

## Binarization

- Binarization = converting values into binary format
- binarization maps a continuous or categorical attribute into one or more binary variables

<img width="769" height="316" alt="Image" src="https://github.com/user-attachments/assets/5d72a6b3-8293-4dd6-84b5-fc80f382e52c" />

- Two-main approaches:
  - **Label Encoding**:
    - only for one column: A -> 0, B -> 1, C -> 2, etc.
  - **One-Hot Encoding**:
    - creates one binary column per category: A -> [1 0 0], B -> [0 1 0], C -> [0 0 1]
    - used for categorical features

## Feature Transformation
- function that maps the entire set of values of a given feature to a new set of replacement values
- Simple functions: x^k, log(x), e^x, |x|
- normalization/standardization
  - refers to various techniques to adjust to differences among attributes in terms of frequency of occurrence, mean, variance, range

<br />

**Standardization**:

$$ z = \frac{x - \mu}{\sigma} $$

**Normalization**:

$$ x' = \frac{x - x_{\min}}{x_{\max} - x_{\max}} $$

- feature transformation adjusts scales or shapes of features
- standardization -> mean 0, std 1
- normalization -> scale to [0, 1]
- log transforms -> handle skewed data
- polynomial transforms -> capture non-linear patterns

## Feature Subset Selection

- Curse of dimensionality
  - When dimensionality increases, data becomes increasingly sparse =>
    - For classification, there are not enough instances to create a reliable model
    - The learning might pick up on spurious combination of features, that maximize the evaluation metric by random chance in the training set
    - Increased space of possible model parameters more difficult to search
    - Definitions of density and distance between points, which are critical for clustering, become less meaningful

<br />

- curse of dimensionality, example of clustering:

<img width="1030" height="383" alt="Image" src="https://github.com/user-attachments/assets/219dae25-31ec-4d32-b1bd-5e9362d4712b" />

<br />

- Purpose:
  - Avoid curse of dimensionality
  - Reduce amount of time and memory required by algorithms
  - Helps to eliminate irrelevant features or reduce noise
    - Irrelevant features
      - Contain no information that is useful
      - Example: students' ID is often irrelevant to the task of predicting students' GPA
    - Redundant features
      - Duplicate much or all of the information contained in one or more other attributes
      - Example: purchase price of a product and the amount of sales tax paid

<br />

## Two-General Approaches

**Filtering**

<img width="452" height="151" alt="Image" src="https://github.com/user-attachments/assets/7ca63738-73ba-4366-8bfc-a73ef999dcbf" />

- build model after selecting subset of features
- Pro: speed
- Cons: ignores the learning problem
- Examples of methods:
  - some classifiers such as decision trees
  - Pearson Correlation coefficient
  - Dimensionality reduction

<br />

**Wrapping**

<img width="281" height="329" alt="Image" src="https://github.com/user-attachments/assets/bf277baf-58ba-4d20-a8ce-e943696cb172" />

- Pro: considers the learning problem
- Cons: very slow
- Examples of methods:
  - forward selection
  - backward selection

## Forward Selection

- algorithm to 'grow' a set features S
1. S starts empty
2. find the best-scoring feature to add to S by checking which feature combined with S gives the best score
3. if overall performance has improved, add best-scoring feature to S and return to step 2; else stop and return S

- Example: dataset has 5 features: x1, x2, x3, x4, x5

<img width="674" height="232" alt="Image" src="https://github.com/user-attachments/assets/5515e3e1-0755-45aa-af52-0bea9d52e289" />

- size of circle illustrates the score improvement associated with including the feature to S

## Backward Selection

- algorithm to 'shrink' a set features S:

1. S starts with the full feature set
2. find the feature to remove from S by checking which feature removal from S gives the best score
3. if overall performance is acceptable, remove that feature from S and return to step 2; else stop and return S

<img width="879" height="220" alt="Image" src="https://github.com/user-attachments/assets/f55b52f3-2154-4c40-8b8a-cb61262a3c9d" />

- size of circle illustrates the score degradation associated with removing the feature to S
