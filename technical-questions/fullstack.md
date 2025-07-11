# Full-Stack Development Questions


## About Your Experience and Projects
#### 1. I see you build a MERN application with JWT authentication. Can you walk me through how JWT works and why you chose it over other authentication methods?

- JWT (JSON Web Token) is a stateless authentication method where the server generates a signed token containing user information and permissions
- When a user logs in, the server creates a JWT and sends it to the client. The client stores this token and includes it in the Authorization header for subsequent requests.
- I chose JWT because it's stateless - the server doesn't need to store session information, making it scalable for distributed systems.
- The token contains all necessary user information, and since it's signed, we can verify its authenticity.
- For our MERN application, this worked well because it allowed seamless communication between our React frontend and Express backend without requiring server-side session storage.

#### 2. You mention implementing role-based routing. How did you structure this in your application?

- I implemented role-based routing using a combination of middleware and React components.
- On the backend, i created middleware that verifies the JWT token and checks the user's role against the required permissions for each endpoint
- On the frontend, I created a ProtectedRoute component that wraps sensitive routes and checks the user's role before rendering the component.
- For example, admin routes would check if the user has 'admin' role in their token payload, which regular user routes would check for 'user' role
- I also implemented route guards that redirect unauthorized users to appropriate pages

#### 3. What is the difference between server-side rendering and client-side rendering? When would you use each?

- Server-side rendering (SSR) renders the HTML on the server before sending it to the client, which client-side rendering (CSR) sends minimal HTML and JavaScript renders the page in the browser
- I use SSR for SEO-critical pages and better initial load times, like our Teach for Cambodia platform's public course pages. 
- CSR is better for highly interactive applications where users spend time after initial load
- Next.js makes this easy with its hybrid approach, I can use server-sid  e rendering for landing pages and client-side rendering for dashboard components
- For my teaching platform, I used server-side rendering for course discovery pages and client-side rendering for the interactive lesson builder


#### 4. How do you handle state management in large React applications?

- for large applications, I use a combination of approaches. 
- For component-level state, I use useState and useReducer.
- for global state that needs to be shared across components, I've used Context API for smaller applications and Redux Toolkit for more complex state management


#### 5. Explain how you would implement middleware in Express.js and give an example.

- Express middleware are functions that have access to the request object, response object, and the next middleware function.
- They execute in the roder they're defined and can modify the request/response or end the request-response cucle
- Here's an example of authentication middleware I implemented: 
```javascript
const authenticateToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  
  if (!token) {
    return res.status(401).json({ error: 'Access token required' });
  }
  
  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) return res.status(403).json({ error: 'Invalid token' });
    req.user = user;
    next();
  });
};
```

#### 6. How do you handle environment variables and configuration in your applications?

- I use environment variables to store sensitive infomration and configuration that changes between environments. 
- I create .env files for local development and use platform-specific configuration for production
- for example, in my projects I store database URLs, API keys, and JWT secrets in environment variables
- I use the dotenv library to load these in development and ensure .env files are in .gitignore
- for production, I configure these through the hosting platform's environment settings.
- I also validate required environment variables on application startup to catch configuration errors early. 

