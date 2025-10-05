# React Performance Optimization

Optimizing React applications is crucial for providing a smooth user experience. This guide covers various techniques to improve React app performance.

## React.memo

`React.memo` prevents unnecessary re-renders of functional components.

```javascript
import React from 'react';

const TodoItem = React.memo(({ todo, onToggle }) => {
  console.log('TodoItem rendered');
  return (
    <li>
      <input
        type="checkbox"
        checked={todo.completed}
        onChange={() => onToggle(todo.id)}
      />
      {todo.text}
    </li>
  );
});
```

### Custom Comparison Function

```javascript
const TodoItem = React.memo(
  ({ todo, onToggle }) => {
    return (
      <li>
        <input
          type="checkbox"
          checked={todo.completed}
          onChange={() => onToggle(todo.id)}
        />
        {todo.text}
      </li>
    );
  },
  (prevProps, nextProps) => {
    // Only re-render if todo text or completed status changed
    return (
      prevProps.todo.text === nextProps.todo.text &&
      prevProps.todo.completed === nextProps.todo.completed
    );
  }
);
```

## useMemo

`useMemo` memoizes expensive computations.

```javascript
import React, { useMemo } from 'react';

function ExpensiveComponent({ numbers }) {
  const sum = useMemo(() => {
    console.log('Calculating sum...');
    return numbers.reduce((acc, num) => acc + num, 0);
  }, [numbers]);

  return <div>Sum: {sum}</div>;
}
```

### Complex Memoization

```javascript
function UserList({ users, filter }) {
  const filteredUsers = useMemo(() => {
    console.log('Filtering users...');
    return users.filter(user =>
      user.name.toLowerCase().includes(filter.toLowerCase())
    );
  }, [users, filter]);

  return (
    <ul>
      {filteredUsers.map(user => (
        <li key={user.id}>{user.name}</li>
      ))}
    </ul>
  );
}
```

## useCallback

`useCallback` memoizes functions to prevent unnecessary re-renders of child components.

```javascript
import React, { useCallback } from 'react';

function ParentComponent() {
  const [count, setCount] = useState(0);

  const increment = useCallback(() => {
    setCount(c => c + 1);
  }, []);

  return (
    <div>
      <p>Count: {count}</p>
      <ChildComponent onIncrement={increment} />
    </div>
  );
}

const ChildComponent = React.memo(({ onIncrement }) => {
  console.log('ChildComponent rendered');
  return <button onClick={onIncrement}>Increment</button>;
});
```

## Code Splitting

Code splitting allows you to split your code into smaller chunks that can be loaded on demand.

### React.lazy

```javascript
import React, { Suspense, lazy } from 'react';

const Home = lazy(() => import('./Home'));
const About = lazy(() => import('./About'));

function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
      </Routes>
    </Suspense>
  );
}
```

### Route-based Code Splitting

```javascript
import { lazy } from 'react';

const Home = lazy(() => import('./pages/Home'));
const About = lazy(() => import('./pages/About'));
const Contact = lazy(() => import('./pages/Contact'));

// In your router
<Routes>
  <Route path="/" element={<Home />} />
  <Route path="/about" element={<About />} />
  <Route path="/contact" element={<Contact />} />
</Routes>
```

## Bundle Analysis

Use tools to analyze your bundle size and identify large dependencies.

```bash
npm install --save-dev webpack-bundle-analyzer
```

```javascript
// In your webpack config
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

module.exports = {
  plugins: [
    new BundleAnalyzerPlugin()
  ]
};
```

## Optimizing Images

### Image Optimization

```javascript
// Use next/image for Next.js
import Image from 'next/image';

<Image
  src="/hero.jpg"
  alt="Hero image"
  width={800}
  height={600}
  priority // For above-the-fold images
/>
```

### Lazy Loading Images

```javascript
import React, { useState, useRef, useEffect } from 'react';

function LazyImage({ src, alt }) {
  const [isLoaded, setIsLoaded] = useState(false);
  const imgRef = useRef();

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsLoaded(true);
          observer.disconnect();
        }
      }
    );

    if (imgRef.current) {
      observer.observe(imgRef.current);
    }

    return () => observer.disconnect();
  }, []);

  return (
    <img
      ref={imgRef}
      src={isLoaded ? src : ''}
      alt={alt}
      loading="lazy"
    />
  );
}
```

## Virtual Scrolling

For large lists, use virtual scrolling to render only visible items.

