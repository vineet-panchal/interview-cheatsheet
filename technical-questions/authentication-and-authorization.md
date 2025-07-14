# Authentication and Authorization Questions

## JSON Web Tokens (JWT)

#### 1. Can you explain JWT?s

- JWT (JSON Web Token) is an authentication method where the server generates a signed token containing user information and permissions. 
- When a user logs in, the server creates a JWT and sends it to the client. The client stores this token and includes it in the Authorization header for subsequent requests.
- the primary use case for JSON Web token is authorization meaning what can I access within an application
- for example, when a user wants to log in to some app (a node js application), they intially make a login request
- if their creadentials are valid I can return a token
- for any future request they make to the app, as long as they include the token and I am able ot validate it, we know they are already logged in as some user without having to maintain any kind of state in my own application

#### 2. Can you break down what a JWT actually looks like?

- a JWT has three components, a header, a payload, and a signature
- the header includes information about the algorithm we're using to sign the token and the type of token it actually is
- the payload includes the actual information (64 encoded) 
- the signature is what the backend can use to verify that this is a valid JWT and the user can access certain resources

#### 3. Why would you choose JWT authentication over other authentication methods?

- I would choose JWT over other methods because its stateless, meaning the server doesn't need to store session information, making it scalable for distributed systems
- The token contains all necessary user information, and since its signed, we can verify its authenticity
- For my MERN app, this worked well because it allowed seamless communication between the React frontend and Express backend without requiring server-side session storage