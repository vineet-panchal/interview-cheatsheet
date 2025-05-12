# Introduction To Cloud Computing

### MODULE 1: How Do Computers Communicate? - An Introduction To Computer Networking
###### When you send a text message, have you ever thought about how the words you type travel from your phone to the phone of the person you are texting? You’re able to quickly send text messages, receive emails, and watch online videos because of computer networking. 

##### Computer Networks 
###### ==> Computer Networks are groups of computers that interconnect through infrastructure and rules so they can share data with each other. Networks send, receive, and share data and resources, including text messages.

###### So how do these networks work? Imagine you’re heading to a friend’s house to celebrate their birthday. You might get in your car and travel from your house to their house by driving on a system of roads. 
###### On your way there you stop at intersections, and you might take an on-ramp to get onto a freeway. As you drive, you must follow traffic rules like speed limits and stop signs.

###### ==> Computer networks are like these systems of roadways.

##### Data
###### ==> Data is like the vehicles that travel on the roads. Data is information which is translated into a form that is efficient to move through and be processed on the computer network. It uses the network to travel between different locations just as the vehicles use roadways to travel between different locations.

##### Cables, Fiber Op†ics, and Wireless Signals
###### ==> Like roads connect cities and towns, physical connections such as cables, fiber optics, and wireless signals connect devices on a computer network. These connections are the foundation of the network and enable devices to communicate with each other.
###### Cables, Fiber Optics, and Wireless Signals == Physical connections that connect devices on a computer network

##### Network Adapters
###### ==> Network adapters are similar to tires on a vehicle. They are the interface between the computer and the external network. Every device, like a computer, tablet, or server that connects to a network sends and receives data via a network adapter.
###### Network Adapters == The interface that connects the computer to the external network

##### Routers, Switches, and Hubs
###### ==> You can compare the devices on a computer network, such as routers, switches, and hubs, to the intersections, toll booths, and other infrastructure on a road network. These devices are responsible for directing the flow of data and ensuring that it reaches its destination. A router is like an intersection that directs traffic to different destinations based on the address of the data.
###### Routers, Switches, and Hubs == Devices that direct the flow of data to ensure it reaches its destination

##### Network Protocols
###### ==> Network protocols, such as Transmission Control Protocol/Internet Protocol (TCP/IP), are like traffic rules that govern how devices transmit data over the network. Just as traffic rules ensure that cars travel safely and efficiently on the road, network protocols ensure that devices transmit the data correctly and efficiently between themselves on the network.
###### Network Protocols == Rules that ensure the devices transmit data correctly and efficiently

##### Like a bridge connecting two roadways, a network provides a seamless way to keep data moving between nodes. Like the mainland and the island, nodes are locations on the network. Cloud computing is the difference between using thumb drives or disks and an always-connected network to move data.


### MODULE 1: How Do Computers Communicate? - Moving Data
###### - Collections of zeros and ones make up all computer data, like documents, images, and videos. Computer scientists use the binary system and the terms bits and bytes to measure the number of zeros and ones in a piece of data. 

| Unit | Size | Description and examples |
| ---- | ---- | ------------------------ |
| Bit | 0 or 1 | A bit has a digital value of 0 or 1, which represents a switch position of either off or on. A bit is very small | 
| Byte | 8 bits | A byte contains a small amount of information, such as a letter |
| Kilobyte (KB) | 1024 bytes | A kilobyte is only large enough to store a few lines of text |
| Megabyte (MB) | 1,048,576 bytes | A megabyte can store between 1 and 3 seconds of high-definition video. |
| Gigabyte (GB) | 1,073,741,824 bytes | A gigabyte can hold about 9 minutes of uncompressed video |
| Terabyte (TB) | 1,099,511,627,776 bytes | A terabyte is large enough to hold roughly 500 hours of high-definition video |

###### Beyond terabytes, you can measure data in units of petabytes, exabytes, zettabytes, and yottabytes. A yottabyte is a measurement for computers of the future! One yottabyte holds 1,000 zettabytes or a trillion, trillion bytes.

###### - Computer data moves over networks like vehicles move over roadways. However, transporting a single file of even 1 MB over a network can cause traffic jams and block the network!

