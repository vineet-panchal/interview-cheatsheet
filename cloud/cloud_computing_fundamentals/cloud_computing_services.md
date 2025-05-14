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

### Software on the cloud
###### - Software developers use both proprietary and open source software when developing cloud solutions
###### - They usually base their choice of software type on the situation they’re trying to address and whether there is open source software available to address it

#### Proprietary Software
###### - Developers encounter many circumstances where working with proprietary software is appropriate
###### - For instance, in specialized industries, such as aerospace and defense, proprietary software might be the only option

##### Interoperability
###### ==> Sometimes a software developer might be working on software that uses other proprietary tools or software products that are unavailable in the open source ecosystem
###### ==> In such cases, using proprietary software is necessary to ensure compatibility and interoperability with the existing tools and technologies in the software solution

##### Security Requirements
###### ==> In environments where security is a top concern, software teams might not have the resources to review every line of code in an open source package to ensure that it meets their security requirements
###### ==> Developing software from scratch enables software teams to have specific knowledge of and take responsibility for all the code they deliver to the customer
###### ==> Alternatively, a development team might purchase proprietary software from a reputable company that guarantees the software’s security

##### Legal Compliance
###### ==> Proprietary software is typically distributed under a license that defines how the purchaser can use, modify, and distribute it
###### ==> By using proprietary software, developers can ensure that they are compliant with licensing terms and avoid any legal issues related to copyright or intellectual property

##### Specialized Features
###### ==> Sometimes advanced features and functionalities are not available in open source software
###### ==> If a software developer needs access to such specialized features, proprietary software might be their only option

##### Quality and Software
###### ==> In situations where a business or individual buys rather than builds software, proprietary software is often backed by a dedicated team of developers who provide regular updates, bug fixes, and technical support
###### ==> This can provide assurance to the purchaser that they will receive timely assistance if they encounter any issues or errors with the software

#### Open Source Software
###### - Although proprietary software is necessary in a variety of situations, increasingly many teams are turning to the open source community for software that can help them build their cloud solutions
###### - Some teams use open source software exclusively and modify it to fit their needs. Other teams supplement their proprietary software with open source
###### - Some cloud solutions that providers offer are based on open source software. Although large companies can use open source software to build their cloud infrastructure, individuals and smaller companies can also use it to build their own cloud
###### - These clouds typically are built for the individual or company alone to use and aren’t publicly available. This type of cloud is called a private cloud

##### Lower Costs
###### ==> Open source software is often available for free, which can be a major cost-saving factor for individual developers or small companies with limited budgets
###### ==> Even for larger organizations, open source software can provide cost savings compared to proprietary software that requires licensing fees

##### Collaborative Environment
###### ==> Open source software development often involves a community of developers who contribute to the project and provide feedback, bug fixes, and updates
###### ==> This creates a collaborative environment that fosters innovation and encourages the sharing of knowledge and ideas
###### ==> Even if a business has their own software development team, the open source community is very large and having more contributors can mean the company can develop solutions and solve problems more quickly

##### Transparency
###### ==> In situations where a company or individual is unable to develop their own software, open source software is publicly available and the source code is accessible
###### ==> This enables the developer to review the code to ensure that it is secure and free of potential vulnerabilities that might compromise their systems or data

##### Customizability
###### ==> Open source software provides access to the source code, which enables developers to customize and modify the software to meet their specific needs
###### ==> This can be particularly beneficial for developers who require specific functionality or features that are not available in off-the-shelf software products

##### Uniformity
###### ==> Users often benefit from the availability of similar features across various software products that they use. For example, menu functionality, button images, scrolling behavior, and even ways that products interact and process data
###### ==> Open source software can provide this uniformity and predictability for developers so their users don’t need to spend time learning proprietary software that behaves differently than their existing software

## MODULE 3: Overview of cloud service providers

### Thinking baout who provides the cloud

###### - The cloud refers to a collection of remote servers that users access over the internet.
###### - They use them to store, manage, and process their data, do things like operate a website, and perform computing functions like running calculations
###### - Basically, the cloud is a virtual space where they can store and manage data, use computer resources, and perform computing tasks without having to use their own physical computers

###### - Cloud providers build the devices and services that are resilient to downtime and attacks, as well as the scalable cloud services that large businesses need
###### - This requires a lot of investment in time and money. Because of this, most cloud service providers are large companies that have the resources to invest


### Features cloud providers share

