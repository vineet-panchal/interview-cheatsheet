# React Hooks with TypeScript and Advanced Patterns

## useState with TypeScript

### Basic useState

```tsx
const [count, setCount] = useState<number>(0);
const [name, setName] = useState<string>('');
const [user, setUser] = useState<User | null>(null);
```

### State with Complex Types

```tsx
interface Todo {
  id: number;
  text: string;
  completed: boolean;
}

const [todos, setTodos] = useState<Todo[]>([]);
```

### State with Union Types

```tsx
type LoadingState = 'idle' | 'loading' | 'success' | 'error';

const [loadingState, setLoadingState] = useState<LoadingState>('idle');
```

## useEffect with TypeScript

### Basic useEffect

```tsx
useEffect(() => {
  console.log('Component mounted or updated');
}, []);
```

### useEffect with Dependencies

```tsx
const [userId, setUserId] = useState<number>(1);

useEffect(() => {
  const fetchUser = async (): Promise<void> => {
    const response = await fetch(`/api/users/${userId}`);
    const user = await response.json();
    setUser(user);
  };

  fetchUser();
}, [userId]);
```

### Cleanup Function

```tsx
useEffect(() => {
  const timer = setInterval(() => {
    setTime(new Date());
  }, 1000);

  return () => {
    clearInterval(timer);
  };
}, []);
```

## useRef with TypeScript

### Basic useRef

```tsx
const inputRef = useRef<HTMLInputElement>(null);

const focusInput = (): void => {
  inputRef.current?.focus();
};
```

### useRef with Mutable Values

```tsx
const renderCount = useRef<number>(0);

useEffect(() => {
  renderCount.current += 1;
});
```

## useCallback with TypeScript

### Basic useCallback

```tsx
const handleClick = useCallback((): void => {
  console.log('Button clicked');
}, []);
```

### useCallback with Parameters

```tsx
const handleItemClick = useCallback((id: number): void => {
  setSelectedId(id);
}, []);
```

### useCallback with Dependencies

```tsx
const [count, setCount] = useState<number>(0);

const increment = useCallback((): void => {
  setCount(prev => prev + 1);
}, []);
```

## useMemo with TypeScript

### Basic useMemo

```tsx
const expensiveValue = useMemo((): number => {
  return computeExpensiveValue(a, b);
}, [a, b]);
```

### useMemo with Complex Types

```tsx
const filteredUsers = useMemo((): User[] => {
  return users.filter(user =>
    user.name.toLowerCase().includes(searchTerm.toLowerCase())
  );
}, [users, searchTerm]);
```

## useReducer with TypeScript

### Basic useReducer

```tsx
interface State {
  count: number;
}

type Action = { type: 'increment' } | { type: 'decrement' };

const initialState: State = { count: 0 };

const reducer = (state: State, action: Action): State => {
  switch (action.type) {
    case 'increment':
      return { count: state.count + 1 };
    case 'decrement':
      return { count: state.count - 1 };
    default:
      return state;
  }
};

const [state, dispatch] = useReducer(reducer, initialState);
```

### Complex useReducer

```tsx
interface TodoState {
  todos: Todo[];
  filter: 'all' | 'completed' | 'active';
}

type TodoAction =
  | { type: 'ADD_TODO'; payload: string }
  | { type: 'TOGGLE_TODO'; payload: number }
  | { type: 'SET_FILTER'; payload: 'all' | 'completed' | 'active' };

const todoReducer = (state: TodoState, action: TodoAction): TodoState => {
  switch (action.type) {
    case 'ADD_TODO':
      return {
        ...state,
        todos: [
          ...state.todos,
          { id: Date.now(), text: action.payload, completed: false }
        ]
      };
    case 'TOGGLE_TODO':
      return {
        ...state,
        todos: state.todos.map(todo =>
          todo.id === action.payload
            ? { ...todo, completed: !todo.completed }
            : todo
        )
      };
    case 'SET_FILTER':
      return { ...state, filter: action.payload };
    default:
      return state;
  }
};
```

## Custom Hooks with TypeScript

### Basic Custom Hook

```tsx
const useCounter = (initialValue: number = 0) => {
  const [count, setCount] = useState<number>(initialValue);

  const increment = useCallback((): void => {
    setCount(prev => prev + 1);
  }, []);

  const decrement = useCallback((): void => {
    setCount(prev => prev - 1);
  }, []);

  const reset = useCallback((): void => {
    setCount(initialValue);
  }, [initialValue]);

  return { count, increment, decrement, reset };
};
```

### Custom Hook with API Calls

```tsx
interface UseApiState<T> {
  data: T | null;
  loading: boolean;
  error: string | null;
}

const useApi = <T>(url: string): UseApiState<T> => {
  const [data, setData] = useState<T | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchData = async (): Promise<void> => {
      try {
        const response = await fetch(url);
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const result: T = await response.json();
        setData(result);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'An error occurred');
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [url]);

  return { data, loading, error };
};
```

