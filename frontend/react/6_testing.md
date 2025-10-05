# React Testing

Testing is essential to ensure your React components work as expected and to prevent regressions.

## Testing Tools

- **Jest**: JavaScript testing framework, comes bundled with Create React App
- **React Testing Library**: Focuses on testing components from the user's perspective
- **Enzyme**: Older testing utility for React, less recommended now

## Setting Up Testing

Create React App includes Jest and React Testing Library by default.

```bash
npm test
```

## Writing Tests with React Testing Library

### Basic Render Test

```javascript
import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});
```

### Testing User Interaction

```javascript
import { render, screen, fireEvent } from '@testing-library/react';
import Counter from './Counter';

test('increments counter on button click', () => {
  render(<Counter />);
  const button = screen.getByText('+');
  fireEvent.click(button);
  const count = screen.getByText(/count: 1/i);
  expect(count).toBeInTheDocument();
});
```

### Testing Async Components

```javascript
import { render, screen, waitFor } from '@testing-library/react';
import UserProfile from './UserProfile';

test('loads and displays user', async () => {
  render(<UserProfile userId={1} />);
  expect(screen.getByText(/loading/i)).toBeInTheDocument();

  await waitFor(() => {
    expect(screen.getByText('John Doe')).toBeInTheDocument();
  });
});
```

### Mocking API Calls

```javascript
import { render, screen, waitFor } from '@testing-library/react';
import axios from 'axios';
import UserList from './UserList';

jest.mock('axios');
const mockedAxios = axios;

test('fetches and displays users', async () => {
  const users = [{ id: 1, name: 'John' }, { id: 2, name: 'Jane' }];
  mockedAxios.get.mockResolvedValue({ data: users });

  render(<UserList />);

  await waitFor(() => {
    expect(screen.getByText('John')).toBeInTheDocument();
    expect(screen.getByText('Jane')).toBeInTheDocument();
  });
});
```

### Testing Forms

```javascript
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import ContactForm from './ContactForm';

test('submits form with valid data', async () => {
  const handleSubmit = jest.fn();
  render(<ContactForm onSubmit={handleSubmit} />);

  fireEvent.change(screen.getByLabelText(/name/i), {
    target: { value: 'John Doe' },
  });
  fireEvent.change(screen.getByLabelText(/email/i), {
    target: { value: 'john@example.com' },
  });

  fireEvent.click(screen.getByText(/submit/i));

  await waitFor(() => {
    expect(handleSubmit).toHaveBeenCalledWith({
      name: 'John Doe',
      email: 'john@example.com',
    });
  });
});
```

### Testing Custom Hooks

```javascript
import { renderHook, act } from '@testing-library/react';
import useCounter from './useCounter';

test('should increment counter', () => {
  const { result } = renderHook(() => useCounter());

  act(() => {
    result.current.increment();
  });

  expect(result.current.count).toBe(1);
});
```

## Testing with Jest

### Snapshot Testing

```javascript
import { render } from '@testing-library/react';
import Button from './Button';

test('Button matches snapshot', () => {
  const { asFragment } = render(<Button>Click me</Button>);
  expect(asFragment()).toMatchSnapshot();
});
```

### Mocking Functions

```javascript
import { render, screen, fireEvent } from '@testing-library/react';
import TodoList from './TodoList';

const mockAddTodo = jest.fn();

test('calls addTodo when form is submitted', () => {
  render(<TodoList addTodo={mockAddTodo} />);
  const input = screen.getByPlaceholderText('Add todo');
  const button = screen.getByText('Add');

  fireEvent.change(input, { target: { value: 'New todo' } });
  fireEvent.click(button);

  expect(mockAddTodo).toHaveBeenCalledWith('New todo');
});
```

## Testing Context

```javascript
import { render, screen } from '@testing-library/react';
import { ThemeProvider } from './ThemeContext';
import ThemedComponent from './ThemedComponent';

test('renders with theme', () => {
  render(
    <ThemeProvider value={{ theme: 'dark' }}>
      <ThemedComponent />
    </ThemeProvider>
  );

  expect(screen.getByTestId('theme-container')).toHaveClass('dark');
});
```

## Testing Redux Components

```javascript
import { render } from '@testing-library/react';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import rootReducer from './reducers';
import Counter from './Counter';

test('renders counter with Redux', () => {
  const store = createStore(rootReducer, { counter: { value: 5 } });
  render(
    <Provider store={store}>
      <Counter />
    </Provider>
  );

  expect(screen.getByText('5')).toBeInTheDocument();
});
```

## Testing Router Components

```javascript
import { render, screen } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';
import Nav from './Nav';

test('renders navigation links', () => {
  render(
    <BrowserRouter>
      <Nav />
    </BrowserRouter>
  );

  expect(screen.getByText('Home')).toBeInTheDocument();
  expect(screen.getByText('About')).toBeInTheDocument();
});
```

## Accessibility Testing

```javascript
import { render, screen } from '@testing-library/react';
import Button from './Button';

test('button is accessible', () => {
  render(<Button>Click me</Button>);
  const button = screen.getByRole('button', { name: /click me/i });
  expect(button).toBeInTheDocument();
});
```

## Testing Best Practices

1. **Test user behavior, not implementation details**
2. **Use descriptive test names**
3. **Group related tests with `describe`**
4. **Mock external dependencies**
5. **Test edge cases and error states**
6. **Keep tests fast and isolated**
7. **Use `data-testid` sparingly, prefer semantic queries**

```javascript
describe('Counter component', () => {
  test('starts with count 0', () => {
    render(<Counter />);
    expect(screen.getByText('0')).toBeInTheDocument();
  });

  test('increments count when + button is clicked', () => {
    render(<Counter />);
    const incrementButton = screen.getByRole('button', { name: '+' });
    fireEvent.click(incrementButton);
    expect(screen.getByText('1')).toBeInTheDocument();
  });

  test('decrements count when - button is clicked', () => {
    render(<Counter />);
    const decrementButton = screen.getByRole('button', { name: '-' });
    fireEvent.click(decrementButton);
    expect(screen.getByText('-1')).toBeInTheDocument();
  });
});
```

## Integration Testing

```javascript
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import App from './App';

test('full user flow', async () => {
  render(<App />);

  // Navigate to add todo page
  fireEvent.click(screen.getByText('Add Todo'));

  // Fill out form
  fireEvent.change(screen.getByLabelText('Title'), {
    target: { value: 'Test Todo' },
  });
  fireEvent.click(screen.getByText('Submit'));

  // Check if todo was added
  await waitFor(() => {
    expect(screen.getByText('Test Todo')).toBeInTheDocument();
  });
});
```

## Test Coverage

```bash
npm test -- --coverage
```

This generates a coverage report showing which lines of code are tested.

## Summary

Testing React components ensures reliability and maintainability. React Testing Library encourages testing from the user's perspective, leading to more robust tests. Combine unit tests, integration tests, and end-to-end tests for comprehensive coverage.