##### Global presence
###### ==> All major cloud providers have data centers across the globe.  
###### ==> For example, Amazon Web Services (AWS) has 99 data centers in 31 regions around the world.  
###### ==> The closer data centers are to users, the faster and more reliable the cloud experience will be

##### Strong Security
###### ==> All cloud providers encrypt data and use monitoring software and hardware to detect threats
###### ==> They also use the latest technology for managing access to resources such as hardware access keys and multi-factor authentication (MFA)

##### Reliability
###### ==> Cloud providers use redundant systems to ensure data and services are available when users need them.  
###### ==> For example, Microsoft Azure has a service-level agreement measured in “9s.” Their entry level offerings have a guaranteed uptime of 99.9% of the time (3 9s)
###### ==> For businesses that need even more reliability, they offer services with up to 11 9s or 99.999999999% uptime guarantees

##### Scalability
###### ==> All cloud providers offer scalable solutions to meet the changing needs of businesses
###### ==> Users can add or remove computing resources quickly and when they need them or no longer need them

##### Standard Services
###### ==> All the major cloud providers offer a wide range of standard services, including: Infrastructure as a Service (IaaS), Platform as a Service (PaaS), Software as a Service (SaaS), Database as a Service (DBaaS)

##### Competitive Pricing
###### ==> Each cloud provider offers various pricing models to meet the needs of their users.  
###### ==> Pay-as-you-go and subscription pricing is standard for all the major cloud providers.  
###### ==> Providers also enable customers to pay for the amount of a given service that they use.
###### ==> For example, data storage might be priced per gigabyte. 
###### ==> Pricing is roughly the same across providers for similar services

### IBM Cloud

###### - IBM Cloud services provide most of the same services that customers can find at other cloud providers. However, IBM differentiates itself in three main areas: Hybrid cloud, Artificial intelligence (AI) and natural language processing (NLP), Emerging quantum computing technology

#### IBM Hybrid Cloud
###### - A hybrid cloud is a computing environment that combines the use of public cloud services and private cloud infrastructure. Organizations can take advantage of the benefits of both
###### - In a hybrid cloud environment, some workloads and data are kept in a private cloud, or on-premises infrastructure, and others are moved to the public cloud
###### - The two environments are connected and can communicate with each other. This enables businesses to scale resources up or down depending on demand, while maintaining control over sensitive data and applications
###### - IBM hybrid cloud consists of a range of technologies that support the infrastructure deployment

##### Architecture
###### ==> The IBM hybrid cloud architecture is designed to integrate on-premises infrastructure with public cloud services and its built on a foundation of open source technologies

##### Kubernetes
###### ==> Developers use Kubernetes to automate the deployment, scaling, and management of solutions that use containers
###### ==> The IBM Kubernetes offering is a special platform that helps businesses securely and easily manage their containerized applications
###### ==> In a hybrid cloud environment, Kubernetes can help businesses manage containers in the public cloud and on on-premises servers, seamlessly integrating between the two environments

##### OpenShift
###### ==> OpenShift is a cloud computing platform that businesses use to develop, deploy, and manage their applications
###### ==> It is an open source, container-based platform built on top of Kubernetes and Docker. 
###### ==> OpenShift provides a comprehensive set of tools and services for developers, operations teams, and IT administrators to streamline the application development process
###### ==> IBM Cloud Pak for Applications is the OpenShift offering from IBM

##### Pricing Model
###### ==> IBM hybrid cloud has a flexible pricing model that allows customers to only pay for what they use

##### IBM Cloud Code Engine
###### ==> IBM Cloud Code Engine is a fully managed serverless platform that enables developers to quickly deploy containerized applications and functions to the cloud
###### ==> It provides a platform for running and scaling applications without the need to manage servers, containers, or infrastructure
###### ==> IBM Cloud Code Engine also provides integration with other IBM Cloud services, such as IBM Cloud Object Storage, IBM Cloud Databases, and more
###### ==> This integration enables developers to easily build and deploy applications that leverage other IBM Cloud services

##### Analytics and artificial intelligence
###### ==> The IBM analytic and AI offerings enable businesses to leverage data-driven insights and optimize operations in a hybrid cloud environment
###### ==> By integrating and analyzing data from multiple sources, businesses can gain valuable insights into their operations and customer behavior
###### ==> AI tools like IBM Watson can help automate processes and improve customer engagement through personalized recommendations and conversational interfaces
###### ==> Additionally, the IBM analytic and AI offerings include advanced security features that help protect businesses from cyberthreats and ensure compliance with regulatory requirements

