# React Routing

Routing in React allows you to create single-page applications with navigation between different views or pages without full page reloads.

## React Router

React Router is the most popular routing library for React.

### Installation

```bash
npm install react-router-dom
```

### Basic Setup

```javascript
import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';

function Home() {
  return <h2>Home Page</h2>;
}

function About() {
  return <h2>About Page</h2>;
}

function App() {
  return (
    <Router>
      <nav>
        <Link to="/">Home</Link> | <Link to="/about">About</Link>
      </nav>

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
      </Routes>
    </Router>
  );
}

export default App;
```

### Route Parameters

```javascript
function UserProfile() {
  const { userId } = useParams();

  return <h2>User Profile for User ID: {userId}</h2>;
}

<Routes>
  <Route path="/user/:userId" element={<UserProfile />} />
</Routes>
```

### Nested Routes

```javascript
function Dashboard() {
  return (
    <div>
      <h2>Dashboard</h2>
      <Outlet />
    </div>
  );
}

function Stats() {
  return <h3>Stats Section</h3>;
}

<Routes>
  <Route path="/dashboard" element={<Dashboard />}>
    <Route path="stats" element={<Stats />} />
  </Route>
</Routes>
```

### Redirects and Navigation

```javascript
import { Navigate, useNavigate } from 'react-router-dom';

// Redirect example
<Routes>
  <Route path="/old-path" element={<Navigate to="/new-path" replace />} />
</Routes>

// Programmatic navigation
function Login() {
  const navigate = useNavigate();

  const handleLogin = () => {
    // Perform login logic
    navigate('/dashboard');
  };

  return <button onClick={handleLogin}>Login</button>;
}
```

### Query Parameters

React Router does not parse query parameters by default. Use `URLSearchParams`:

```javascript
import { useLocation } from 'react-router-dom';

function Search() {
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const query = queryParams.get('q');

  return <h2>Search results for: {query}</h2>;
}
```

### Link vs NavLink

- `Link` is used for navigation.
- `NavLink` adds styling attributes when the link is active.

```javascript
import { NavLink } from 'react-router-dom';

<NavLink to="/about" activeClassName="active">
  About
</NavLink>
```

### Programmatic Navigation with useNavigate

```javascript
import { useNavigate } from 'react-router-dom';

function Home() {
  const navigate = useNavigate();

  return (
    <button onClick={() => navigate('/about')}>
      Go to About
    </button>
  );
}
```

### Handling 404 Not Found

```javascript
function NotFound() {
  return <h2>404 - Page Not Found</h2>;
}

<Routes>
  {/* other routes */}
  <Route path="*" element={<NotFound />} />
</Routes>
```

### Route Guards (Protected Routes)

```javascript
function PrivateRoute({ children }) {
  const isAuthenticated = /* your auth logic */ true;

  return isAuthenticated ? children : <Navigate to="/login" />;
}

<Routes>
  <Route
    path="/dashboard"
    element={
      <PrivateRoute>
        <Dashboard />
      </PrivateRoute>
    }
  />
</Routes>
```

### Lazy Loading Routes

```javascript
import React, { Suspense, lazy } from 'react';

const Home = lazy(() => import('./Home'));
const About = lazy(() => import('./About'));

function App() {
  return (
    <Router>
      <Suspense fallback={<div>Loading...</div>}>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about" element={<About />} />
        </Routes>
      </Suspense>
    </Router>
  );
}
```

## Other Routing Libraries

- **Reach Router**: Simpler API, now merged with React Router
- **Next.js Routing**: File-based routing for server-side rendered React apps

## Summary

React Router provides a powerful and flexible way to handle routing in React applications. It supports nested routes, route parameters, programmatic navigation, and more. Proper routing enhances user experience by enabling smooth navigation without full page reloads.
