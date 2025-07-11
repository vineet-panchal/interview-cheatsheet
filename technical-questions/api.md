# API Questions


#### 1. You implemented Websockets with Socket.io. Can you explain the difference between WebSockets and HTTP, and when you'd use each?

- HTTP is a request-response protocol where the client initiates communication nad the server responds. 
- It's stateless and works well for traditional web applications
- WebSockets, however, provide full-duplex communication, both client and server can initiate communication at any time 
- I used WebSockets for our chat functionality because we needed real-time bidirectional communication
- When on user sends a message, all other users need to receive it instantly without refreshing the page.
- HTTP would require constant polling, which is inefficient
- Socket.io was perfect because it provides WebSocket functionality with fallbacks for older browsers and additional features like rooms and namespaces

## RESTful APIs

#### 1. Can you explain RESTful APIs?

- REST is the most widely used standard for communication between a client and server over the internet


#### 2. Can you break down what a REST request would look like?

- A RESTful api request usually has 3 different components
- the first is the HTTP method (GET, POST, PATCH, DELETE)
- the second is the resource, REST APIs revolve around resources, this is something like books, users, or products, something like that
- finally, there is a unique identifier, to request for a specific object


#### 3. Can you explain how you name RESTful resources?

- I name resources with nouns, and not verbs
- the action is dictated by the HTTP method you're using like GET or DELETE, and the resource is always the same
- so we can have GET books or DELETE books


#### 4. What if we want to make multiple requests can we maintain state on the server side?

- a RESTful API should be stateless, meaning we don't have to remember anything about the client on the server side
- if we did need to source some information about the client we could do it in a database, but never in memory on the server


#### 5. Should there be any caching?

- because REST APIs are stateless, caching should also be possible


#### 6. What kind of response should a user expect to get within the JSON payload?

- RESTful APIs use standard HTTP response codes
- 2xx --> successful request
- 4xx --> client error
- 5xx --> server error


#### 7. Can you explain the difference between GET and POST?

- GET and POST are two HTTP methods
- GET retrieves data from a server with parameters visible in the URL query string
- POST sends data in the request body to create or modify server resources, allowing for larger payloads
- GET is idempotent meaning, it doesn't change server state, even after multiple calls
- while POST is not idempotent and can change the server state
- GET is less secure as parameters are visible in the URLs, and in browser history
- while in POST parameters aren't exposed in URLs




## About Your Experience and Projects

#### 1. How did you handle connection mangagement and error handling in your Socket.io implementation?

- I implemented several connection management strategies
- On the client side, I handled connection events like 'connect', 'disconnect', and 'reconnect' to provide user feedback. I also implemented exponential backoff for reconnnection attempts
- for error handling, I wrapped socket operations in try-catch blocks and implemented timeout mechanisms for critical operations.
- I also created different socket rooms for different chat channels and implemented proper cleanup when users leave rooms
- On the server side, I tracked active connections and implemented heartbeat mechnisms to detect stale connections.

#### 2. You developed a GraphQL API. What advantages does GraphQL offer over REST API's?

- GraphQL provides several advantages over REST.
- It allows clients to request exactly the date they need, reducing over-fetching and under-fetching
- With REST, you might need multiple endpoints to get related data, but GraphQL allows you to fetch everything in a single query
- GraphQL also provides a strong typing through its schema, which improves developer experience and catches errors early. 
- The introspection feature allows clients to discover available operations
- In my implementation, this was particularly useful because our frontend could request user data with nested relationships in one query instead of making multiple REST calls.


#### 3. How did you implement authentication in your GraphQL API?

- I implemented authentication at the resolver level using context. 
- When a request comes in, I verify the JWT token in the middleware and add the user information to the GraphQL context. 
- Each resolver can then access this context to check if the user is authenticated and has the required permissions.
- For mutations that require authentication, I created a requireAuth helper function that checks the context and throws an error if the user isn't authenticated. 
- I also implemented field-level authorization for sensitive data, ensuring users can only access their own data or data they have permission to view.

