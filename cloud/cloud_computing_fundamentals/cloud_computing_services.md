# Understanding Cloud Computing Services

## MODULE 1: What are cloud services and how are they modeled?

### A look to the future

###### - In recent years, many businesses have been moving their operational work to the cloud. 
###### - For example, businesses might store their employee data and use that data to run payroll systems in the cloud. An individual computational task like running payroll is called a workload.
###### - Moving common workloads to the cloud enables businesses to: save money, scale based on business needs, and accelerate innovation

### Artificial intelligence and the cloud

###### - In the 1950s, computer scientist and mathematician Alan Turing developed a test to determine if a computer was “thinking” similarly to the way humans think. 
###### - The test was simple: if 30% of humans who conversed with the machine couldn’t tell if it was a machine or a human, the machine passed the test. 
###### - The test became known as the Turing test(opens in a new tab). 
###### - It took until 2014 for computer engineers to develop a computer that could pass the test!  
###### - Machines that can process information in a way that mimics or imitates human thinking are said to be intelligent
###### - Because the intelligence isn’t human, scientists have called this kind of thinking ability as artificial intelligence (AI). 

| Technology | Application | Description | 
| ---------- | ----------- | ----------- |
| Image Recognition | Medical Diagnosis | Doctors use AI to help them analyze medical images and patient data to better diagnose issues and plan treatments. | 
| | National Security | Security and governmental agencies use AI image recognition to help keep people secure. It can analyze and recognize images, enabling engineers to develop facial recognition, and objet detection programs. |
| Natural Language Processing (NLP) | Virtual Assistants | Virtual assistants like Siri and Alexa use NLP. One day, humans will interact with these tools as they would with another person. |
| | Chatbots | Businesses are deploying chatbots to provide customer support and answer questions in natural language and in real time by using NLP. |
| Real-time data analysis | Gaming | Game developers are using AI in video games to create realistic opponents and adapt to the player’s behavior. |
| Deep Learning | Recommendation Systems | Companies use AI to analyze customer behavior to help them more easily find products and services they need and prefer. Examples include Netflix movie recommendations and Amazon product recommendations. |
| | Fraud Detection | AI systems can analyze data and threat actor behavior to identify fraudulent behavior and patterns. Credit card companies use these systems to help identify fraudulent credit card usage while not restricting their customers from using their cards when they need them. |

#### How the cloud enables AI technology
###### - The ability to create powerful artificial intelligence has accelerated as cloud systems have evolved

##### Data storage
###### ==> Most AI systems operate using a lot of data. For example, a natural language processing (NLP) system uses large volumes of data to learn the structure of a language. 
###### ==> The system then learns how to construct sentences in that language from the existing narrative text
###### ==> Because training machine learning models requires vast amounts of data, the cloud provides much easier access to terabytes of sample data from all over the world. 

##### Processing Power
###### ==> To process large amounts of data quickly, AI systems need high-powered central processing units (CPUs) and the ability to scale up with more power as they need it
###### ==> The millions of CPUs the cloud provides along with the scalability of the cloud gives engineers the power they need to build accurate AI systems that work quickly

##### High Availability 
###### ==> The cloud is a global network of connected computers. The computers that comprise the infrastructure of the cloud are only one part of that network
###### ==> Individual devices use cloud services to make even low-powered devices more powerful. If you ask a question of the digital assistant on your phone, it uses the cloud to process your request and send back an answer in real time
###### ==> This is only possible because the cloud is always available and ready to service users anytime and anywhere

##### Experimental Opportunities
###### ==> Individual companies often find it difficult to add experimental hardware and software to their offerings
###### ==> However, this becomes much easier when using cloud providers who have the resources of thousands of companies and users
###### ==> IBM quantum computers are an example. Even small companies can use the power of these computers—something that wouldn’t be possible without the cloud

### The Internet of Things (IoT)
###### - The cloud supports communication between devices and hosts the computing power for performing complex calculations, so the vehicles just need networking devices that can send specific and large amounts of data to the cloud
###### - Connecting devices to the internet and to each other using the cloud is called the Internet of Things (IoT)

