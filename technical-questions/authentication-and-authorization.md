# Authentication and Authorization Questions

## JSON Web Tokens (JWT)

#### 1. Can you explain JWT?s

- the primary use case for JSON Web token is authorization meaning what can I access within an application
- for example, when a user wants to log in to some app (a node js application), they intially make a login request
- if their creadentials are valid I can return a token
- for any future request they make to the app, as long as they include the token and I am able ot validate it, we know they are already logged in as some user without having to maintain any kind of state in my own application

#### 2. Can you break down what a JWT actually looks like?

- a JWT has three components, a header, a payload, and a signature
- the header includes information about the algorithm we're using to sign the token and the type of token it actually is
- the payload includes the actual information (64 encoded) 
- the signature is what the backend can use to verify that this is a valid JWT and the user can access certain resources