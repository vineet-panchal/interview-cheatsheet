# React State Management

State management is crucial in React applications as they grow in complexity. This document covers various approaches to managing state in React applications.

## Local State with useState

For simple state within a component, `useState` is sufficient.

```javascript
import React, { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
```

## Lifting State Up

When multiple components need to share state, lift it to their common parent.

```javascript
function App() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <Counter count={count} setCount={setCount} />
      <Display count={count} />
    </div>
  );
}

function Counter({ count, setCount }) {
  return <button onClick={() => setCount(count + 1)}>Increment</button>;
}

function Display({ count }) {
  return <p>Count: {count}</p>;
}
```

## Context API

Context provides a way to pass data through the component tree without prop drilling.

```javascript
import React, { createContext, useContext, useState } from 'react';

const CountContext = createContext();

function CountProvider({ children }) {
  const [count, setCount] = useState(0);

  return (
    <CountContext.Provider value={{ count, setCount }}>
      {children}
    </CountContext.Provider>
  );
}

function Counter() {
  const { count, setCount } = useContext(CountContext);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}

function App() {
  return (
    <CountProvider>
      <Counter />
      <AnotherComponent />
    </CountProvider>
  );
}
```

### Complex Context Example

```javascript
const ThemeContext = createContext();
const UserContext = createContext();

function App() {
  const [theme, setTheme] = useState('light');
  const [user, setUser] = useState({ name: 'John', role: 'admin' });

  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      <UserContext.Provider value={{ user, setUser }}>
        <Header />
        <Main />
      </UserContext.Provider>
    </ThemeContext.Provider>
  );
}

function Header() {
  const { theme, setTheme } = useContext(ThemeContext);
  const { user } = useContext(UserContext);

  return (
    <header>
      <h1>Welcome, {user.name}</h1>
      <button onClick={() => setTheme(theme === 'light' ? 'dark' : 'light')}>
        Toggle Theme
      </button>
    </header>
  );
}
```

## useReducer for Complex State

For complex state logic, `useReducer` can be more appropriate than `useState`.

```javascript
import React, { useReducer } from 'react';

const initialState = {
  todos: [],
  filter: 'all'
};

function todoReducer(state, action) {
  switch (action.type) {
    case 'ADD_TODO':
      return {
        ...state,
        todos: [...state.todos, {
          id: Date.now(),
          text: action.text,
          completed: false
        }]
      };
    case 'TOGGLE_TODO':
      return {
        ...state,
        todos: state.todos.map(todo =>
          todo.id === action.id ? { ...todo, completed: !todo.completed } : todo
        )
      };
    case 'SET_FILTER':
      return {
        ...state,
        filter: action.filter
      };
    default:
      return state;
  }
}

function TodoApp() {
  const [state, dispatch] = useReducer(todoReducer, initialState);
  const [text, setText] = useState('');

  const filteredTodos = state.todos.filter(todo => {
    if (state.filter === 'completed') return todo.completed;
    if (state.filter === 'active') return !todo.completed;
    return true;
  });

  const addTodo = () => {
    if (text.trim()) {
      dispatch({ type: 'ADD_TODO', text });
      setText('');
    }
  };

  return (
    <div>
      <input
        value={text}
        onChange={(e) => setText(e.target.value)}
        placeholder="Add todo"
      />
      <button onClick={addTodo}>Add</button>

      <div>
        <button onClick={() => dispatch({ type: 'SET_FILTER', filter: 'all' })}>
          All
        </button>
        <button onClick={() => dispatch({ type: 'SET_FILTER', filter: 'active' })}>
          Active
        </button>
        <button onClick={() => dispatch({ type: 'SET_FILTER', filter: 'completed' })}>
          Completed
        </button>
      </div>

      <ul>
        {filteredTodos.map(todo => (
          <li key={todo.id}>
            <input
              type="checkbox"
              checked={todo.completed}
              onChange={() => dispatch({ type: 'TOGGLE_TODO', id: todo.id })}
            />
            {todo.text}
          </li>
        ))}
      </ul>
    </div>
  );
}
```

