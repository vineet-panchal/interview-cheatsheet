# Introduction to React with TypeScript

## What is React with TypeScript?

React with TypeScript combines the power of React's component-based UI library with TypeScript's static typing. This combination helps catch errors early, improves code readability, and enhances developer experience.

## Benefits of Using TypeScript with React

- **Type safety**: Detect errors at compile time instead of runtime.
- **Better tooling**: Improved autocompletion, refactoring, and navigation.
- **Self-documenting code**: Types serve as documentation.
- **Easier maintenance**: Types help understand code faster.
- **Improved collaboration**: Clear contracts between components.

## Setting Up React with TypeScript

Create a new React project with TypeScript template:

```bash
npx create-react-app my-app --template typescript
```

Or add TypeScript to an existing React project:

```bash
npm install --save typescript @types/node @types/react @types/react-dom @types/jest
```

Rename files from `.js` to `.tsx` to enable JSX with TypeScript.

## JSX in TypeScript

TypeScript supports JSX syntax with `.tsx` files.

```tsx
const element = <h1>Hello, TypeScript with React!</h1>;
```

## Typing JSX Elements

JSX elements can be typed explicitly:

```tsx
const element: JSX.Element = <div>Hello</div>;
```

## Functional Components with TypeScript

Basic functional component:

```tsx
import React from 'react';

function Welcome(): JSX.Element {
  return <h1>Hello, World!</h1>;
}
```

Arrow function component:

```tsx
const Welcome: React.FC = () => {
  return <h1>Hello, World!</h1>;
};
```

## React.FC (FunctionComponent) Type

`React.FC` is a generic type for functional components.

```tsx
const Greeting: React.FC<{ name: string }> = ({ name }) => {
  return <h1>Hello, {name}!</h1>;
};
```

Note: Some prefer not to use `React.FC` due to implicit children prop and other reasons.

## Typing Props

Define props interface:

```tsx
interface GreetingProps {
  name: string;
  age?: number; // optional prop
}

const Greeting = ({ name, age }: GreetingProps): JSX.Element => {
  return (
    <div>
      <h1>Hello, {name}!</h1>
      {age && <p>Age: {age}</p>}
    </div>
  );
};
```

## Typing State

Use generics with `useState`:

```tsx
import React, { useState } from 'react';

const Counter = (): JSX.Element => {
  const [count, setCount] = useState<number>(0);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
};
```

## Event Types

Typing event handlers:

```tsx
const handleClick = (event: React.MouseEvent<HTMLButtonElement>): void => {
  console.log('Button clicked', event);
};

<button onClick={handleClick}>Click me</button>
```

Common event types:

- `React.ChangeEvent<HTMLInputElement>`
- `React.FormEvent<HTMLFormElement>`
- `React.KeyboardEvent<HTMLInputElement>`

## Default Props with TypeScript

```tsx
interface ButtonProps {
  label: string;
  disabled?: boolean;
}

const Button = ({ label, disabled = false }: ButtonProps): JSX.Element => {
  return <button disabled={disabled}>{label}</button>;
};
```

## Summary

Using TypeScript with React improves code quality and developer productivity. This introduction covers setup, JSX typing, functional components, props, state, and event typing. Subsequent notes will cover components, props, state management, hooks, and advanced patterns with TypeScript.