```javascript
import React, { useState, useMemo } from 'react';

function VirtualList({ items, itemHeight, containerHeight }) {
  const [scrollTop, setScrollTop] = useState(0);

  const visibleItems = useMemo(() => {
    const startIndex = Math.floor(scrollTop / itemHeight);
    const endIndex = Math.min(
      startIndex + Math.ceil(containerHeight / itemHeight),
      items.length - 1
    );

    return items.slice(startIndex, endIndex + 1).map((item, index) => ({
      ...item,
      index: startIndex + index,
    }));
  }, [items, scrollTop, itemHeight, containerHeight]);

  return (
    <div
      style={{ height: containerHeight, overflow: 'auto' }}
      onScroll={(e) => setScrollTop(e.target.scrollTop)}
    >
      <div style={{ height: items.length * itemHeight }}>
        {visibleItems.map((item) => (
          <div
            key={item.id}
            style={{
              height: itemHeight,
              transform: `translateY(${item.index * itemHeight}px)`,
            }}
          >
            {item.name}
          </div>
        ))}
      </div>
    </div>
  );
}
```

## Optimizing Context

Context can cause unnecessary re-renders if not used carefully.

### Splitting Context

```javascript
// Instead of one large context
const AppContext = createContext();

// Split into multiple contexts
const ThemeContext = createContext();
const UserContext = createContext();
const SettingsContext = createContext();
```

### Memoizing Context Values

```javascript
const ThemeProvider = ({ children }) => {
  const [theme, setTheme] = useState('light');

  const contextValue = useMemo(() => ({
    theme,
    setTheme,
  }), [theme]);

  return (
    <ThemeContext.Provider value={contextValue}>
      {children}
    </ThemeContext.Provider>
  );
};
```

## useTransition and useDeferredValue

For non-urgent updates, use `useTransition` to keep the UI responsive.

```javascript
import React, { useState, useTransition, useDeferredValue } from 'react';

function SearchComponent() {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState([]);
  const [isPending, startTransition] = useTransition();

  const deferredQuery = useDeferredValue(query);

  React.useEffect(() => {
    startTransition(() => {
      // Expensive search operation
      const searchResults = performSearch(deferredQuery);
      setResults(searchResults);
    });
  }, [deferredQuery]);

  return (
    <div>
      <input
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        placeholder="Search..."
      />
      {isPending && <div>Searching...</div>}
      <ul>
        {results.map(result => (
          <li key={result.id}>{result.name}</li>
        ))}
      </ul>
    </div>
  );
}
```

## Profiling with React DevTools

Use React DevTools to identify performance bottlenecks.

```javascript
// In development, wrap components you want to profile
import { Profiler } from 'react';

function onRenderCallback(
  id,
  phase,
  actualDuration,
  baseDuration,
  startTime,
  commitTime
) {
  console.log(`${id} took ${actualDuration}ms to render`);
}

<Profiler id="TodoList" onRender={onRenderCallback}>
  <TodoList />
</Profiler>
```

## Optimizing Re-renders

### Avoiding Inline Functions

```javascript
// Bad - creates new function on every render
<button onClick={() => handleClick(item.id)}>Click</button>

// Good - use useCallback
const handleItemClick = useCallback((id) => {
  // handle click
}, []);

<button onClick={() => handleItemClick(item.id)}>Click</button>
```

### Stable Keys for Lists

```javascript
// Use stable, unique keys
{todos.map(todo => (
  <TodoItem key={todo.id} todo={todo} />
))}
```

## Bundle Optimization

### Tree Shaking

Ensure your bundler removes unused code.

```javascript
// Only import what you need
import { useState, useEffect } from 'react'; // Instead of import React from 'react'
```

### Dynamic Imports

```javascript
const loadComponent = () => import('./HeavyComponent');

function App() {
  const [Component, setComponent] = useState(null);

  const loadHeavyComponent = async () => {
    const { default: HeavyComponent } = await loadComponent();
    setComponent(() => HeavyComponent);
  };

  return (
    <div>
      <button onClick={loadHeavyComponent}>Load Heavy Component</button>
      {Component && <Component />}
    </div>
  );
}
```

## Server-Side Rendering (SSR)

For better initial load performance, consider SSR with Next.js or Gatsby.

```javascript
// pages/index.js in Next.js
export default function Home({ data }) {
  return (
    <div>
      <h1>{data.title}</h1>
      <p>{data.description}</p>
    </div>
  );
}

export async function getServerSideProps() {
  const res = await fetch('https://api.example.com/data');
  const data = await res.json();

  return {
    props: { data },
  };
}
```

## Summary

React performance optimization involves multiple techniques: preventing unnecessary re-renders, code splitting, lazy loading, and efficient state management. Use React DevTools to profile your app and identify bottlenecks. Start with the most impactful optimizations and measure improvements.
