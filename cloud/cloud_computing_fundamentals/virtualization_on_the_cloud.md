# Virtualization On The Cloud

## MODULE 1: Virtualization
###### - Virtualization is the process of creating a virtual representation of a physical resource, such as a server, a storage device, or a network
###### - Virtualization in a cloud environment offers a lot of benefits to users.

###### - It enables multiple virtual computers to run on the same physical host computer, each with its own operating system (OS) and applications.

###### - It can improve the efficiency, scalability, and flexibility of information technology (IT) resources, as well as reduce costs and environmental impact

###### - It enables cloud customers to access services over the internet, without having to manage or maintain the underlying physical infrastructure.

###### - It also enables cloud customers to scale up or down their resources on demand, depending on their needs and requirements.

###### - Cloud providers offer three key types of virtualization: Virtual machines, Virtual storage, Virtual networks

### Virtual Machines

#### What is a virtual machine?
###### - The situation changed with the development of virtual machines
###### - A virtual machine (VM) is a software-based emulation of a physical computer that can run different operating systems and applications. Virtual machines:

###### ==> Run on a physical computer and each physical computer can run, or host, multiple VMs.

###### ==> Have their own virtual hardware, such as a CPU, memory, disk, and network devices, that are isolated from the host system and other VMs.

###### - Users can easily create, copy, move, or delete a VM without affecting the physical hardware. 
###### - By using VMs, companies can start their dedicated VM to run the nightly process and then when the process ends, shut the VM down until the next evening
###### - This releases resources for another VM to use during the day

##### Testing and development
###### ==> VMs allow developers and testers to create multiple software and hardware environments. They can use different operating systems and software configurations without using multiple physical machines
###### ==> They can use VMs to simulate different network conditions and user behaviors.
###### ==> And they can also use them to develop software that needs access to low-level resources or devices. Low-level resources and devices are the computer’s basic components.

##### Server consolidation
###### ==> VMs enable multiple servers to run on a single physical machine. This reduces hardware costs, power consumption, and space requirements
###### ==> They can also improve server utilization and performance by dynamically allocating resources according to the workload demand

##### Disaster recovery and backup
###### ==> Engineers can replicate VMs and migrate them across different locations. This provides high availability and fault tolerance
###### ==> They can also easily back them up and restore them, ensuring data protection and recovery

##### Security and isolation
###### ==> VMs provide a layer of abstraction between the guest operating system and the host system. This prevents malware or malicious users from accessing or compromising the host system or other VMs.
###### ==> Engineers also use VMs to create sandboxed environments for running risky applications. 
###### ==> A sandboxed environment is an isolated VM that can run code from unknown or untrusted sources without impacting other applications or computers

#### How do virtual machines work?
###### - using virtual machines, multiple operating systems can share the same physical resources, such as CPU, memory, and storage, while maintaining isolation and independence
###### - Users can install their own operating systems, applications, and software configurations to suit their specific requirements

### Virtual storage
###### - Computers work by processing digital data. Whether that data is in the form of a spreadsheet or a streaming movie, the main function of a computer is to store, send and retrieve, and process large amounts of 1s and 0s.
###### - Individuals and companies transmit data around the internet every day. But when it’s not in use, it needs to be stored somewhere.

###### ==> In traditional computing, users would store data on a disk drive that was a part of their personal or work computer.

###### ==> But today, storage is virtual. This virtual storage refers to the pooling of physical storage from multiple networked devices into what appears to the user as a single storage device.

###### - Users can manage their virtual storage from a central console. Dropbox, Box, and Google Drive are examples of virtual storage that businesses and consumers commonly use

###### - virtual storage is a way to store data from a device and retrieve it back over a network or the internet
###### - Virtual storage enables devices connected to the network to store and access large amounts of data virtually, without needing large amounts of storage space on the device itself
###### - Cloud providers use virtual storage to store their user’s data across different storage devices on the cloud

#### How does virtual storage work?
###### - Virtual storage uses remote servers to store data, such as files, business information, videos, and images

##### Upload data
###### ==> Users upload data to servers via an internet connection. The server saves the data on a virtual machine running on a physical server.

##### Manage data
###### ==> To maintain availability and provide redundancy, cloud providers will often spread data across multiple virtual machines in data centers located across a region or across the world.