##### Step 1: Divide up the train
###### To get the entire train over the bridge, a train engineer decides to divide the train up into smaller trains and send 10 rail cars at a time over the bridge. Each group of 10 cars is a part of a single train, but they’re divided up so they can travel over the bridge.

##### Step 2: Reassemble the train
###### As each group of 10 cars arrives on the island, train engineers reassemble the train to reach its full size of 100 rail cars.

##### Step 3: Move to the next stop
###### Once reassembled, the train moves on to its next destination.

###### - Like dividing up the train to travel across the bridge, network adapters divide files into packets at the source, send them over the network, and then reassemble them in the same order as the original file at the destination.

##### Data Packets
###### ==> Packets are small chunks of data that the network groups together. 
###### ==> Sending smaller packets of data avoids blocking the network with a large file. 
###### ==> Each packet of data that is sent and received is considered independent from the one before it and the one that follows it, in fact, packets can even arrive at a destination out of order.
###### ==> The packets contain metadata that enables the routers on the receiving side to assemble the packets in the right order.

##### Metadata
###### ==> Metadata is information about information
###### ==> Computer networks use the metadata in each packet od data to reassemble the packets into the original file in the right order.
![Image](https://github.com/user-attachments/assets/bf3305bb-ca27-4dc6-b751-9898c44209dc)

### MODULE 1: How do Computers Communicate? - The evolution of the cloud

###### - The first documented use of the term cloud computing was in an internal document at Compaq Computer, which later merged with the Hewlett-Packard Company. Engineering drawings used a cloud as a symbol for a network.

##### The beginnings of cloud computing
###### - When the internet was just beginning, companies would use high-powered computers to host web pages and store files. 
###### - These computers were the first servers. Each computer might have run several websites, and the computer’s storage would have all the files needed for the site saved on it. 
###### - In the early days, it was common for small businesses to have their company’s websites running on a server under some employee’s desk. Imagine how fragile this was. 
###### - As internet technology evolved, server farms developed where hundreds and then thousands of servers networked together to share the tasks or workloads involved in delivering hundreds of websites and services.
###### The cloud is an evolution of these server farms. Computer scientists designed early internet servers to deliver websites with all the services a website needed, like storage, networking, and security, all on one server. 
###### - Cloud computing improved on that model by separating the features of one server into distinct functions on specially designed and dedicated servers. This makes it easier for engineers to use only the resources they need when they need them. 

### MODULE 2: How Does Cloud Computing Work? - The importance of the cloud
###### - Cloud computing makes many powerful technical tools and innovations easy to access in everyday life.

##### Dynamic mapping technology, such as Google Maps
###### - With support services that respond dynamically to changing location in real time and the ability to store and deliver large amounts of data quickly, the cloud enables companies to develop maps that dyncamically adjust to changing conditions and help people get to where they need to go.

##### Global identity and access management (IAM)
###### - the global presence and strong security of the cloud enable companies to manage which individuals or systems can access their resources. 
###### - the cloud also enables single sign-on so users can sign on to one service and then acccess a variety of cloud-based resources

##### Personal digital assistants like Siri and Alexa
###### - services like natural language processing (NLP), voice recognition, and large sets of data need lots of computing power
###### - cloud-connected mobile devices can access powerful computers in the cloud to enable users to get answers to questions, set appointements and reminders, and even send emails 

##### Files and photos everywhere and anywhere
###### - massive amounts of storage and a global network of computers make it possible for users and businesses to access their files like documents, photos, spreadsheets, and even media from anywhere and on any device using the cloud

##### Voice and music streaming
###### - streaming music and video require a lot of bandwidth and intelligent network technology to compress data and get the media to where it needs to go
###### - cloud networking, data compression, and global data replication make streaming movies and songs possible

##### Natural Language Processing (NLP) and Artificial Intelligence (AI)
###### - processing natural language and artificial intelligence takes a lot fo memory and processing power
###### - since the cloud uses thousands of computers working togther, cloud systems can process enormous amounts of data quickly and run complex algorithms using powerful computers, all of which makes nautral language and AI possible

##### For many people, it’s hard to imagine a world without some of these innovations. But the cloud is relatively new and many of these innovations appeared within the last decade. None of them would exist without the cloud.

###### - the cloud us also important for businesses, example: creating a suport ticket with a cloud-based support service.

##### Step 1: Customer encounters problem
###### - a customer attempts to use their microwave, but the appliance doesn't turn on

##### Step 2: Customer attempts to troubleshoot
###### - the customer browses to the company's website and finds the manual for the appliance
###### - they work through the troubleshooting steps, but can't fix the problem

##### Step 3: Customer uses a chatbot to troubleshoot
###### - on the customer support page, the customer notices the option to use a chatbot
###### - the chatbot uses cloud-based artificial intelligence and natural language processing to interact with the customer
###### - after a few minutes, the chatbot decides it cannot help the customer with the problem and asks if they want to open a support ticket

##### Step 4: Customer creates a support ticket
###### - the chatbot sends the customer to an online form
###### - the form asks if they want to sign in with their social media account to make filling out the form easier
###### - the service uses a cloud-based identity and access management system (IAM) to securely bring customer information from their social media account into the form

##### Step 5: Customer identifies the product
###### - the form asks the customer to take a picture of the front of their microwave with their phone and send the photo to a cloud service that uses image recognition to identity the exact model
###### - it then automatically fills in the relevant data on the support ticket

##### Step 6: Customer describes the problem and submits the ticket
###### - on the form, the customer selects a microphone button and describes the problem using their voice
###### - as they describe the problem, the service uses a cloud service to accurately transcribe what the customer is describing in real time
###### - the customer has the chance to edit the transcription and then submits the support ticket

##### Step 7: Cloud services move the ticket along
###### - the service uses a cloud application to create an entry in the support database and automatically send a notification to a support professional with the information so they can begin to work on it
###### - the service also automatically sends an email to the customer summarizing the support ticket

##### Step 8: Customer sets up an appointment
###### - the customer uses a link in the email to set up an appointment for a technician to come and fix the appliance
###### - the customer receives real-time updates about the technician's arrival time on their mobile device


### MODULE 2: How Does Cloud Computing Work? - The components of the cloud
###### ==> there are five main components that most cloud services include as a part fo their infrastructure

##### Physical Computers
###### ==> all cloud systems are made up of hundreds and, many times, thousands of computers
###### ==> these computers perform functionas like storing data and processing information

##### Virtual Computers 
###### ==> most cloud systems use virtual computers, often known as virtual machines, to perform various functions
###### ==> a virtual machine (VM) is a software-based computer that runs on a physical computer
###### ==> the VM emulates all the functions of the physical hardware
###### ==> Many VMs can run on one physical computer and each VM runs independently of any others

##### Networking Devices
###### ==> high-powered, intelligent networking hardware and software helps ensure that lcoud systems can move data quickly and accurately over the internet

##### Management Software
###### ==> adminstrators use management software to manage and monitor the cluod infrastructure and services, which enables them to provision resources, monitor usage, and enforce security policies

##### Service Software
###### ==> similar to a graphical user interface on an operating system like Windows or MacOS, users interact with service software to access the software and services provided by the cloud

![Image](https://github.com/user-attachments/assets/697d8a0b-8c24-4909-bf46-935f1a86bd68)
###### - this illustration shows how these five components work together to form the cloud
###### *** administrators use management software to manage and monitor the computers, both physical and virtual, in the cloud ***
###### *** the user interacts with software to access the services and data available on these computers ***

###### - each of these five components work together, or are orchestrated, to provide cloud services to users
###### - while no component of a cloud system is more important than another, every aspect of the cloud starts with physical hardware
###### - data centers are the warehouses that store and manage this hardware

### MODULE 2: How Does Cloud Computing Work? - The role of data centers in cloud computing
##### Data Center
###### ==> a data center is a facility to house computer systems and related components, such as telecommunications and storage systems
###### ==> it is designed to provide a secure and controlled environment for the reliable operation of cloud infrastructure, whcih can include servers, network equipment, storage systems, and other hardware
###### ==> data centers enable cloud providers to store and process vast amounts of data, run complex applications, and provide reliable connectivity to users, all the things the cloud was designed to do well

#### The makeup of a data center
###### - data centers typically have several key components

##### Environmental Controls
###### ==> data centers require large amounts of electricity to power cloud hardware
###### ==> they use sophisticated cooling systems to maintain the proper temperature and humidity levels

##### Physical Security
###### ==> data centers are designed to be highly secure, with measures such as security cameras, access control systems, and biometric authentication to prevent unauthorized physical access

##### Storage Systems
###### ==> most servers include some local storage capability as well as networked storage for multiple servers to use

##### Network Connectivity
###### ==> data centers must connect to high-speed, reliable networks to enable the transfer of data between cloud hardware, software, and users

##### Redundancy and Disaster Recovery
###### ==> to ensure maximum uptime and reliability, data centers often include redundant power and cooling systems, backup generators, and multiple network connections

#### How a data center works
###### - data centers are essential for the cluod and they function as the hub through which the cloud does its work

##### Internet Data
###### ==> data is sent over the internet from users and systems to a data center which processes it

##### Security
###### ==> data centers have many security measures in place like firewalls and user access controls to ensure malicious data doesn't infect the data center

##### Management Software
###### ==> special software manages how data is processed
###### ==> the management software ensures the data goes to the right place

##### Services
###### ==> the data center will process data for users that have set up serivces such as video streaming or content management
###### ==> once the service processes the data, it is sent back to users through the internet

##### Data Storage
###### ==> some data is stored in the data ceneter for later use
###### ==> other data is processed by database management and analytics software and sent back to users


###### - Data centers can be operated by the organization that runs the cloud system, like Amazon Web Services (AWS) or Microsoft Azure. 
###### - Some cloud providers use other companies to manage the hardware that powers their data centers, which enables the cloud provider to focus on the management software and services.

#### Data centers working together
###### - Because cloud providers make their cloud services globally accessible, they tend to locate their data centers all over the world and use complex software to keep the data and services in sync and working together. 
###### - When data centers are physically closer to the users that need them, the users can access the data more quickly and the transfers are less prone to error. 


### MODULE 3: Why do people use cloud computing? - Key characteristics of cloud computing

#### Distributed Computing
###### - In the early days of computing, all the hardware and functions a computer needed to do its work resided on a single machine. 
###### - Early personal computers are a good example of this type of computing. A single machine had:

###### ==> a hard disk for long-term storage
###### ==> Random Access Memory (RAM) for short-term storage
###### ==> a central processing unit (CPU) for computing power
###### ==> a keyboard, mouse, floppy disk, or CD-ROM drive for input
###### ==> a screen for output

######  - Cloud computing distributes this hardware and the functions of this hardware over hundreds and, in most cases, thousands of computers. 
###### - In the cloud, some computers are dedicated to just one function like storage or computing power. 
###### - Software coordinates these functions so people can use different combinations of them over a network to complete their tasks.

#### Scalability
###### - Because computing in the cloud is distributed, users can use as much or as little power as they need when they need it. Computer engineers call this scalability.  
###### - Traditional computers are not scalable. The capacity of the computer resides in the hardware and if a user needs more computing power, they must purchase a different CPU. 
###### - Similarly, if they need more storage, they must purchase a hard disk with more capacity or add an external hard disk by purchasing another device. 
###### - Sometimes people might “overbuy” hardware, spending money on high-powered hardware just in case they need it, but then perhaps never do. 

#### Availability
###### - Many people are used to having their mobile phones with them and the device being connected to a network all the time. 
###### - For example, if you’re travelling with friends and you get separated, reconnecting with them is just a text or call away. 
###### - Thanks to the cloud, having constant and reliable access has become a way of life. But, only a few decades ago very few people had access to a mobile device. 
###### - Therefore, you would need to carefully pick a place to meet up if someone got lost. And, if plans suddenly changed, good luck communicating that to the rest of the group. 
###### - When everyone has a mobile device, they’re available all the time. Without these devices, availability is limited.

###### - Cloud computing has made computing resources and data much more available. Prior to cloud computing, people stored data on their personal computers. 
###### - If a person created a document on their laptop, for example, that document was only available to the person while they were using their laptop. 
###### - With cloud computing, the cloud can store documents and they can be available anywhere there is an internet connection. 
###### - Accessing a document from a mobile phone anywhere in the world is just as convenient for a person using cloud storage as accessing it from a laptop in a home or office.

#### Resilience
###### - Traditional computers are sometimes subject to failure because the failure of a single hardware component can make the entire computer unusable. 
###### - If a disk drive fails for any reason, the user can’t use the machine. For businesses, this can be catastrophic. 
###### - If a company runs an essential business function on a single server, the failure of that server might mean that the business can’t operate. This would affect both customers and employees. 
###### - Businesses try to address problems like these by making backups and having redundant systems—two or more computers that do the same thing. But this isn’t cost effective and can still cause down time while engineers restore data from backups. 
###### - Cloud computing removes these risks by ensuring that multiple machines can take over a function if one machine in the network fails. 
###### - And cloud storage copies data to multiple computers so that if a storage device fails on one or more computers, many others have copies of that data. 
###### - Because of this resiliency, users are often completely unaware of any hardware failures in a cloud environment. 

***While many people see cloud computing as evolutionary rather than revolutionary, the evolutionary changes provide benefits such as higher productivity, fewer catastrophic failures, and greater innovation.***

### MODULE 3: Why do people use cloud computing? - Benefits of cloud computing

#### Benefits to users

##### Convience
###### ==> users can access their data and applications from anywhere with an internet connection and on any device
###### ==> this eliminates the need to carry around physical storage devices or install software on mulitple devices

##### Cost Savings
###### ==> users do not need to invest in expensive hardware and software
###### ==> they can pay only for the resources they use, resulting in significant cost savings

##### Flexibility
###### ==> users can access computing resources from anywhere with an internet connection and on any device
###### ==> this flexibility enables remote work and lets them easily collaborate with others

##### Reliability
###### ==> users can expect the cloud to always be available and offer resilience against failure
###### ==> this helps ensure that they can always access their computing resources, eliminating the risk of downtime that can impact productivity and disrupt personal activites

##### Security
###### ==> users' data and personal information are protected by the robust security measures that cloud service providers offer

#### Benefits to businesses

##### Innovation
###### ==> businesses can quickly and easily experiment with new technologies and services, helping them to innovate and respond to market trends more quickly

##### Agility
###### ==> businesses can stay agile, responsive, and competitive
###### ==> because cloud providers offer a diverse range of services, businesses can adapt and grow so that their businesses grow and change as their market demands

##### Collaboration
###### ==> employees can access computing resources from anywhere with an internet connection, enabling remote work and collaboration with partners and customers
###### ==> many businesses saw the value of this flexibility during the COVID pandemic
###### ==> it can be argued that many businesses would have suffered far more deeply during that crisis without the ability of the cloud to connect people

### MODULE 3: Why do people use cloud computing? - How cloud computing provides its benefits to users and businesses

##### 1. Single Sign-On
###### ==> users set up a single account with many cloud providers to gain access a variety of software and services
###### ==> users only need a single user account on all their devices
###### ==> users can even log into their devices using their cloud account

##### 2. Cloud Storage
###### ==> Once logged in, users store documents, images, data, and even stream media from cloud storage
###### ==> Businesses can use secure cloud storage for corporate assets like documents and media as well. 

##### 3. Apps
###### ==> Many cloud providers deliver software over the cloud like word processing and spreadsheet applications. 
###### ==> Companies publish their internal corporate apps to the cloud and deliver them to employees all over the world. 

##### 4. Workloads
###### ==> A workload is a specific job that a computer system performs. 
###### ==> Cloud providers offer workloads like automatic backups and image storage for mobile devices that can save users from catastrophe. 
###### ==> Businesses develop microservices—small software packages that do something specific—and publish them to the cloud. Users can scale these workloads up and down based on demand and need. 

##### 5. Connected Devices
###### ==> Many cloud providers enable device connectivity so one device can send data to and communicate with another device even miles apart. 
###### ==> By using the cloud, users’ devices can function as extensions of one another with seamless connectivity. 

##### 6. Performance
###### ==> Because the cloud is distributed and uses the power of thousands of computers, users and businesses alike get highly performant apps and services. 
###### ==> Cloud storage is replicated around the world so downloads can take minutes or seconds rather than hours. 
###### ==> Cloud networks are available in many locations, so network latency, or delays, are kept to a minimum. 

***Traditional computing was an important first step in the evolution of the technology. Like early networks were to the internet, traditional computing was powerful but only scratched the surface of what was possible. Businesses and individual users have turned to the cloud to enable them to do more with computing than ever before possible.***


### MODULE 4: How do technology advancements impact the cloud? - The makeup of the cloud
###### - The cloud is made up of thousands of computers working together to create a seamless computing system for users and businesses. 
###### - The computers that are the backbone of the cloud are housed in data centers, which contain thousands of computers running special software.

***One software technology that some of these computers run are virtual machines (VMs).***

###### ==> VMs help the cloud to scale computing power and enable specialized tasks.   
###### ==> VMs run management software, which coordinates thousands of virtual machines and physical computers.   
###### ==> VMs also run the service software that users access, such as admin software for administrators to manage their cloud services. 

###### - Data centers also have hundreds of networking devices alongside the software that runs them
###### - These networking devices move data between computers in the data center and between data centers

### MODULE 4: How do technology advancements impact the cloud? - Advances in cloud technology
###### - All the components that make up the cloud are constantly evolving. As these technologies improve, the capabilities of the cloud will improve accordingly, and new scenarios will become possible. 
###### - Let’s look at how the improvements that engineers are developing in these key areas of the cloud will impact the industry: Computer technology, Virtualization technology, and Networking technology

#### Computer Technology
###### - Computer technology is the backbone of cloud computing. At its most basic, a computer has a CPU, RAM, a network interface, and long-term storage such as a hard disk drive or solid-state drive
###### - Computers have many other components like a power supply, a cooling system, and ports. Advances in each of these areas will help make the cloud more efficient, faster, and more scalable. 

##### Improving Efficiency
###### ==> Computer CPUs are increasing in computing power while, at the same time requiring less electrical power. 
###### ==> For example, ARM processors consume about 5 watts of power compared to the 130 watts of power used by higher-end alternative processors. 
###### ==> This means that data centers can add more processing power while consuming less energy and generating less heat. 

##### Reducing Component Size
###### ==> Computer chip technology continues to shrink in size. As chips get smaller, more processing power can be built without needing to increase physical space
###### ==> This means that cloud data centers can continue to add processing power using the same warehouse space

##### Using more solid-state components
###### ==> When a device has moving parts, there is more risk of those parts failing over time
###### ==> Traditional computers use hard disks that involved spinning platters and a needle that moved to read the information on the platters
###### ==> Solid-state drive technology has no moving parts and uses less power
###### ==> Data centers moving to this technology reduce the chances that disks will fail and reduce the power that the devices consume

##### Increasing Processing Power
###### ==> Graphics processing units (GPUs) are the chips that manage graphic processing on a computer and are many times faster than CPUs
###### ==> Cloud engineers developed ways to use GPUs for the most intensive calculations like complex data process, natural language processing, and image manipulation
###### ==> This enables cloud data centers to use GPUs to decrease the time it takes to run these intensive calculations and improve performance for certain types of jobs

#### Virtualization Technology
###### ==> Virtualization includes virtual machine technology and containers
###### ==> By using virtualization technology, cloud providers can reduce wasted resources and provide more fine-grained control for cloud developers over the apps and services they create. 

##### Increasing the use of containers
###### ==> Containerization is a lightweight form of virtualization that enables applications to run in isolated environments on a single host operating system
###### ==> Containers are portable, easy to manage, and offer fast startup times. 
###### ==> By using containers in cloud environments, cloud developers don’t have the cost and management associated with a full physical computer or even a virtual machine and can make their applications and services faster and less resource intensive. 

##### Adopting serverless computing
###### ==> Serverless computing is a type of cloud computing where the cloud provider manages the infrastructure and automatically allocates resources as needed
###### ==> This approach helps cloud developers and administrators by enabling them to build and run application code without provisioning or managing servers or backend infrastructure
###### ==> Also, since resources are allocated dynamically as required, businesses don’t have to pay for unused capacity

##### Virtualizing hardware
###### ==> Hardware virtualization is the creation of a virtual machine that runs inside a physical server. 
###### ==> Recent advances in hardware virtualization include support for nested virtualization, which enables one virtual machine to run inside another virtual machine
###### ==> Virtual machines don’t require physical space and they’re more resource efficient than physical machines

##### Virtualizing networks
###### ==> Network virtualization is the creation of a virtual network that is independent of the physical network infrastructure
###### ==> Network virtualization uses software to create a “view” of the network that an administrator can use to manage the network from a single console, making the network easier to manage
###### ==> Recent advances in network virtualization have improved security, scalability, and flexibility which provide advantages to administrators responsible for their networks’ performance.

#### Networking Technology
###### - If computer technology is the backbone of the cloud, networking technology is its mouth, hands, and feet
###### - Networking enables computers to interact with each other, sending data between computers in a data center and between data centers. 

##### Improving network protocols
###### ==> A protocol is a set of rules that computer device manufacturers follow to ensure that devices can interact with each other regardless of which company produces them
###### ==> As more devices have come online, an older networking protocol called IPv4 wasn’t able to handle the number of devices
###### ==> Cloud providers are moving to a new protocol called IPv6 that enables a virtually unlimited number of devices to connect to the internet

##### Edge Computing 
###### ==> Edge computing involves processing data closer to where it is generated, rather than sending it to a centralized data center
###### ==> This approach can reduce latency, or delays, and improve application performance, especially for applications that require real-time processing.

##### Intent-based networking (IBN)
###### ==> IBN is an approach to network management that uses high-level business policies and intent to automate network configuration and management
###### ==> For example, a network administrator can make a request using natural language which an IBN system will interpret and then structure the network accordingly
###### ==> IBN can simplify network management and reduce human error, while also improving network performance and security

***Efficiency in both computing power and in power consumption have been at the forefront of advances in cloud technology and some innovations are making the cloud easier to manage and changing the way administrators use the cloud.***

### MODULE 4: How do technology advancements impact the cloud? - What the future holds
###### - The next generation of technology has the possibility to advance cloud computing to the realm of science fiction
###### - Devices that interact naturally with humans, instantaneous network connections, and computers that can process the most complex problems in minutes rather than weeks all are on the horizon. These technologies will improve how the cloud works.

##### 5G, Wi-Fi 6, and beyond
###### ==> Advances in cellular and wireless technology will dramatically increase connectivity to the cloud, making using the cloud more seamless. 

##### Artificial intelligence and natural language processing
###### ==> The cloud of the future will not only enable artificially intelligent applications and services but will use AI to power the cloud
###### ==> These technologies will make decisions in real time about how to move data and how best to allocate resources

##### Quantum Computing
###### ==> New computers using quantum technology will be able to process information billions of times faster than today’s computers
###### ==> Computing tasks that currently would take years to complete will take minutes in the future

##### Blockchain
###### ==> The cloud will use blockchain technology, popular today in currency, to power security systems, storage systems, and even politics and finance.

##### Internet of Things
###### ==> Internet of Things (IoT) is a technology that enables even the smallest devices like lightbulbs and watches to be connected to the cloud
###### ==> As IoT advances, devices will be able to communicate over the cloud, enabling a host of new scenarios that will improve safety, automation, and connectivity

### Key Components
###### 1. Computer networking simplifies transferring data from one computer to another. 
###### 2. Cloud computing evolved from computer networking and server farms to provide benefits to developers, users, and businesses. 
###### 3. Cloud computing separates the features of one server into distinct functions on specially designed and dedicated servers to make it easier to use only the resources you need when you need them. 
###### 4. Cloud computing enables many of the modern technologies you use every day, including mapping, digital assistants, video and music streaming, and natural language processing and AI. 
###### 5. There are five main components in cloud services: physical computers, virtual computers, networking devices, management software, and service software. 
###### 6. Data centers enable cloud providers to store and process vast amounts of data, to run complex applications, and to provide reliable connectivity to users. 
###### 7. Cloud computing provides distributed computing, scalability, availability, and resilience to users and businesses. 
###### 8. Cloud computing enables all users to access their data and applications reliably and securely from anywhere in the world on any device, paying only for the resources they need at that time. 
###### 9. New developments in computer technology, virtualization, and networking will enable better, faster, cheaper, and more reliable systems in the future