#### IBM artificial intelligence and natural language processing
###### - IBM has invested heavily in research and development of AI and NLP technologies and its cloud offering stands out in these areas
###### - IBM Watson technology has been at the forefront of the evolution of artificial intelligence and the technology is available to IBM Cloud users

#### IBM Watson
###### - IBM Watson is at the core of the IBM AI and NLP offerings. It’s a suite of AI tools and services that leverage NLP, machine learning, and deep learning to help businesses analyze large amounts of unstructured data and make more informed decisions

##### Language Services
###### ==> IBM Watson offers a suite of language services that enable businesses to analyze and understand text and speech data. The services include: Language translation, Natural language processing, Sentiment analysis

##### Vision Services
###### ==> Vision services use image recognition and computer vision to analyze and understand visual data. The services include: Object detection, Face recognition, Image classification

##### Speech Services
###### ==> Speech services enable businesses to transcribe and analyze speech data. The services include: Speech-to-text conversion, Speaker identification, Emotion detection

##### Knowledge Services
###### ==> Knowledge services are a set of services that help businesses manage and analyze structured data. The services include: Data exploration, Predictive modeling, Data visualization

##### Assistant Services
###### ==> Assistant services enable businesses to build chatbots and virtual assistants to interact with customers and employees. The services include: Tools for chatbot design, Integration with business systems, Natural language processing

##### Discovery Services
###### ==> Watson Discovery services enable businesses to search and analyze large amounts of unstructured data, such as documents and emails. This includes: Text mining, Entity extraction, Concept tagging

##### Watson Studio
###### ==> Watson Studio is a collaborative environment for building, training, and deploying machine learning models. It includes tools for: Data preparation, Model development, Deployment 

#### IBM Quantum
###### - Quantum computers use tiny particles called qubits. Qubits are the basic units of quantum information
###### - Unlike normal bits that can only be either 0 or 1 qubits can be in two states at the same time. This gives quantum computers more power and speed to perform complex calculations.   
###### - Quantum computers can help scientists do things like design new drugs, break secret codes, and understand the universe better
###### - However, quantum computers are still very hard to build and use, because qubits are very sensitive and can lose their special properties easily
###### - Scientists at IBM are working to create better qubits and quantum algorithms to make quantum computing more practical and useful


### Microsoft Azure
###### - Microsoft Corporation launched its cloud service, called Azure, in 2008 to help people and businesses make websites and apps without writing a lot of code
###### - It was a competitor to other similar services, such as Amazon EC2 and the Google App Engine
###### - It became available for everyone to use in 2010. It was originally called Windows Azure, because it was based on the Windows operating system that many people use on their personal and business computers
###### - Over time, Microsoft Azure offered more options and features, such as supporting more of the languages, programs, and systems that software developers use
###### - It added an option to use Linux-based computers. Linux is a non-Windows based system that some people prefer to use
###### - Azure delivered faster internet communication by locating data closer to where the users are. It also added more ways to connect different types of software and systems together.
###### - Today, Microsoft Azure provides more than 600 different services for its users.

#### Microsoft Azure Offerings
###### - Azure has similar features to other cloud providers, but differentiates itself in specific areas, such as strong enterprise, or business, support, and product integration

##### Strong Enterprise Support
###### ==> Microsoft has had a long relationship and focus on the enterprise, or business, customer
###### ==> Azure continues this tradition with a strong reputation for enterprise support, including features like 24/7 customer support, service-level agreements (SLAs), and compliance certifications

##### Product Integration
###### ==> Azure integrates well with other Microsoft products like Office 365, Dynamics 365, and Visual Studio
###### ==> This makes it easier for businesses that already use these products to adopt Azure.

##### Large Partner Ecosystem
###### ==> Azure has a large partner ecosystem, including independent software vendors (ISVs), system integrators (SIs), and managed service providers (MSPs) providing customers with a wide range of options for support and services.

##### Dedicated Gaming Cloud Service
###### ==> Azure provides a dedicated gaming cloud service called Azure PlayFab. This helps game developers create, launch, and operate live games with a global scale and reach
###### ==> Developers can use Azure PlayFab to build cross-platform games, manage live operations, monetize their games, and engage their players


###### - The Microsoft cloud empowers developers, business users, and users to build and use powerful productivity software, access media and files from anywhere, and even enjoy entertaining experiences
###### - Azure and the Microsoft cloud software are platforms on which users can build a variety of solutions and experiences.

