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