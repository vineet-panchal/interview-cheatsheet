# React Components, Props, and State with TypeScript

## Functional Components

Define functional components with typed props and return types.

```tsx
interface UserProps {
  name: string;
  age: number;
}

const User: React.FC<UserProps> = ({ name, age }) => {
  return (
    <div>
      <h2>{name}</h2>
      <p>Age: {age}</p>
    </div>
  );
};
```

Or without React.FC:

```tsx
const User = ({ name, age }: UserProps): JSX.Element => {
  return (
    <div>
      <h2>{name}</h2>
      <p>Age: {age}</p>
    </div>
  );
};
```

## Class Components

Class components with TypeScript:

```tsx
interface CounterState {
  count: number;
}

interface CounterProps {
  initialCount?: number;
}

class Counter extends React.Component<CounterProps, CounterState> {
  constructor(props: CounterProps) {
    super(props);
    this.state = {
      count: props.initialCount || 0,
    };
  }

  increment = (): void => {
    this.setState({ count: this.state.count + 1 });
  };

  render(): JSX.Element {
    return (
      <div>
        <p>Count: {this.state.count}</p>
        <button onClick={this.increment}>Increment</button>
      </div>
    );
  }
}
```

## Typing Props

### Required Props

```tsx
interface ButtonProps {
  label: string;
  onClick: () => void;
}

const Button = ({ label, onClick }: ButtonProps): JSX.Element => {
  return <button onClick={onClick}>{label}</button>;
};
```

### Optional Props

```tsx
interface InputProps {
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  disabled?: boolean;
}

const Input = ({
  value,
  onChange,
  placeholder = '',
  disabled = false
}: InputProps): JSX.Element => {
  return (
    <input
      type="text"
      value={value}
      onChange={(e) => onChange(e.target.value)}
      placeholder={placeholder}
      disabled={disabled}
    />
  );
};
```

### Union Types for Props

```tsx
type ButtonVariant = 'primary' | 'secondary' | 'danger';

interface ButtonProps {
  variant: ButtonVariant;
  children: React.ReactNode;
  onClick: () => void;
}

const Button = ({ variant, children, onClick }: ButtonProps): JSX.Element => {
  return (
    <button
      className={`btn btn-${variant}`}
      onClick={onClick}
    >
      {children}
    </button>
  );
};
```

### Children Props

```tsx
interface CardProps {
  title: string;
  children: React.ReactNode;
}

const Card = ({ title, children }: CardProps): JSX.Element => {
  return (
    <div className="card">
      <h3>{title}</h3>
      <div className="card-content">{children}</div>
    </div>
  );
};

// Usage
<Card title="My Card">
  <p>This is the card content.</p>
  <button>Action</button>
</Card>
```

## Typing State

### useState with TypeScript

```tsx
const [name, setName] = useState<string>('');
const [age, setAge] = useState<number>(0);
const [user, setUser] = useState<User | null>(null);
```

### Complex State Objects

```tsx
interface FormState {
  name: string;
  email: string;
  age: number;
}

const [form, setForm] = useState<FormState>({
  name: '',
  email: '',
  age: 0,
});

const updateForm = (field: keyof FormState, value: string | number): void => {
  setForm(prev => ({
    ...prev,
    [field]: value,
  }));
};
```

### useReducer with TypeScript