### Amazon Web Services (AWS)
###### - Amazon Web Services (AWS) is the largest provider of cloud services to developers and businesses
###### - The Amazon cloud service is comprehensive and has the features and services found at other major cloud providers
###### - Amazon differentiates itself from other providers largely because it has a larger user base than other providers, which has created a large community base

##### Content Tools
###### ==> These services help customers create, deliver, and manage content on the cloud  
###### ==> They include Amazon S3 for object storage, Amazon CloudFront for content delivery network, AWS Data Exchange for third-party data, and AWS Transfer Family for secure file transfer

##### Analytics Tools
###### ==> These services help customers perform various types of data analysis on the cloud
###### ==> As businesses collect and need to analyze more and more digital information, Amazon can help them find data that they can act on
###### ==> Some tools include Amazon EMR for processing large amounts of data, Amazon Kinesis for streaming analytics, Amazon OpenSearch Service for analyzing data about how a business is operating, and Amazon QuickSight for dashboards and visualizations

##### Integration Tools
###### ==> AWS provides services that integrate content and analytic tools. 
###### ==> These services include AWS Glue for data integration and cataloging, AWS Lake Formation for data lake creation and management, AWS Glue DataBrew for visual data preparation, and Amazon FinSpace for financial data management and analytics

##### Machine Learning and AI
###### ==> AWS provides services that enable customers to use machine learning and artificial intelligence for content and analytic purposes. 
###### ==> These services include Amazon SageMaker for building and deploying machine learning models, Amazon Comprehend for natural language processing, Amazon Rekognition for image and video analysis, Amazon Lex for conversational interfaces, and Amazon Kendra for intelligent search

***Amazon provides a robust cloud offering with services that meet almost any need. Amazon continues to experiment with new products and undertakes research to make their cloud more robust and innovative.***

### The open source cloud
###### - The major cloud providers meet many businesses’ needs, but sometimes a business might want more flexibility in their cloud solution
###### - Open source cloud platforms enable developers to review and customize the code running their platform
###### - They can also host their cloud on their own corporate computers or on a large provider’s cloud

#### Open source cloud software
###### - Open source cloud software has become increasingly popular in recent years
###### - Open source licenses grant computer users permission to use open source software for any purpose they wish
###### - There are various tools available in the open source community for building a personal or company cloud
###### - Developers typically deploy open source clouds on personal or corporate-owned computers
###### - These are private clouds and only the individual or members of the corporation can use them
###### - While users can create private clouds on their own servers, they can also create them on clouds hosted by big cloud providers like IBM, Amazon, and Microsoft by using private networks, such as Nextcloud, OpenStack, OpenShift, and Eucalyptus

##### NextCloud
###### ==> Nextcloud is an open source cloud storage platform that enables users to store and share files, documents, photos, and other data
###### ==> It also provides a range of collaboration tools such as video conferencing, chat, and groupware.

##### OpenStack
###### ==> OpenStack is an open source cloud computing platform that enables users to build and manage private and public clouds using pooled virtual resources
###### ==> The platform is made up of several projects that handle core cloud-computing services such as compute, networking, storage, identity, and image services

##### OpenShift
###### ==> OpenShift is a cloud development Platform as a Service (PaaS) hosted by Red Hat
###### ==> It’s an open source cloud-based platform that allows developers to create, test, and run applications in the cloud
###### ==> OpenShift can manage applications written in different languages such as Node.js, Ruby, Python, Perl, and Java

##### Eucalyptus
###### ==> Eucalyptus is an open source software platform for implementing Infrastructure as a Service (IaaS) in a private or hybrid cloud computing environment
###### ==> It is compatible with Amazon Web Services (AWS), enabling users to build AWS-compatible private and hybrid clouds
###### ==> Eucalyptus enables users to provision compute and storage resources on-demand.

## MODULE 4: Scenarios where service models are appropriate

### Cloud service models
###### - Cloud service providers like IBM, Microsoft, and Amazon design their services so companies and individuals not only can build their own software solutions, but also use the cloud software and services that the cloud providers make available
###### - There are three primary types of cloud computing services that meet specific needs:  
###### - Software as a service (SaaS) enables people to access software applications over the internet 
###### - Infrastructure as a service (IaaS) provides virtualized computing resources over the internet
###### - Platform as a service (PaaS) provides a platform for developers to build, test, and deploy applications over the internet