###### ==> Storing data in multiple locations has no impact on the users other than improving the availability of their data

##### Increase storage space
###### ==> If the user needs more storage space, the cloud provider can start more virtual machines to handle the load.

##### Access data
###### ==> Users access data in cloud storage through an internet connection. The software they use to do this might be a web portal, a browser, or a mobile app.

###### - Virtual storage enables organizations to store, access, and maintain data so that they don’t need to own and operate their own data centers.

###### - Virtual storage is scalable, allowing organizations to expand or reduce their data footprint depending on need

#### Virtual storage on the cloud
###### - With the ability to store data on remote servers and access it from anywhere with an internet connection, cloud storage has become an essential tool for businesses and individuals alike
###### - There are four main models of cloud storage available: public, private, hybrid, and multi-cloud
###### - Each model offers its own unique set of benefits and is designed to meet the specific needs of different users

##### Public cloud storage
###### ==> In the public cloud storage model, an organization stores data in a service provider’s data centers. Other businesses will also utilize these data centers.
###### ==> Data in public cloud storage is spread across multiple regions. Cloud providers offer it on a subscription or pay-as-you-go basis.
###### ==> Public cloud storage is elastic. This means that users can scale their data storage up or down depending on the needs of the business.
###### ==> Public cloud providers typically make data available from any device such as a smartphone or web portal

##### Private cloud storage
###### ==> In the private cloud storage model, an organization uses its own servers and data centers to store data within their own network.
###### ==> Alternatively, businesses can use dedicated servers and private connections from cloud service providers. These servers and connections are not shared by any other business.
###### ==> Businesses that require more control over their data and have stringent compliance and security requirements typically use private cloud storage

##### Hybrid cloud storage
###### ==> The hybrid cloud storage model is a mix of private and public cloud storage models.
###### ==> A hybrid cloud storage model allows businesses to decide which data it wants to store in which cloud
###### ==> They might store sensitive data and data that must meet strict compliance requirements in a private cloud. 
###### ==> And store less sensitive data in the public cloud.

##### Multi-cloud storage
###### ==> In the multi-cloud storage model, an organization uses multiple public cloud providers to store different types of data.
###### ==> Multi-cloud storage can help businesses avoid vendor lock-in, optimize costs, improve performance, and enhance security.

### Virtual networks
###### - A virtual network is a network that uses software instead of physical hardware
###### - It behaves and operates like a regular network, but it exists only in the digital world, not in the physical world. Virtual networks:

###### - Use virtualization technology, which allows engineers to create a network using software-based network components.

###### - Can simulate all the functionality of a physical network, including routing, switching, firewalling, and load balancing

#### How do virtual networks work?
###### - Virtual networks use virtual routers, virtual switches, and virtual firewalls in the same way that physical networks use physical components
###### - They exist in a layer between physical network components and the workloads that use them

##### Hardware layer
###### ==> The hardware layer contains physical network components like routers and servers. These provide the foundation for the virtual network.

##### Network virtualization layer
###### ==> The network virtualization layer is a software component that creates and manages virtual networks on top of physical infrastructure
###### ==> It allows multiple virtual networks to coexist and operate independently from each other, while sharing the same physical resources

##### Virtual network layer
###### ==> The virtual network layer contains virtual routers, switches, firewalls, and other devices that provide the network services and connectivity needed by virtual machines and other network resources. This layer includes additional network services like DHCP and DNS.

##### Application and services layer
###### ==> At the top layer, there are the applications and services, or workloads, that rely on the underlying virtual network infrastructure and services to provide network connectivity. 