## Redux

Redux is a predictable state container for JavaScript applications.

### Basic Redux Setup

```javascript
// store.js
import { createStore } from 'redux';

const initialState = {
  count: 0
};

function counterReducer(state = initialState, action) {
  switch (action.type) {
    case 'INCREMENT':
      return { ...state, count: state.count + 1 };
    case 'DECREMENT':
      return { ...state, count: state.count - 1 };
    default:
      return state;
  }
}

const store = createStore(counterReducer);

export default store;
```

### Connecting React to Redux

```javascript
// App.js
import React from 'react';
import { Provider } from 'react-redux';
import store from './store';
import Counter from './Counter';

function App() {
  return (
    <Provider store={store}>
      <Counter />
    </Provider>
  );
}

export default App;
```

### Using Redux with Hooks

```javascript
// Counter.js
import React from 'react';
import { useSelector, useDispatch } from 'react-redux';

function Counter() {
  const count = useSelector(state => state.count);
  const dispatch = useDispatch();

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => dispatch({ type: 'INCREMENT' })}>+</button>
      <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
    </div>
  );
}

export default Counter;
```

### Redux with Async Actions

```javascript
// actions.js
export const fetchUsersRequest = () => ({ type: 'FETCH_USERS_REQUEST' });
export const fetchUsersSuccess = (users) => ({ type: 'FETCH_USERS_SUCCESS', payload: users });
export const fetchUsersFailure = (error) => ({ type: 'FETCH_USERS_FAILURE', payload: error });

// thunk action creator
export const fetchUsers = () => {
  return async (dispatch) => {
    dispatch(fetchUsersRequest());
    try {
      const response = await fetch('/api/users');
      const users = await response.json();
      dispatch(fetchUsersSuccess(users));
    } catch (error) {
      dispatch(fetchUsersFailure(error.message));
    }
  };
};
```

```javascript
// reducer.js
const initialState = {
  loading: false,
  users: [],
  error: null
};

function usersReducer(state = initialState, action) {
  switch (action.type) {
    case 'FETCH_USERS_REQUEST':
      return { ...state, loading: true };
    case 'FETCH_USERS_SUCCESS':
      return { ...state, loading: false, users: action.payload, error: null };
    case 'FETCH_USERS_FAILURE':
      return { ...state, loading: false, error: action.payload };
    default:
      return state;
  }
}

export default usersReducer;
```

```javascript
// UsersList.js
import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { fetchUsers } from './actions';

function UsersList() {
  const { loading, users, error } = useSelector(state => state.users);
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchUsers());
  }, [dispatch]);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <ul>
      {users.map(user => (
        <li key={user.id}>{user.name}</li>
      ))}
    </ul>
  );
}
```

## Redux Toolkit

Redux Toolkit simplifies Redux setup and reduces boilerplate.

```javascript
// features/counterSlice.js
import { createSlice } from '@reduxjs/toolkit';

const counterSlice = createSlice({
  name: 'counter',
  initialState: { value: 0 },
  reducers: {
    increment: (state) => {
      state.value += 1;
    },
    decrement: (state) => {
      state.value -= 1;
    },
    incrementByAmount: (state, action) => {
      state.value += action.payload;
    },
  },
});

export const { increment, decrement, incrementByAmount } = counterSlice.actions;
export default counterSlice.reducer;
```

```javascript
// store.js
import { configureStore } from '@reduxjs/toolkit';
import counterReducer from './features/counterSlice';

export const store = configureStore({
  reducer: {
    counter: counterReducer,
  },
});
```

```javascript
// Counter.js
import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { increment, decrement, incrementByAmount } from './features/counterSlice';

function Counter() {
  const count = useSelector(state => state.counter.value);
  const dispatch = useDispatch();

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => dispatch(increment())}>+</button>
      <button onClick={() => dispatch(decrement())}>-</button>
      <button onClick={() => dispatch(incrementByAmount(5))}>+5</button>
    </div>
  );
}
```