### Empowering companies small and large with SaaS
###### - There are many cloud-based software packages that people can use for a variety of tasks.
###### - Miro is a popular visual collaboration tool.
###### - People use Lucidchart and Google Drawings, two cloud-based tools for creating diagrams.
###### - Even graphic design tools such as those found in the Adobe suite use a mixture of desktop software and cloud-based services to power their tools. 
###### - Cloud-based office productivity tools such as those used to create documents, spreadsheets, and presentations are popular among businesses and individuals
###### - Google, Microsoft, and Kingsoft all use cloud services to power their suites of tools that users can access from a web browser

### Building a business that scales using IaaS
###### - Consider a financial services company that is growing rapidly
###### - They provide financial services to their clients and their business is expanding
###### - They realize that they need to scale their financial services infrastructure to meet the growing demand of their clients
###### - In a traditional computing model, they would need to upgrade their existing infrastructure or purchase more computing resources like servers and hard disk drives to keep up with the growing demand
###### - But, by using IaaS on the cloud, the company can scale their operations by scaling up or scaling out

#### Scaling Up
###### - Scaling up refers to making an existing resource larger by integrating resources into them
###### - This is done by adding more memory, CPUs, or storage to an existing server configuration to address a specific problem
###### - Typically, a configuration can’t automatically scale up
###### - A user chooses to scale up by selecting a new configuration which the cloud provider then implements
###### - Scaling up is also known as vertical scaling.
###### - Resources on the cloud, like a web server, typically reside on one or more physical computers or virtual machines
###### - Cloud providers have computers and virtual machines in a variety of configurations to meet various customer needs

##### Memory
###### ==> The memory on a system is an important factor in how the system performs. When users set up a service on the cloud, they specify how much memory they want their system to have
###### ==> If a user needs more memory, they can choose to scale up to a configuration that supports their need

##### Storage
###### ==> Many cloud scenarios use specific computers for data storage so the data does not reside on the same computer or virtual machine as other resources
###### ==> When scaling up, users can specify how large they would like their storage to be and set limits to how large it can grow (or shrink)
###### ==> Typically, users set their storage limits in gigabytes (GB)

##### CPU/vCPU
###### ==> When scaling up, users can choose how many CPU's they want their physical computer to have or how many virtual CPU's (vCPU's) they want their virtual machine to have

##### Scale Amount
###### ==> When setting up an IaaS environment, many cloud services will set a limit on how many machines or virtual machines a user can have for their given configuration
###### ==> For situations that will demand a heavy workload, its important for users to choose a plan that will allow for a lot of machines to be created

#### Scaling Out
###### - Scaling out refers to creating one or more copies of a resource to share the workload
###### - The resource might be a physical computer or a virtual machine
###### - The copy will have the same configuration as the original resource and be capable of performing the same tasks. Scaling out is also known as horizontal scaling

#### Creating Instances
###### - When a user or company wants to scale out a resource like a virtual machine or even a physical computer, they specify the maximum number of computers of a given configuration that the cloud service will create
###### - Each computer that has that configuration with all the software and services running on it is called an instance
###### - Cloud IaaS software monitors the performance of applications and, when necessary, it can create new instances by replicating the computer configuration to ensure people using the applications have the best experience
###### - Users can configure their system to create instances to accommodate demand or at a specific time.  

### Deploying Solutions with PaaS
###### - In the early days of the internet, if a company wanted to build a website, they hired specialists to write HTML code and then publish the code to a web server that was, by today’s standards, rudimentary
###### - Today’s cloud enables companies and individuals to deploy a website with just a few clicks. After deploying the website, they can use the site as is or extend it by creating new templates, developing software, and analyzing the website and user data.
###### - The cloud provides the entire platform that companies and individuals need to build and deliver software and websites. This is known as platform as a service (PaaS). 

#### Using PaaS to deploy a website
###### - First, people who don’t have technical skills can easily create a website using an open source platform like WordPress
###### - It is a popular, easy-to-use content management system (CMS). A CMS enables users to create and publish website content, including blog posts, images, videos, and other multimedia
###### - Then, Microsoft Azure enables people to deploy a WordPress website with just a few clicks! The deployment includes: 
###### - The web server and associated services on which to run the platform 
###### - The database the platform needs 
###### - A virtual network to make the platform more secure 
###### - A content delivery network to make delivering media like images more efficient  
###### - Microsoft Azure has a PaaS offering with all the components needed to make this happen for someone deploying a WordPress website to the cloud. 