### Custom Hook with Local Storage

```tsx
const useLocalStorage = <T>(
  key: string,
  initialValue: T
): [T, (value: T | ((val: T) => T)) => void] => {
  const [storedValue, setStoredValue] = useState<T>(() => {
    try {
      const item = window.localStorage.getItem(key);
      return item ? JSON.parse(item) : initialValue;
    } catch (error) {
      console.error(error);
      return initialValue;
    }
  });

  const setValue = useCallback(
    (value: T | ((val: T) => T)): void => {
      try {
        const valueToStore = value instanceof Function ? value(storedValue) : value;
        setStoredValue(valueToStore);
        window.localStorage.setItem(key, JSON.stringify(valueToStore));
      } catch (error) {
        console.error(error);
      }
    },
    [key, storedValue]
  );

  return [storedValue, setValue];
};
```

## useContext with TypeScript

### Creating Typed Context

```tsx
interface Theme {
  primaryColor: string;
  secondaryColor: string;
}

const ThemeContext = React.createContext<Theme | undefined>(undefined);

const useTheme = (): Theme => {
  const context = useContext(ThemeContext);
  if (context === undefined) {
    throw new Error('useTheme must be used within a ThemeProvider');
  }
  return context;
};

interface ThemeProviderProps {
  children: React.ReactNode;
  theme: Theme;
}

const ThemeProvider = ({ children, theme }: ThemeProviderProps): JSX.Element => {
  return (
    <ThemeContext.Provider value={theme}>
      {children}
    </ThemeContext.Provider>
  );
};
```

### Complex Context with Actions

```tsx
interface User {
  id: number;
  name: string;
  email: string;
}

interface AuthState {
  user: User | null;
  isAuthenticated: boolean;
}

type AuthAction =
  | { type: 'LOGIN'; payload: User }
  | { type: 'LOGOUT' };

const AuthContext = React.createContext<{
  state: AuthState;
  dispatch: React.Dispatch<AuthAction>;
} | undefined>(undefined);

const authReducer = (state: AuthState, action: AuthAction): AuthState => {
  switch (action.type) {
    case 'LOGIN':
      return {
        user: action.payload,
        isAuthenticated: true,
      };
    case 'LOGOUT':
      return {
        user: null,
        isAuthenticated: false,
      };
    default:
      return state;
  }
};

const AuthProvider = ({ children }: { children: React.ReactNode }): JSX.Element => {
  const [state, dispatch] = useReducer(authReducer, {
    user: null,
    isAuthenticated: false,
  });

  return (
    <AuthContext.Provider value={{ state, dispatch }}>
      {children}
    </AuthContext.Provider>
  );
};

const useAuth = (): { state: AuthState; dispatch: React.Dispatch<AuthAction> } => {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};
```

## Advanced Patterns

### Generic Hooks

```tsx
const useList = <T>(initialList: T[] = []) => {
  const [list, setList] = useState<T[]>(initialList);

  const add = useCallback((item: T): void => {
    setList(prev => [...prev, item]);
  }, []);

  const remove = useCallback((index: number): void => {
    setList(prev => prev.filter((_, i) => i !== index));
  }, []);

  const update = useCallback((index: number, item: T): void => {
    setList(prev => prev.map((current, i) => i === index ? item : current));
  }, []);

  const clear = useCallback((): void => {
    setList([]);
  }, []);

  return { list, add, remove, update, clear };
};
```

### Hook Composition

```tsx
const useForm = <T extends Record<string, any>>(initialValues: T) => {
  const [values, setValues] = useState<T>(initialValues);
  const [errors, setErrors] = useState<Partial<Record<keyof T, string>>>({});
  const [touched, setTouched] = useState<Partial<Record<keyof T, boolean>>>({});

  const setValue = useCallback(<K extends keyof T>(field: K, value: T[K]): void => {
    setValues(prev => ({ ...prev, [field]: value }));
  }, []);

  const setError = useCallback(<K extends keyof T>(field: K, error: string): void => {
    setErrors(prev => ({ ...prev, [field]: error }));
  }, []);

  const setTouched = useCallback(<K extends keyof T>(field: K, isTouched: boolean = true): void => {
    setTouched(prev => ({ ...prev, [field]: isTouched }));
  }, []);

  const reset = useCallback((): void => {
    setValues(initialValues);
    setErrors({});
    setTouched({});
  }, [initialValues]);

  return {
    values,
    errors,
    touched,
    setValue,
    setError,
    setTouched,
    reset,
  };
};
```

## Summary

TypeScript enhances React hooks by providing type safety and better developer experience. The examples above demonstrate how to properly type hooks, create custom hooks, and implement advanced patterns. Using TypeScript with hooks helps catch errors early and makes code more maintainable.