```tsx
interface Todo {
  id: number;
  text: string;
  completed: boolean;
}

type TodoAction =
  | { type: 'ADD_TODO'; text: string }
  | { type: 'TOGGLE_TODO'; id: number }
  | { type: 'DELETE_TODO'; id: number };

const todoReducer = (state: Todo[], action: TodoAction): Todo[] => {
  switch (action.type) {
    case 'ADD_TODO':
      return [
        ...state,
        {
          id: Date.now(),
          text: action.text,
          completed: false,
        },
      ];
    case 'TOGGLE_TODO':
      return state.map(todo =>
        todo.id === action.id ? { ...todo, completed: !todo.completed } : todo
      );
    case 'DELETE_TODO':
      return state.filter(todo => todo.id !== action.id);
    default:
      return state;
  }
};

const TodoApp = (): JSX.Element => {
  const [todos, dispatch] = useReducer(todoReducer, []);

  const addTodo = (text: string): void => {
    dispatch({ type: 'ADD_TODO', text });
  };

  const toggleTodo = (id: number): void => {
    dispatch({ type: 'TOGGLE_TODO', id });
  };

  const deleteTodo = (id: number): void => {
    dispatch({ type: 'DELETE_TODO', id });
  };

  return (
    <div>
      {/* Todo list implementation */}
    </div>
  );
};
```

## Event Handling

### Typing Event Handlers

```tsx
const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
  setValue(event.target.value);
};

const handleFormSubmit = (event: React.FormEvent<HTMLFormElement>): void => {
  event.preventDefault();
  // Handle form submission
};

const handleKeyPress = (event: React.KeyboardEvent<HTMLInputElement>): void => {
  if (event.key === 'Enter') {
    // Handle enter key
  }
};
```

### Generic Event Handlers

```tsx
const handleChange = <T extends HTMLInputElement | HTMLTextAreaElement>(
  event: React.ChangeEvent<T>
): void => {
  const { name, value } = event.target;
  setFormData(prev => ({
    ...prev,
    [name]: value,
  }));
};
```

## Refs with TypeScript

### useRef

```tsx
const inputRef = useRef<HTMLInputElement>(null);

const focusInput = (): void => {
  inputRef.current?.focus();
};

return <input ref={inputRef} />;
```

### Callback Refs

```tsx
const setInputRef = (element: HTMLInputElement | null): void => {
  if (element) {
    element.focus();
  }
};

return <input ref={setInputRef} />;
```

## Generic Components

```tsx
interface ListProps<T> {
  items: T[];
  renderItem: (item: T) => React.ReactNode;
}

function List<T>({ items, renderItem }: ListProps<T>): JSX.Element {
  return (
    <ul>
      {items.map((item, index) => (
        <li key={index}>{renderItem(item)}</li>
      ))}
    </ul>
  );
}

// Usage
const numbers = [1, 2, 3, 4, 5];
<List items={numbers} renderItem={(num) => <span>{num}</span>} />
```

## Higher-Order Components (HOCs)

```tsx
interface WithLoadingProps {
  loading: boolean;
}

function withLoading<P extends object>(
  Component: React.ComponentType<P>
) {
  return function WithLoadingComponent(props: P & WithLoadingProps) {
    const { loading, ...restProps } = props;

    if (loading) {
      return <div>Loading...</div>;
    }

    return <Component {...(restProps as P)} />;
  };
}

// Usage
interface UserListProps {
  users: User[];
}

const UserList = ({ users }: UserListProps): JSX.Element => {
  // Component implementation
};

const UserListWithLoading = withLoading(UserList);
```

## Render Props

```tsx
interface MousePosition {
  x: number;
  y: number;
}

interface MouseProviderProps {
  render: (position: MousePosition) => React.ReactNode;
}

class MouseProvider extends React.Component<MouseProviderProps, MousePosition> {
  constructor(props: MouseProviderProps) {
    super(props);
    this.state = { x: 0, y: 0 };
  }

  handleMouseMove = (event: React.MouseEvent<HTMLDivElement>): void => {
    this.setState({
      x: event.clientX,
      y: event.clientY,
    });
  };

  render(): JSX.Element {
    return (
      <div onMouseMove={this.handleMouseMove}>
        {this.props.render(this.state)}
      </div>
    );
  }
}

// Usage
<MouseProvider render={({ x, y }) => (
  <p>Mouse position: {x}, {y}</p>
)} />
```

## Summary

TypeScript enhances React components by providing type safety for props, state, events, and refs. This leads to fewer runtime errors and better developer experience. The examples above demonstrate various patterns for typing React components effectively.
