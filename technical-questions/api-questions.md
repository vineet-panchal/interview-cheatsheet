# API Questions

#### 1. You implemented Websockets with Socket.io. Can you explain the difference between WebSockets and HTTP, and when you'd use each?

- HTTP is a request-response protocol where the client initiates communication nad the server responds. 
- It's stateless and works well for traditional web applications
- WebSockets, however, provide full-duplex communication, both client and server can initiate communication at any time 
- I used WebSockets for our chat functionality because we needed real-time bidirectional communication
- When on user sends a message, all other users need to receive it instantly without refreshing the page.
- HTTP would require constant polling, which is inefficient
- Socket.io was perfect because it provides WebSocket functionality with fallbacks for older browsers and additional features like rooms and namespaces


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