##### Data
###### ==> The cloud collects, analyzes, and transmits data from a variety of sources, enabling vehicles to share and access information from sources such as traffic conditions, weather forecasts, and road hazards

##### Sensors
###### ==> Vehicles and roads fitted with sensors send and receive data using wifi, satellite, or cellular connections to the cloud in order to communicate with each other and cloud servers
###### ==> Onboard computers in the vehicles and computers in the cloud analyze the data using machine learning. This enables vehicles to optimize their performance, safety, and efficiency. 

##### Status
###### ==> Utilities such as traffic lights and street lamps use cloud-connected sensors, timers and efficiency equipment to optimize how they operate
###### ==> For example, a street lamp might turn off when no vehicles or people are nearby and turn on when a pedestrian or passing car needs light

##### The Cloud
###### ==> The speed, availability, and computing power of the cloud makes all this possible
###### ==> Advanced services like machine learning can make analyzing large amounts of data useful and provide valuable information to devices that need it


###### - The IoT is a networking model that describes the interconnection of physical devices, appliances, and everyday objects that owners can access and control through the internet
###### - These devices are equipped with sensors, software, and network connectivity, enabling them to collect and transmit data to other devices, applications, or cloud-based services

#### The cluoud and IoT
###### - The cloud plays a crucial role in enabling the IoT by providing a platform for storing, processing, and analyzing the massive amounts of data generated by IoT devices

##### Data and Analytics
###### ==> IoT devices collect data and send it to the cloud where services store, process, and analyze the information
###### ==> Other cloud services can use the data to derive insights and make informed decisions, such as identifying patterns, detecting anomalies, predicting maintenance needs, and optimizing performance

##### Scale and Flexibility
###### ==> The cloud also provides a scalable and flexible infrastructure for deploying and managing IoT applications and services
###### ==> Developers can use cloud-based tools and platforms to create and deploy IoT applications and manage them for large-scale deployments

##### Security and Compliance
###### ==> In addition, the cloud provides a secure and reliable environment for storing and transmitting sensitive data generated by IoT devices
###### ==> Devices and cloud services can encrypt data and control access to it using role-based access control

***Engineers can create IoT applications and services without a heavy reliance on the cloud. However, in order to develop large-scale IoT deployments or services that require a lot of processing power and storage, the cloud is essential.***

###### - AI and the IoT applications and services are just two examples of services that the cloud empowers, due to their intensive need for large data sets and processing power
###### - The structure of cloud services, or its service models, creates an environment for businesses and users to create and use services like these

### The cloud service model
###### - People that work with and use cloud services have become familiar with the phrase “as a service.” The phrase describes one of the biggest shifts in cloud computing
###### - That shift involves moving computing from individual computers with software installed on them to a network of computers with a variety of software options that people can use as they need them. For instance, the Microsoft Corporation delivers its widely used Office suite of products as a service

##### Traditional Software
###### ==> Office productivity tools such as Microsoft Office were pre-installed on a computer or purchased separately and then installed
###### ==> Users downloaded the software and it installed locally, either from a CD-ROM or from the internet
###### ==> Users purchased the software one time and, occasionally, new versions needed to be purchased, downloaded, and installed

##### Software as a Service
###### ==> Using the cloud, a person can use Microsoft Office without needing to download or install anything through the software-as-a-service model
###### ==> They can use it on any number of devices including mobile phones and tablets
###### ==> Users purchase software through a subscription service which is continually updated

#### Types of cloud service models
###### - Cloud providers might apply the “as a service” name to a variety of offerings. However, there are four main types of service models that you need to know.

##### Software as a Service (SaaS)
###### ==> SaaS is a way of delivering software applications to users over the internet without requiring them to install or manage the software themselves
###### ==> Instead, servers host the software in the cloud and users can access it through a web browser or internet-connected device. 
###### ==> With SaaS, users pay a subscription fee to access the software, usually on a monthly or yearly basis
###### ==> This fee covers the cost of hosting the software on the provider’s servers, as well as any updates or new features that are added over time