![Image](https://github.com/user-attachments/assets/fdabd6ea-ef15-47f6-beb8-3bd28c024d8f)

###### - Users commonly use virtual networks for various purposes, including:

###### - Isolating and securing different segments of a network, such as development, testing, and production environments.

###### - Connecting different physical locations or cloud services over the internet, using encryption and tunneling protocols.

###### - Enhancing the performance and availability of network services, by distributing the workload across multiple servers or regions.

###### - Experimenting with new network configurations or technologies, without affecting the existing infrastructure or requiring additional hardware.


## MODULE 2: Containerization

### Containers
###### - Containerization is a lightweight form of virtualization that enables applications to run in isolated environments on a single host operating system
###### - Containers are portable, easy to manage, and offer fast startup times.
###### - By using containers in cloud environments, cloud developers don’t have the cost and management associated with a full physical computer or even a virtual machine
###### - This means they can make their applications and services run faster and require less resources

#### What is a container?

##### Lightweight and portable
###### ==> Containers use a shared operating system and only contain the application code and dependencies
###### ==> Computers have their own operating system and hardware resources

##### Isolated and secure
###### ==> Containers run in a sandboxed environment, which limits their access to other containers and the host system
###### ==> This reduces the risk of code running in a container impacting other applications or the operating system itself
###### ==> By contrast, malware and other security threats can affect computers

##### Scalable and efficient
###### ==> Developers can easily deploy, replicate, and update containers across multiple hosts.
###### ==> Computers require more time and effort to set up, maintain, and upgrade

##### Compatible and interoperable
###### ==> Containers can run on any platform that supports the container software technology.
###### ==> By contrast, computers might have compatibility issues with different hardware or software configurations

### Containers adn virtualization
###### - Containerization and virtualization are two methods of creating isolated environments for running software applications
###### - They both aim to improve the efficiency, security, and portability of software development and deployment. However, they differ in significant ways.

###### - Virtualizing computer resources typically means creating one or more virtual machines to provide a resource for performing various tasks.

###### - Containerization means creating containers that run applications and services for performing tasks


###### ==> Virtualization involves creating virtual machines (VMs) that emulate the complete operating system and hardware on a physical server.

###### ==> Containerization involves creating containers that share the same operating system and hardware as the host server.


###### ==> Each VM has its own operating system, applications, libraries, and configuration files.

###### ==> Each container has its own applications, libraries, and configuration files.


###### ==> Multiple VMs can run on the same physical server, each with its own resources and settings.

###### ==> Each container is a lightweight and self-contained package of software that can run anywhere that supports the same operating system


###### ==> Virtualization enables users to run different operating systems, such as Windows and Linux, on the same physical hardware at the same time. It also enables users to isolate different applications from each other and the host.

###### ==> Containerization enables users to run multiple applications on the same server, each with its own dependencies and environment variables, and to isolate applications from each other


###### - The main difference between virtualization and containerization is what parts of the underlying computing environment each uses:

###### - Virtualization uses the hardware of the host computer, but has its own operating system and software. Developers call this hardware abstraction level.

###### - Containerization uses the hardware and operating system of the host computer, but has its own software. Developers call this operating system abstraction level.

###### - In cloud computing when developers abstract a layer it means that they’re creating a layer of separation between the container or virtual machine and the hardware or operating system that the container or virtual machine runs on
###### - Abstraction makes complex systems easier by focusing on the essential features and ignoring the irrelevant ones
###### - When you use your smartphone, you don’t need to know how the hardware or the software works internally, you just use the apps that provide a simple and consistent interface
###### - Containers work in a similar way; they provide a simple and consistent interface for the code to run on any operating system or hardware. In other words, they abstract the operating system.

###### - These abstraction levels determine some of the behavior and characteristics of VMs and containers.

###### - Because containers do not need to start an independent operating system, they are more efficient than VMs in terms of resource utilization, startup time, and performance.

###### - Because they share the same operating system with the host computer and each other, they are less secure than VMs.

###### - And because containers can only run on hosts that use the same operating system as themselves, they are less compatible with host software than VMs which have their own operating system


### Examples of container tools
###### - There are many container applications in use today. Some are proprietary and others are open source. Three widely-used container applications to be familiar with are:

###### - Docker, which is the most popular tool for creating and running containers

###### - Kubernetes, which is a system for orchestrating multiple containers across different machines or clouds. Orchestration is a way to manage and automate tasks across multiple cloud platforms.

###### - Podman, which is a newer alternative to Docker for creating and running containers that offers some advantages in security and simplicity

##### Docker
###### ==> Docker is a tool for creating and managing containers using a client-server architecture.
###### ==> It has a background process called the Docker daemon that handles container operations and exposes an API for communication with other tools and services.
###### ==> Users can interact with the daemon using the Docker command-line interface or graphical user interface tools.
###### ==> Docker also supports Docker Swarm, a native orchestration tool for managing multiple Docker hosts and containers

##### Kubernetes
###### ==> Kubernetes is a tool that helps users to manage groups of servers and containers.
###### ==> It automates tasks like deploying and scaling containers and makes sure they are balanced and healthy.
###### ==> Kubernetes uses pods, which are groups of containers that share resources.
###### ==> Users can interact with Kubernetes using command-line or graphical tools

##### Podman
###### ==> Podman is a tool that can manage and run containers without needing an additional program to do so. 
###### ==> It is based on a model used by Kubernetes, which allows it to run multiple containers together
###### ==> Users can interact with Podman using a command-line tool or graphical tools.

###### - While all three container tools do many of the same things, there are differences that impact how users use them in terms of security, architecture, and functionality.

##### Security
###### ==> Docker needs access to the core of the host operating system or root privileges to run its background process, which can be a security risk.
###### ==> Podman and Kubernetes, on the other hand, run as nonprivileged users by default and don’t need a background process. This makes them more secure and less vulnerable to attacks.
###### ==> Kubernetes also uses role-based access control to enforce security policies.

##### Architecture
###### ==> Docker bundles all its container features into a single tool.
###### ==> Kubernetes separates its container features into different components.
###### ==> Podman uses existing Linux features to run containers without needing a background process. This makes the Podman architecture more lightweight than the others

##### Functionality
###### ==> Docker is mainly for managing containers, but can also do basic orchestration with Docker Swarm.
###### ==> Kubernetes is mainly for orchestrating containers, but users can also do basic container management with its command-line tool kubectl.
###### ==> Podman is mainly for running containers, but can also do basic pod management using the podman command from the command line

###### - Docker, Kubernetes, and Podman are different tools for different purposes. To summarize:

###### - Docker is suitable for developers who need a simple and comprehensive tool to create and run containers locally or on a single host.

###### - Kubernetes is suitable for operators who need a powerful and scalable tool to manage clusters of servers and containers across different environments.

###### - Podman is suitable for anyone who needs a secure and lightweight tool to run containers individually or in pods without a daemon


### Benefits of using containers in the cloud
###### - Developers use containers in the cloud because they offer many advantages over traditional methods of software development and delivery.

###### - Containers enable faster innovation, lower costs, and higher quality.
###### - Containers are compatible with the principles of DevOps.
###### - DevOps is a culture and practice of collaboration between developers and operations teams. 
###### - DevOps aims to deliver software products faster and more reliably than traditional development methods by using automation, continuous integration, and continuous delivery.
###### - Containers make it easier to test, deploy, and update applications in the cloud.


###### - There are three key benefits of using container applications.

###### ==> They can run on any cloud platform that supports them, without requiring changes to the application code. This means that developers can focus on creating and updating their applications, without worrying about the underlying infrastructure or compatibility issues.

###### ==> Because users can create and destroy containers in seconds, containers also facilitate faster deployment and easier updates.

###### ==> Developers can group them together into clusters. Clusters are collections of containers that work together to provide a service or function. For example, a cluster of containers can run a web server, a database, and a load balancer. Developers can use tools such as Kubernetes to manage their clusters.

## MODULE 3: Microservices

### Software goes modular

###### ==> Functions that perform a specific task are also called services and a typical software application consists of several services bundled together

#### Breaking software into peices
###### ==> As building software developed, engineers began packaging services that many applications could use into libraries
###### ==> A library is a collection of software functions that do certain things. For example, all the applications in an office suite might share services like file management, spell and grammar checker, font management, and some layout features
###### ==> Engineers package services like these in a library that all the applications would share.

###### ==> Each application makes a call to the library to run the code for the service they need and get back a result or some data.

###### ==> Bundling standard chunks of code, or services, into a library enables many applications to share the same code
###### ==> This reduces the amount of code that applications need to contain and that computers need to store
###### ==> It also helps users become familiar with standard functionality

#### Modular software and the cloud
###### ==> The idea of dividing software up into independent services is applied to cloud software in the form of microservices

###### ==> Microservices are a way of designing cloud-based applications to consist of many small, independent, and loosely coupled services
###### ==> Loosely coupled means that the services are connected to each other and each service performs a specific function by communicating with other services. Microservices communicate using application programming interfaces (APIs)
###### ==> An API defines how a microservice can communicate with other microservices or applications. It specifies:

###### ==> The functionality that the microservice offers

###### ==> The information the microservice needs to perform each piece of functionality and the format that the information should be supplied in

###### ==> The format that the microservice will use to pass any information to the other microservice

###### - Microservices offer benefits to developers.
###### ==> They enable faster development, easier deployment, and more flexible scaling of cloud applications

###### ==> They allow developers to use different technologies and languages for different services, depending on their needs and preferences.

###### ==> They help deliver agile and resilient software for the cloud


### Using containers to deploy microservices

###### - One of the challenges of developing and maintaining microservices is ensuring that they can run reliably and consistently across different environments
###### - Developers can use containers to deploy microservices in a consistent and reliable way.

###### - By using containers to deploy microservices, developers can avoid the problems of incompatible software versions, conflicting dependencies, and varying operating systems that can cause errors and inconsistencies

##### Step 1: Write the code
###### ==> First, the developer writes the code for the microservice using the programming language and framework of their choice

##### Step 2: Create the container image
###### ==> The developer uses a tool like Docker to create a container image for a microservice
###### ==> A container image is like a recipe that tells the computer how to build and run the container
###### ==> The developer includes information such as the base image, the code files, and the commands to execute when the container starts. This makes it easy to create and run containers consistently

##### Step 3: Test the container image
###### ==> The developer tests the container image locally using a tool such as Docker Compose
###### ==> This tool allows the developer to run multiple containers together and simulate how they interact with each other and with external services
###### ==> The developer checks whether the microservice works as expected and meets the functional and non-functional requirements

##### Step 4: Publish the container
###### ==> The developer pushes the container image to a registry, such as Docker Hub or Azure Container Registry
###### ==> A registry is a centralized repository that stores and distributes container images
###### ==> The developer can tag the image with a version number or a descriptive name to identify it easily

##### Step 5: Deploy the container
###### ==> The developer sends the container image to a target environment like a cloud platform or an on-premises server using a tool like Kubernetes or Docker Swarm
###### ==> These tools help manage containers across multiple machines. They also provide features like load balancing, health monitoring, and scaling
###### ==> The developer can set up the deployment using files that specify how many copies of the container to run and what resources to allocate

### How microservices communicate
###### - An application programming interface (API) is a set of definitions and protocols that enable two software components to communicate with each other
###### - For example, here’s an illustration that shows how a weather app on someone’s phone can use an API to request weather data from a server that hosts a weather database. The server responds with the data in a defined format, such as JSON or XML.
![Image](https://github.com/user-attachments/assets/ff855ddc-eb31-4e61-a8aa-74576af45c07)

###### - APIs are like contracts that define how microservices can exchange information and request services from each other
###### - They specify what sort of data can be sent and received, how to format the data, and what rules and protocols to follow
###### - APIs enable microservices to work together as a cohesive system, while maintaining their autonomy and scalability

###### ==> Modularity: Developers can develop, test, deploy, and update each microservice independently, without affecting other microservices.

###### ==> Reusability: Different applications and systems can reuse each microservice.

###### ==> Scalability: Developers can scale each microservice up or down according to the demand and load, without impacting other microservices.

###### ==> Reliability: Each microservice can handle errors and failures gracefully, without causing the whole system to crash.

###### ==> Flexibility: Each microservice can use different technologies and frameworks that suit its needs, without being constrained by the choices of other microservice developers

## MODULE 4: APIs

### Data in, data out

###### - Application programming interfaces (APIs) have been a part of computer programming since the earliest days of computer science
###### - In their simplest form, an API is a means by which computer programs and services can send data and receive data from each other
###### - More precisely, an API is a set of rules and instructions that allow different software applications to communicate and exchange data with each other.
###### - You can think of an API as a translator or a messenger that helps two parties understand each other and get what they want.

#### Call me
###### - When one application requests data from an API, the application is making a call to the API
###### - When the other application responds with data, the API is sending a response.
###### - Applications can make different types of calls to APIs.

###### ==> The API for the software on the server defines how the client should interact with the server application and in what format the server can send or receive data
###### ==> The client can verify the structure of the API before it sends a request by using special documents
###### ==> The client application structures the call to the server API so it can send or receive data properly and securely.
###### ==> When the server application gets the request from the client, it looks at the call and constructs a response according to the structure of the call.
###### ==> The server sends the response back to the client with a status message and any requested data


### APIs in cloud computing
###### - APIs play a vital role in cloud computing.
###### - They enable the development, integration, and management of cloud-based applications and services
###### - APIs allow developers to access and use the functionality and resources provided by cloud service providers, such as Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform.
###### - APIs also allow users to connect multiple cloud services or platforms, or to connect cloud and on-premises applications
###### - There are three key types of APIs that developers can use in cloud computing, each providing different levels and types of functionality and resources

##### Service APIs
###### ==> Service APIs provide access to specific cloud services, such as storage, messaging, and analytics.
###### ==> For example, the AWS S3 API allows users to store and retrieve objects in the AWS S3 cloud storage service.

##### Application APIs
###### ==> Application APIs provide access to specific cloud applications, such as email, calendar, and social media.
###### ==> For example, the Gmail API allows users to send and receive emails using the Gmail cloud application

##### Infrastructure APIs
###### ==> Infrastructure APIs provide access to low-level cloud infrastructure components, such as virtual machines, containers, and networks.
###### ==> For example, the AWS EC2 API allows users to launch and manage virtual servers in the AWS EC2 cloud computing service

***APIs are essential for cloud computing. They enable communication and data transfer between different software applications and services in the cloud or between the cloud and on-premises servers. APIs also facilitate the development, integration, and management of cloud-based solutions.***

### Automating cloud tasks using APIs
###### - By using APIs, a developer can write scripts or programs to interact with cloud services and perform tasks automatically, without requiring any human intervention
###### - APIs enable developers to automate cloud tasks in a faster, easier, and more efficient way
###### - This is because they can use existing code libraries and frameworks that support various API standards and formats


## MODULE 5: Use cases and best practices

### Using containers, microservices, and APIs to migrate legacy apps to the cloud
###### - Many companies have old computer programs that are difficult to update and keep running
###### - These programs often use outdated technology and are built in ways that make them hard to change
###### - To make these programs work better and take advantage of new technology like cloud computing, companies can use tools like containers, microservices, and APIs.

###### - Containers help separate the program from the computer it runs on and include all the resources and configuration settings that software needs to run independently.
###### - Microservices divide programs into small parts that can work together.
###### - And APIs help these parts talk to each other and to other programs.

###### - By using these tools, companies can migrate, or move, their old programs to the cloud to make them easier to manage and improve how they work

#### Containers, microservices, and APIs in practice
###### - The thought of moving from existing apps to the cloud can be daunting. Disrupting a running business, even for a short time, can have a negative impact
###### - However, using containers, microservices, and APIs to modernize a business’s applications can far outweigh the short-term impact the disruption might cause

###### - By migrating its traditional applications to the cloud with containers, microservices, and APIs, ABC Inc. achieves several benefits.

###### ==> They reduce the complexity and cost of maintaining and updating their applications by breaking them down into smaller and simpler units that they can independently develop, deploy, and manage

###### ==> They increase the efficiency and scalability of their applications by leveraging the elasticity and automation of the cloud platform and the lightweight nature of the containers.

###### ==> They improve the security and reliability of their applications by applying best practices to their code and infrastructure


### Using containers, microservices, and APIs to build scalable applications
###### - Combining containers, microservices, and APIs provides fulfillment, modularity, and availability

##### Fufillment
###### ==> Containers provide a lightweight and portable way to package and deploy applications, making it easy to scale applications up or down based on demand
###### ==> This allows companies to quickly respond to changing business needs and user demands, while also ensuring efficient use of resources

##### Modularity
###### ==> Microservices divide an application into smaller, independent components that developers can create, deploy, and scale independently
###### ==> This allows companies to scale specific parts of their application as needed, rather than having to scale the entire application
###### ==> This can result in more efficient resource usage and faster response times

##### Availability
###### ==> Using a container orchestration platform like Kubernetes can enhance scalability
###### ==> Kubernetes provides powerful tools for managing and scaling containerized applications, allowing developers to easily scale their applications up or down based on demand
###### ==> It also provides features like automatic failover and rolling updates, which help ensure that applications are always available and up-to-date

***By using containers, microservices, and APIs, developers can create scalable applications that can handle high demand and complexity with greater efficiency, agility, and reliability.***


### Best practices when using containers and 

##### Design each microservice to be loosely coupled and highly cohesive
###### ==> This means that each microservice should have a clear and single responsibility, and should minimize its dependencies on other services
###### ==> This way, businesses can develop, test, deploy, and update each microservice independently, without affecting the rest of the system.

##### Use a consistent and standarized approach to communicate between microservices
###### ==> Businesses can do this by using common protocols, formats, and patterns for inter-service communication, such as RESTful APIs, JSON, and message queues
###### ==> This can help to ensure interoperability, reliability, and security of the communication.

##### Implement proper logging, monitoring, and tracing mechanisms for each microservice and the whole system
###### ==> This can help to detect and troubleshoot errors, performance issues, and anomalies in the system
###### ==> It can also provide useful insights into the behavior and health of the system.

##### Use a container orchestration tool to automate and manage the deployment, scaling, networking, and configuration of the containers
###### ==> This can help to simplify the complexity of managing many containers across different environments
###### ==> Some of the popular container orchestration tools are Kubernetes, Docker Swarm, and Amazon ECS

##### Apply security best practices at every level of the system
###### ==> This includes securing the communication between microservices using encryption and authentication
###### ==> It also includes securing the containers using techniques such as scanning for vulnerabilities, limiting privileges, and enforcing policies


## MODULE 6: You're a cloud engineer!

### Your new cloud engineer role
#### The Assignment
###### - Your first task is to assist a senior cloud deployment engineer to create a Docker container and install an existing web app to the container.

##### Your role
###### ==> Your entry-level role is to provide general support for other cloud engineers to build your global copany resources on the cloud

##### Your customers
###### ==> Your department focuses on creating and delivering internal company software and services using the cloud

##### Your area
###### ==> You work alongside deployment and database experts to assist them in their work

#### The skills to apply

##### Technical skills
###### ==> Read and write code at a fundamental level to create basic Docker instructions.
###### ==> Run instructions from a command-line interface (CLI).

##### Testing skills
###### ==> Ensure the container is built properly by viewing the container in a desktop tool.
###### ==> Run the container to ensure it loads properly.
###### ==> View the application in the browser that is running in the container.


### Your first project

#### Purpose of the project
###### - The software development team in your company developed a small web application to help employees manage their tasks
###### - Your team will deploy this application to locations all over the world to improve how well people organize and manage their work time

#### Your scope of work
###### - The development of the web application is complete. Your team is ready to create a container for it
###### - The senior cloud engineer decides to install the app into a Docker container to make deployment and maintenance easier
###### - They’ve asked you to help on the project by assisting them to create the container and install the app image into it


###### - During the build process, the container includes all the files it needs to run a Node.js web server
###### - The container also includes three application files: script.js, style.css, and index.html.
###### - Once you create the image and place it in the container, you’ll start the container and Docker will launch the Node.js web server which will serve the web application


### Simulation: Create a Docker container and install an app
###### - Clara, the senior engineer, already has installed Docker, VS Code, and Node.js on her laptop
###### - She has created a folder and copied the three app files into it. In this simulation, you will follow the steps to create a Docker container, install an app into that container, and test the running app.

##### Step 1
###### ==> first you have to create a file called package.json
###### ==> this file holds the information that Docker uses to create and run the web server

```json
// package.json
{
  "name": "todo-app",
  "version": "1.0.0",
  "description": "A workplace to do app",
  "author": "Firs Last <first.last@example.com>",
  "main": "server.is",
}
```

##### Step 2
###### ==> add the rest of the code for the package.json

```json
  "name": "todo-app",
  "version": "1.0.0",
  "description": "A workplace to do app",
  "author": "Firs Last <first.last@example.com>",
  "main": "server.is",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.16.1"
  }
```

##### Step 3
###### ==> create a server.js file
###### ==> this is a script that Node.js uses to provide instructions for how the web server will operate
###### ==> complete the file by writing code to open communication between the browser and the web server using the settings, starting from line 18

```js
// server.js
"use strict";

const express = require('express');
const path = require('path');
const publicDirPath = path.join(__dirname, '../app');

// constants
const PORT = 8080;
const HOST = '0.0.0.0';

// app
const app = express();
app.use(express.static(publicDirPath));
app.get('/', (req, res) => {
  res.sendFile("index.html");
})

app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});
```

##### Step 4
###### ==> the final file you'll need to create is the Dockerfile and write the instructions
###### ==> this is the specific file used by Docker that tells it which software and dependencies to use in the container
###### ==> Notice the commands include the RUN command to install npm into the image and the COPY command to copy all the files
###### ==> finally, the CMD command runs the node.js file you previously wrote which tells Docker to start the web server

```dockerfile
# Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ..
EXPOSE 8080
CMD ["node", "server.js"]
```

##### Step 5
###### ==> create a file to tell Docker to ignore all the existing Node.js files in the laptop's folder because the instructions you wrote tell Dcoker to install them
###### ==> without this file, the Docker image might include unnecessary files in the image increasing its size

```dockerfile
# .dockerignore
node_modules
npm-debug.log
```

##### Step 6
###### ==> now you're ready to build the container, through the command line
###### ==> use Docker's "build" command to install the todo app and build the container

```bash
> docker build . -t todo-app
[+] Building 1.3s (10/10) FINISHED
> 
```

##### Step 7
###### ==> now you have to launch the container and laod the image which contains the web app

```bash
> docker run -p 8080 -d todo-app
```

##### Step 8
###### ==> to verify the app is running, open the Docker app and it shows the running container with the to-do app image loaded
###### ==> nwo you can browse to the website that is running inside the container using Node.js to deliver the web pages
###### ==> since its a web app you can test the application using a browser
###### ==> the Docker app provides a link you can use to browse to the site
###### ==> when you select the link, the to-do app opens in the browser, select the highlighted active port number for the running container that has the web app running inside it

##### Step 9
###### ==> notice that the Node.js application launches when you run the image through the Docker engine
###### ==> this means you correctly packaged the Docker image and the container is ready to be deployed to the cloud so employees all over the world can use it


## Key Points
##### 1
###### - Virtualization is the process of creating a virtual representation of a physical resource.

##### 2
###### - A virtual machine (VM) is a software-based emulation of a physical computer that can run different operating systems and applications. They can:
###### - Reduce hardware costs, power consumption, and space requirements.
###### - Improve server utilization and performance.
###### - Provide high availability and fault tolerance.
###### - Enhance system security.

##### 3
###### - Virtual storage is the pooling of physical storage from multiple networked devices into what appears to the user as a single storage device. It can:
###### - Reduce the storage needed on internet-connected devices.
###### - Enable data access from anywhere.
###### - Allow users to scale their storage up or down depending on their needs.

##### 4
###### - A virtual network is a network built from virtual components instead of physical hardware. It can:
###### - Enable users to created isolated environments for development and testing.
###### - Connect different physical locations or cloud services together.
###### - Enhance the performance or availability of network services.

##### 5
###### - Containers are a lightweight form of virtualization that enables applications to run in isolated environments that share the same operating system and hardware as the host server.

##### 6
###### - Containers are easy to deploy, replicate, and update across multiple host computers.

##### 7
###### - Using a container orchestration tool to automate and manage the deployment, scaling, networking, and configuration of the containers can simplify the complexity of managing containers across different environments.

##### 8
###### - Microservices are a way of designing cloud-based applications to consist of many small, independent, and loosely coupled services
###### - They enable faster development, easier deployment, and more flexible scaling of cloud applications
###### - They are more scalable and resilient than traditional applications.

##### 9
###### - Microservices can use any programming language or technology and they communicate by using APIs.

##### 10
###### - Developers use containers to simplify the deployment and maintenance of microservices.

##### 11
###### - An API is a set of rules and instructions that allow different software applications to communicate and exchange data with each other. They allow developers to:
###### - Access and use the functionality and resources provided by cloud service providers.
###### - Automate cloud tasks in a faster, easier, and more efficient way.

##### 12
###### - Containers, microservices, and APIs work well together to migrate legacy apps to the cloud and to build scalable applications.