# Basics Of Prolog

PROLOG (PROgramming in LOGic)
- declarative, non-imperative programming language
- very different than procedural, object-oriented, functional programming languages
- computation in this context means logical deduction
- constraint-based reasoning (both logical and numerical)

## History of PROLOG
- PROLOG was invented in 1971 by Alain Colmerauer and Philippe Roussel
  - based on work on automated theorm-proving by Robert Kowalski
  - initial purpose was natural language processing
  - simultaneously invented by Alan Hewitt (called "Planner")

## PROLOG Knowledge Bases
- PROLOG programs start with a knowledge base (list of facts)

## Atomic Sentences
```
hasAccount(jennifer).
student(jennifer).
connected(tony, jennifer).