## Zustand

Zustand is a small, fast state management library.

```javascript
// store.js
import create from 'zustand';

const useStore = create((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
  decrement: () => set((state) => ({ count: state.count - 1 })),
  reset: () => set({ count: 0 }),
}));

export default useStore;
```

```javascript
// Counter.js
import React from 'react';
import useStore from './store';

function Counter() {
  const { count, increment, decrement, reset } = useStore();

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={increment}>+</button>
      <button onClick={decrement}>-</button>
      <button onClick={reset}>Reset</button>
    </div>
  );
}
```

### Zustand with Async Actions

```javascript
// store.js
import create from 'zustand';

const useUsersStore = create((set) => ({
  users: [],
  loading: false,
  error: null,
  fetchUsers: async () => {
    set({ loading: true });
    try {
      const response = await fetch('/api/users');
      const users = await response.json();
      set({ users, loading: false, error: null });
    } catch (error) {
      set({ error: error.message, loading: false });
    }
  },
}));

export default useUsersStore;
```

```javascript
// UsersList.js
import React, { useEffect } from 'react';
import useUsersStore from './store';

function UsersList() {
  const { users, loading, error, fetchUsers } = useUsersStore();

  useEffect(() => {
    fetchUsers();
  }, [fetchUsers]);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <ul>
      {users.map(user => (
        <li key={user.id}>{user.name}</li>
      ))}
    </ul>
  );
}
```

## Recoil

Recoil is a state management library for React that provides several capabilities.

```javascript
// atoms.js
import { atom } from 'recoil';

export const countState = atom({
  key: 'countState',
  default: 0,
});

export const userState = atom({
  key: 'userState',
  default: { name: '', email: '' },
});
```

```javascript
// selectors.js
import { selector } from 'recoil';
import { userState } from './atoms';

export const userNameState = selector({
  key: 'userNameState',
  get: ({ get }) => {
    const user = get(userState);
    return user.name;
  },
});
```

```javascript
// App.js
import React from 'react';
import { RecoilRoot } from 'recoil';
import Counter from './Counter';
import UserForm from './UserForm';

function App() {
  return (
    <RecoilRoot>
      <Counter />
      <UserForm />
    </RecoilRoot>
  );
}
```

```javascript
// Counter.js
import React from 'react';
import { useRecoilState } from 'recoil';
import { countState } from './atoms';

function Counter() {
  const [count, setCount] = useRecoilState(countState);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
```

```javascript
// UserForm.js
import React from 'react';
import { useRecoilState, useRecoilValue } from 'recoil';
import { userState, userNameState } from './atoms';

function UserForm() {
  const [user, setUser] = useRecoilState(userState);
  const userName = useRecoilValue(userNameState);

  return (
    <div>
      <p>User Name: {userName}</p>
      <input
        value={user.name}
        onChange={(e) => setUser({ ...user, name: e.target.value })}
        placeholder="Name"
      />
      <input
        value={user.email}
        onChange={(e) => setUser({ ...user, email: e.target.value })}
        placeholder="Email"
      />
    </div>
  );
}
```

## Choosing a State Management Solution

- **Local state with useState/useReducer**: For component-specific state
- **Context API**: For prop drilling issues in small to medium apps
- **Redux**: For complex state logic, time-travel debugging, large teams
- **Redux Toolkit**: Simplified Redux with less boilerplate
- **Zustand**: Lightweight alternative to Redux, great for small to medium apps
- **Recoil**: Modern state management with atoms and selectors

## Summary

Effective state management is crucial for scalable React applications. The choice of state management solution depends on the complexity of your application, team preferences, and specific requirements. Start with local state and Context API for simpler apps, and consider more robust solutions like Redux or Zustand as your application grows.
