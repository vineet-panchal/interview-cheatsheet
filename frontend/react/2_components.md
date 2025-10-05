# React Components, Props, and JSX

## Components

Components are the building blocks of React applications. They allow you to split the UI into independent, reusable pieces.

### Functional Components

Functional components are JavaScript functions that return JSX.

```javascript
function Welcome(props) {
  return <h1>Hello, {props.name}!</h1>;
}

// Arrow function syntax
const WelcomeArrow = (props) => {
  return <h1>Hello, {props.name}!</h1>;
};

// Implicit return (for simple components)
const SimpleWelcome = (props) => <h1>Hello, {props.name}!</h1>;
```

### Class Components

Class components are ES6 classes that extend `React.Component`.

```javascript
import React from 'react';

class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}!</h1>;
  }
}
```

### Component Composition

Components can be composed together to build complex UIs.

```javascript
function App() {
  return (
    <div>
      <Welcome name="Alice" />
      <Welcome name="Bob" />
      <Welcome name="Charlie" />
    </div>
  );
}

function Welcome(props) {
  return <h1>Hello, {props.name}!</h1>;
}
```

## Props

Props (short for properties) are how data is passed from parent components to child components.

### Passing Props

```javascript
function App() {
  return <Welcome name="World" age={30} />;
}

function Welcome(props) {
  return (
    <div>
      <h1>Hello, {props.name}!</h1>
      <p>You are {props.age} years old.</p>
    </div>
  );
}
```

### Default Props

You can set default values for props.

```javascript
function Welcome(props) {
  return <h1>Hello, {props.name}!</h1>;
}

Welcome.defaultProps = {
  name: 'Guest'
};

// Or with default parameters (functional components)
function Welcome({ name = 'Guest' }) {
  return <h1>Hello, {name}!</h1>;
}
```

### Prop Types

PropTypes help validate the types of props.

```javascript
import PropTypes from 'prop-types';

function Welcome(props) {
  return <h1>Hello, {props.name}!</h1>;
}

Welcome.propTypes = {
  name: PropTypes.string.isRequired,
  age: PropTypes.number
};
```

### Destructuring Props

You can destructure props for cleaner code.

```javascript
function UserCard({ name, age, email }) {
  return (
    <div>
      <h2>{name}</h2>
      <p>Age: {age}</p>
      <p>Email: {email}</p>
    </div>
  );
}

// Usage
<UserCard name="John Doe" age={30} email="john@example.com" />
```

### Children Props

The `children` prop allows components to accept content between their opening and closing tags.

```javascript
function Card({ children }) {
  return <div className="card">{children}</div>;
}

// Usage
<Card>
  <h2>Title</h2>
  <p>Content goes here</p>
</Card>
```

## JSX

JSX is a syntax extension for JavaScript that allows you to write HTML-like code in your JavaScript files.

### Basic JSX

```javascript
const element = <h1>Hello, world!</h1>;
```

### Embedding Expressions

You can embed JavaScript expressions in JSX using curly braces.

```javascript
const name = 'John';
const element = <h1>Hello, {name}!</h1>;

const user = {
  firstName: 'John',
  lastName: 'Doe'
};

const fullName = <h1>Hello, {user.firstName} {user.lastName}!</h1>;
```

### JSX Attributes

```javascript
const element = <img src={user.avatarUrl} alt={user.name} />;
```

### Conditional Rendering

```javascript
function Greeting(props) {
  if (props.isLoggedIn) {
    return <h1>Welcome back!</h1>;
  }
  return <h1>Please sign up.</h1>;
}

// Or using ternary operator
function Greeting(props) {
  return (
    <h1>
      {props.isLoggedIn ? 'Welcome back!' : 'Please sign up.'}
    </h1>
  );
}
```

### Rendering Lists

```javascript
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li key={number.toString()}>
      {number}
    </li>
  );
  return <ul>{listItems}</ul>;
}

// Usage
<NumberList numbers={[1, 2, 3, 4, 5]} />
```

