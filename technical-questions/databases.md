# Database Questions

## General Database Questions 

Can you describe your experience with different database management systems and which one you prefer to work with? Why?
Exp. With DBMS
I have experience working with  PostgreSQL, MongoDB, Firebase database, and Supabase.
I prefer using PostgreSQL because of its features that support JSON data types and robust indexing options
With postgreSQL being said, I love Supabase which is just a wrapper for PostgreSQL

Explain the concept of normalization and denormalization. When would you choose one over the other?
Normal vs Denormal
Normalization is the process of organizing data to reduce redundancy and improve data integrity, which is crucial for transactional systems
Denormalization, involves combining tables to optimize read performance, often used in data warehousing where query speed is prioritized.

What strategies do you use for optimizing database performance?
Optimizing DB perf.
I regularly analyze query execution plans to identify bottlenecks and optimize them
I implement indexing strategies and monitor performance metrics to ensure the database runs efficiently

Can you explain the differences between relational and non-relational databases? When would you use each type?
Relational vs Non-relational
Relational databases use structured schema with tables and relationships, making them ideal for systems that involve data integrity like transactional systems.
Relational databases include PostgreSQL and MySQL
Non-relational databases offer flexibility for handling unstructured data, making them suitable for big data applications and real-time analytics
Non-relational databases include MongoDB and I believe Firebase database.


Can you explain MongoDB?
Explain MongoDB
MongoDB is a non-relational database where all data is stored in JSON like documents
Documents are groups of field-value pairs to represent an object
Which are organized into collections, which are groups of documents, that can be queried, each collection is like a single row in a relational database

What is sharding in MongoDB?
Sharding in MongoDB
Sharding enables horizontal scaling in MongoDB
When a single instance can’t manage a large dataset, MongoDB splits the data into chunks and distributes them across multiple servers, which are shards

How do you optimize MongoDB queries?
Optimize MongoDB  queries
Indexes store information about documents, which helps to locate the right data quickly. So, creating indexes can improve query performance.
If you know which columns you need, use projection methods to return only those fields for better performance
Avoid expensive operations like regular expressions; use prefix searches or indexed field instead

Can you explain what Supabase is and how it differs from traditional databases?
What is Supabase
Supabase is an open-source Firebase alternative that provides a suite of tools for building scalable and secure web and mobile applications. 
It combines the power of PostgreSQL with modern development tools to offer real-time databases, authentication, instant APIs, and storage solutions.
Key differences from traditional databases include easy integration with modern frontend frameworks, built in auth and authorization

What security measures does Supabase offer, and how would you implement them in a project?
Supabase security
JWT based authentication, ssl encryption for all data in transit
Encrypted storage for sensitive data
Role-based access control and two-factor authentication options

How would you optimize query performance in a Supabase project?
Optimize Supabase queries
Proper indexing of frequently queried columns
Using appropriate data types for columns
Writing efficient SQL queries
Implementing caching mechanisms
Utilizing Supabase’s real-time features judiciously
Monitoring and analyzing query performance with Supabase’s built-in tools

How would you implement real-time functionality in a Supabase application.
Real-time in Supabase
Implementing real-time functionality in Supabase involves leveraging its real-time features, which includes: 
Setting up realtime channels for specific tables or queries
Using the Supabse client library to subscribe to these channels
Configuring publication and subscription rules in the database
Optimizing the real-time setup to balance performance and data freshness

How would you approach scaling a Supabase applicaiton for high traffic?
Approach to high traffic
Scaling a Supbase application for high traffic involves both frontend and backend optimizations:
Implementing efficient caching strategies
Optmizing database queries and indexes 
Using read replicas for distributing read operations
Implementing connection pooling
Leveraging Supabase’s edge functions for improved global performance
Cconsideirng sharding for extremely large datasets
Implementing rate limiting and request throttling

What are SQL injections?
SQL injections
SQL injections are security vulnerabilities where anyone can try and insert SQL into an input in your application to manipulate database queries
For example, an attacker might insert SQL code in a login form and could do whatever, like searching up a user’s password, or even dropping the whole database

How can you avoid SQL injections?
Avoid SQL injections
You can avoid SQL injections by having input validation, by validating if it is code or is it an actual input.
You can also  have prepared statements that would treat the user input as data values and not code
So if someone tries to enter code as input, it would be treated like a string

What is an SQL query?
What is SQL query
A query is a piece of code written in SQL to access or modify data from a database
There are two main types of queries: select and action queries
Select queries are used to retrieve any necessary data
While action queries are used to create, add, update, delete, basically any action that is done to a database

What is a schema?
What is a schema
Schema is a collection of database structural elements such as tables, functions, and indexes.
It shows the overall database architecture, specifies the relationships between various objects of a database, and defines different access permissions for them

