# 1 - Stakeholders and Tasks

## Stakeholders
Stakeholders are people and groups of people involved in, or affected by, or that affect, project activities. 

- **Project Manager**: Oversees the project, manages timelines, and coordinates between teams.
- **Developers**: Write and maintain the codebase, implement features, and fix bugs.
- **Designers**: Create the visual elements and user experience of the software.
- **Quality Assurance (QA) Testers**: Test the software to ensure it meets requirements and is free of bugs.
- **End Users**: The individuals who will ultimately use the software.
- **Clients**: The organization or individuals who commission the software development.
- **Business Analysts**: Gather requirements and ensure the software meets business needs.
- **DevOps Engineers**: Manage the deployment, scaling, and monitoring of the software.
- **Support Team**: Provide assistance to end users and handle any issues that arise post-deployment.
- **Suppliers/Vendors**: Provide third-party services or products that integrate with the software.
- **Oponents**: Competing entities that may influence market dynamics and user expectations.

## System vs. Application Software
- **System Software**: This includes operating systems, utilities, and other software that manage hardware and provide a platform for application software. Examples include Windows, Linux, and macOS.

- **Application Software**: This is software designed to help users perform specific tasks. Examples include word processors, web browsers, and games.

- **Utilities**: Things that fall between the two, e.g., Web browser, SSH, office suite, etc.

## Architectural Design
Architectural design refers to the high-level structure of a software system, including its components, their interactions, and the principles guiding its design and evolution.

- describes critical aspects of the thing
- is understandable to all (or, at least, most) stakeholders
- allows evaluation of the thing's properties before it is built
- provides well understood tools and techniques for constructing the thing from its blueprint

## Database Design
Database design is the process of creating a detailed data model of a database. This includes defining tables, fields, relationships, and constraints to ensure data integrity and efficiency.

1. Relational (SQL-based) for cases where you need the speend AND your data model does not change much (think banks, insurance)
2. Non-relational (NoSQL-based) for cases where you need to handle large volumes of unstructured data or when the data model is expected to evolve frequently (think social media, big data applications)


- **Conceptual Design**: High-level design focusing on the overall structure and relationships.
- **Logical Design**: Detailed design that includes specific tables, fields, and relationships.
- **Physical Design**: Implementation details, including indexing, partitioning, and storage considerations.
- **Normalization**: Process of organizing data to reduce redundancy and improve integrity.
- **ER Diagrams**: Visual representation of entities and their relationships.
- **Schema Definition**: The blueprint of how the database is structured.
- **Data Integrity**: Ensuring accuracy and consistency of data over its lifecycle.
- **Performance Optimization**: Techniques to improve query performance and data retrieval times.
- **Backup and Recovery**: Strategies to protect data and restore it in case of loss or corruption.
- **Security**: Measures to protect data from unauthorized access and breaches.
- **Scalability**: Designing the database to handle growth in data volume and user load.
- **Compliance**: Ensuring the database design adheres to relevant regulations and standards.
- **Documentation**: Keeping detailed records of the database design for future reference and maintenance.
- **Collaboration**: Working with stakeholders to ensure the database meets business needs and requirements.
- **Tools**: Utilizing database management systems (DBMS) and design tools to facilitate the design process.
- **Testing**: Validating the database design through testing to ensure it meets performance and integrity requirements.
- **Maintenance**: Ongoing management and updates to the database design as requirements evolve.
- **Data Modeling**: Creating abstract representations of the data structures and relationships.
- **Data Types**: Defining the types of data that can be stored in each field
- **Indexes**: Creating indexes to improve data retrieval speed.
- **Relationships**: Defining how tables relate to each other (one-to-one, one-to-many, many-to-many).
- **Constraints**: Setting rules to enforce data integrity (e.g., primary keys, foreign keys, unique constraints).

## Production (aka Deployment)
Deployment is the process of making a software application available for use.

Once you've finished system integration and testing, time has come to impose the new system onto unsuspecting users: 
- install it, in some or all locations
- migrate the data (the users want data, not fancy terminals or software)
- train the users
- observe the users and the system in order to detect problems and fix them as soon as possible

## Programming
Programming is the process of designing, writing, testing, and maintaining the source code of software applications.
- goal is to implement the design in best possible manner using the chosen technologies and tools
- coding affects testing and maintenance - as testing and maintenance costs are high, aim of coding activity should be to write code that reduces these costs

## Project Management
Project management involves planning, organizing, and managing resources to achieve specific goals within a defined timeline.

## Requirements Engineering
Requirements engineering is the process of defining, documenting, and maintaining the requirements for a software system.
- aims to create a complete, consistent (i.e., unambiguious), verifiable, and as formal as possible expression of user requirements
- requirements document enables shared understanding between different stakeholders such as customers, users (operators), developers, development mangers, etc. 

## Verification (Testing)
Verification (or testing) is the process of evaluating a software application to ensure it meets the specified requirements and is free of defects. The software should conform to its specification, and we try to show that
- the construction process went according to the rulebook
- the final product implements the blueprint, only the blueprint, and nothing but the blueprint

