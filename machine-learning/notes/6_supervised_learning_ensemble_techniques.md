# Supervised Learning: Ensemble Techniques

## Data Preprocessing: Sampling

- sampling is selecting a subset of data from the original dataset
- sampling is the main technique employed for data reduction
  - it is often used for both preliminary investigation of the data and the final data analysis
- sampling is typlically used in data mining because processing the entire set of data of interest is too expensive or time consuming

<br />

**Examples**:

- if dataset = 1000 rows
- you select 200 rows -> that is a sample

<br />

- Sampling is needed when:
- Data is large
- You want fast experiments
- You want multiple slightly different datasets (for ensemble methods)

### Types Of Sampling

**Simple Random Sampling**
- there is an equal probability of selecting any particular item
- Bootstrap Sampling: sampling without replacement
  - as each item is selected, it is removed from the population
- sampling with replacement
  - objects are not removed from the population as tehy are selected for the sample
  - in sampling with replacement, the same object can be picked up more than once

**Stratified Sampling**
- split the data into several partitions; then draw random samples from each partition

### Bootstrap Sampling: sampling without replacement

- **The Rule**: from a dataset of size n, pick n samples with replacement

**Example**:

- lets say the original dataset: ```{1, 2, 3, 4, 5}```
- the bootstrap sample may be: ```{1, 1, 2, 4, 5}```
- or: ```{2, 2, 2, 5, 1}```
- or: ```{3, 5, 5, 5, 1}```
- some items may appear multiple times, some not at all