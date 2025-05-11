# Cloud Computing Fundamentals

## Introduction To Cloud Computing

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