### Event Handling

```javascript
function ActionButton() {
  function handleClick() {
    alert('Button clicked!');
  }

  return <button onClick={handleClick}>Click me</button>;
}

// With arrow function
function ActionButton() {
  return <button onClick={() => alert('Button clicked!')}>Click me</button>;
}
```

### Forms

```javascript
function NameForm() {
  const [value, setValue] = React.useState('');

  const handleChange = (event) => {
    setValue(event.target.value);
  };

  const handleSubmit = (event) => {
    alert('A name was submitted: ' + value);
    event.preventDefault();
  };

  return (
    <form onSubmit={handleSubmit}>
      <label>
        Name:
        <input type="text" value={value} onChange={handleChange} />
      </label>
      <input type="submit" value="Submit" />
    </form>
  );
}
```

## Advanced Component Patterns

### Higher-Order Components (HOC)

HOCs are functions that take a component and return a new component.

```javascript
function withLogging(WrappedComponent) {
  return class extends React.Component {
    componentDidMount() {
      console.log('Component mounted');
    }

    render() {
      return <WrappedComponent {...this.props} />;
    }
  };
}

const EnhancedComponent = withLogging(MyComponent);
```

### Render Props

A render prop is a function prop that a component uses to know what to render.

```javascript
class MouseTracker extends React.Component {
  constructor(props) {
    super(props);
    this.state = { x: 0, y: 0 };
  }

  handleMouseMove = (event) => {
    this.setState({
      x: event.clientX,
      y: event.clientY
    });
  };

  render() {
    return (
      <div style={{ height: '100vh' }} onMouseMove={this.handleMouseMove}>
        {this.props.render(this.state)}
      </div>
    );
  }
}

// Usage
<MouseTracker render={({ x, y }) => (
  <h1>The mouse position is ({x}, {y})</h1>
)} />
```

### Controlled vs Uncontrolled Components

Controlled components have their value controlled by React state.

```javascript
// Controlled component
function ControlledInput() {
  const [value, setValue] = React.useState('');

  return (
    <input
      type="text"
      value={value}
      onChange={(e) => setValue(e.target.value)}
    />
  );
}
```

Uncontrolled components maintain their own internal state.

```javascript
// Uncontrolled component
function UncontrolledInput() {
  const inputRef = React.useRef();

  const handleSubmit = () => {
    alert(inputRef.current.value);
  };

  return (
    <div>
      <input type="text" ref={inputRef} />
      <button onClick={handleSubmit}>Submit</button>
    </div>
  );
}
```

## Component Lifecycle (Class Components)

Class components have lifecycle methods.

```javascript
class LifecycleExample extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
    console.log('Constructor');
  }

  static getDerivedStateFromProps(props, state) {
    console.log('getDerivedStateFromProps');
    return null;
  }

  componentDidMount() {
    console.log('componentDidMount');
  }

  shouldComponentUpdate(nextProps, nextState) {
    console.log('shouldComponentUpdate');
    return true;
  }

  getSnapshotBeforeUpdate(prevProps, prevState) {
    console.log('getSnapshotBeforeUpdate');
    return null;
  }

  componentDidUpdate(prevProps, prevState, snapshot) {
    console.log('componentDidUpdate');
  }

  componentWillUnmount() {
    console.log('componentWillUnmount');
  }

  render() {
    console.log('render');
    return <div>Count: {this.state.count}</div>;
  }
}
```

## Error Boundaries

Error boundaries catch JavaScript errors in the component tree.

```javascript
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.log('Error caught:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return <h1>Something went wrong.</h1>;
    }

    return this.props.children;
  }
}

// Usage
<ErrorBoundary>
  <MyComponent />
</ErrorBoundary>
```

## Summary

Components, props, and JSX form the foundation of React applications. Understanding how to create reusable components, pass data through props, and write JSX effectively is crucial for building maintainable React apps. The patterns and examples above demonstrate the versatility and power of React's component system.
