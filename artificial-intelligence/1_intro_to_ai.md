# Introduction To Artificial Intelligence

## The Goal Of Artificial Intelligence

***To develop artifacts that can show behaviour, that when shown to humans, is considered intelligence***

- these (software-based) artifacts are called ***Agents***

## Agents In Artifical Intelligence

<img width="573" height="332" alt="Image" src="https://github.com/user-attachments/assets/145895f5-5330-4954-8965-16e33042c41c" />

## Goals Of Artifical Intelligence

- ***Systems that think like humans***
- ***Systems that act like humans***
- ***Systems that think rationally***
- ***Systems that act rationally***

# Thinking As Computation

***Thinking*** - process that occurs in the brain

***Computational Process*** - procedure for manipulating symbols or characters to produce output

## Symbols and Symbolic Structures

- symbols may contain characters from an alphabet
  - digits (i.e., 3, 7), letters (i.e, a, R, å), operators (i.e, +, √, %)
- can string together characters into numerals (335.32) or words ("happy")
- have more complex grouping
  - expressions like 245 + 4(x - 1)^2 or sentences like "Hello my name is Vineet."
- they can hold truth values
  - 247 < (x + 86)^2 or "My favourite food is lasagna".

## Propositions vs. Sentences
- will use logic to deal with abstract ideas in terms of concrete symbols

***Proposition*** - the idea expressed by a declarative sentence
  - "My keys are in my coat pocket"
  - "Reptiles are warm-blooded"

- Propositions are abstract entities (like numbers)
  - they hold or not hold. It is true if it holds
  - propositions are related to each other: they can imply each other, contradict

## Logical Entailment
- A collection of sentences S1, ... , SN logically entail a sentence S if the truth of S is implicit in the truth of all of the SI's 
  - If SI sentences are true, then so must be S

Examples: <br />
"My keys are in my coat pocket or on the fridge. Nothing is in my coat pocket." <br />
Entails: The  keys are on the fridge.

## The Web Of Belief
- sentences are linked by terms that appear in them
- logic can crawl over web to make connections between terms

## Key Ideas

1. Generally thinking over rich collection of ideas/concepts
2. Can build systems that are flexible, versatile, ... , by:
- representing information using symbolic sentences
- using logic to reason over these sentences
- act according to the conclusions it derives

These are called ***Knowledge-Based Systems***
- the collection of sentences is the ***knowledge base (KB)***