##### Infrastructure as a Service (IaaS)
###### ==> IaaS is a cloud computing service model that provides users with access to computing resources over the internet
###### ==> These resources include servers, storage, and networking components, which are all hosted by a cloud service provider
###### ==> With IaaS, users only pay for the computing resources they use. This means they can easily scale their usage of these resources up or down depending on their needs, without having to worry about investing in expensive hardware or IT infrastructure

##### Platform as a Service (PaaS)
###### ==> PaaS is a cloud computing service model that provides users with a platform to develop, run, and manage applications over the internet 
###### ==> With PaaS, developers don’t have to worry about managing the underlying infrastructure or operating system, because these are all taken care of by the third-party provider
###### ==> As with IaaS, users only pay for the platform services they use.

##### Database as a Service (DBaaS)
###### ==> DBaaS is a cloud computing service model that provides users with access to a fully-managed database
###### ==> With DBaaS, users don’t have to manage the underlying infrastructure or database software
###### ==> The cloud provider is responsible for ensuring these are available and operating properly
###### ==> With DBaaS, users pay for the database and the computing resources they use on a pay-as-they-go basis
###### ==> This means they easily can scale up or down their usage of the database and resources, depending on their needs, without having to worry about investing in expensive hardware or IT infrastructure

#### Service models working together
###### - People can use the four cloud service models in isolation or together to create a cloud-based solution
###### - IaaS and DBaaS provide the foundational layer of computing resources, including servers, storage, and networking components.
###### PaaS builds on top of IaaS and DBaaS by providing a platform for developing, running, and managing applications.
###### SaaS works in conjunction with PaaS by providing access to software applications over the internet, without users having to install or manage the software locally

#### Migrating to the cloud
###### - In a cloud-based solution, IaaS, PaaS, SaaS, and DBaaS can work together to provide a complete cloud computing ecosystem
###### - Imagine an independent laboratory that tests water samples for contaminants from locations around the world. Their business is growing and they want to migrate to the cloud

##### Migrating infrastructure and data to the cloud
###### ==> The laboratory uses IaaS and DBaaS to host their infrastructure
###### ==> They move all their data to a cloud database which will expand as needed as the lab continues to grow
###### ==> They move key software to cloud servers and decommission their in-house servers and recycle them for other purposes

##### Moving key applications to the cloud
###### The lab runs customer software that increasingly requires more processing power to analyze data
###### ==> They migrate this software to a PaaS solution in the cloud which enables them to expand their software and its capabilities without having to purchase and manage their applications

##### Moving workstations to the cloud
###### ==> By using their cloud provider’s SaaS offerings, the laboratory can create Linux and Windows workstations in the cloud so their scientists can access virtual computers from any device and any location

## MODULE 2: Proprietary and open source software

### Two Types of software
##### Proprietary Software
###### ==> Proprietary software refers to computer programs that a specific company or individual own and control
###### ==> These programs usually are developed by a team of software engineers. They are protected by intellectual property laws
###### ==> This means that their source code is kept confidential and not publicly available. 
###### ==> The companies that create proprietary software usually sell licenses to use their software to individuals or other companies
###### ==> The licenses might have specific terms and conditions that dictate how the purchaser can use, modify, or distribute the software
###### ==> These terms often require users to pay for use of the software and might limit the number of devices or users that can access the software

##### Open Source Software
###### ==> Open source software is computer software that developers create and distribute under a special type of license that allows users to freely access, modify, and distribute the source code of the software
###### ==> This means that anyone can view and change the underlying code of the software provided they comply with the terms of the license
###### ==> Unlike proprietary software, open source software developers often work collaboratively as a community of programmers and developers who share their work and contribute to each other’s projects
###### ==> Open source software is often available for free, although some open source projects might ask for donations or have other ways to support their development

