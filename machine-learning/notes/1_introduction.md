# Introduction To Machine Learning

- Machine Learning is about teaching a computer to become intelligent, by learning over time based on data and experience.
- Machine Learning (ML) is a method where computers improve their performance on a task without being explicitly programmed.
- Instead of writing rules manually, you give the computer data and it learns the patterns from it.

#### Example
- Suppose you want a spam filter for your email.
- You don't tell it: "If the message contains 'free money', mark as spam"
- Instead you show it thousands of examples of:
  - Spam emails
  - Not-spam emails
<br />

- ***The algorithm learns patterns that distinguish them*** (like suspicious words, links, sender reputation)
- Over time, as it sees more examples, it gets better at classifying new unseen emails

***Machine Learning = computers learning from examples.***

## Branches of Machine Learning

```
                                Classification
                              /
                    Supervised Learning
                   /          \
                  /            Regression
                 /
                /  
Machine Learning ---- Unsupervised Learning -- Clustering
                \
                 \
                  \
                   Reinforcement Learning
```

## Supervised Learning
- task of learning a mapping between a set of inputs to a set of outputs
- you provide both input data (X) and desired output labels (Y).
- The algorithm learns a mapping from X -> Y
***Supervised = teacher present (you must correct answers to learn from)***

#### Example 1:
- predicting house prices based on features (size, bedrooms, location, etc.)

#### Example 2: 
```
1 -> 1
2 -> 4
3 -> 9
4 -> 16
5 -> 25
6 -> 36
```
- Here, each input ```x``` maps to an output ```y```
- if you notice the pattern, the output looks like ```x^2```
- so, the underlying function is: ```f(x) = x^2```
- Now, if the computer sees 10, it should predict ```f(10) = 100```
- but, the algorithm doesn't know that at first, it tries to find teh best function that fits the data its given

#### The Goal:
- to find a function that not only works for examples with inputs (1-6), but also generalizes to new data like (input = 10).

- This leads to a key concept:
*** Problem of Induction: we go from specific examples to a more general rule ***

- that's the essence of learning, we're teaching the model to infer unseen outcomes from past observations

#### Real-World Example:
- if you train an ML model on photos of cats and dogs, it learns features that differentiate them (like ear shape, face size, tail length)
- When it sees a new photo it's never seen before, it should still correctly classify it as a cat or dog, that's ***generalization***


## Unsupervised Learning
- task of describing patterns in the data and how to divide it
- we only have inputs, and no longer have the output
- you only provide input data (X), no labels (outputs). 
- the algorithm tries to find patterns or structure
- there are no output labels, only data
***Unsupervised = no teacher (you must find patterns yourself)***

<img width="298" height="269" alt="Image" src="https://github.com/user-attachments/assets/297d4a40-b589-4c66-a15a-ce604641f021" />

#### Example 1:
- grouping customers by purchasing habits (clustering)

#### Example 2:
- Imagine you work for Netflix and have thousands of users' movie-watching histories.
- you don't know which users belong to what group, but you want to recommend movies
- you can use ***clustering** (an unsupervised learning technique) to find patterns like:
  - ***Cluster 1***: People who watch romantic comedies
  - ***Cluster 2***: People who watch action movies
  - ***Cluster 3***: People who watch documentaries
- then, Netflix can recommend similar movies to each group
<br />

- Other examples:
  - grouping customers for marketing (customer segementation)
  - detecting unusual behavior (fraud detection)

## Reinforcement Learning
- learning based on rewarding for desired behaviours and punishing for undesired ones
- the algorithm learns by trail and error, receiving rewards or punishments for actions it takes, like how humans or animals learn
***Reinforcement = learning from consequences (rewards/punishments)***
<br />

- there's an agent that interacts with an environment
  - it takes an action
  - the environment gives a reward (good) or punishment (bad)
  - the agent learns to maximize rewards over time

#### Example 1:
- A robot learning to walk; it gets a reward when it stays balanced.

#### Example 2:
- think of a self-diving car:
  - if it stays in the lane -> +1 reward
  - if it crashes -> -10 reward
  - if it reaches destination safely -> +100 reward
- over time, it learns what actions (steering, braking, accelerating) lead to the best overall outcomes

# Summary

| Concept | Explanation | Example |
| -- | -- | -- |
| Machine Learning | Field of AI that lets computers learn patterns from data without explicit programming. | Email spam filters |
| Supervised Learning | Learn from labeled data (input -> output). Goal: find mapping function and generalize. | Predicting house prices, image classification |
| Unsupervised Learning | Find hidden patterns in unlabeled data. | Customer segmentation, clustering |
| Reinforcement Learning | Learn by interacting with environment using rewards/punishments. | Self-driving car, AlphaGo |
| Induction | Moving from specific examples to general rules. | Learning that "x^2" fits pattern 1->1, 2->4, 3->9 |