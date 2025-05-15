# Understanding Cloud Development Models

## MODULE 1: Infrastructure hosted on premises

### Early Modern Computers
###### - These early computers had design and functional limitations, mainly because of the types of interfaces users needed to work with them
###### - An interface enables you to give data to the computer and get data from the computer
###### - Early computer interfaces were limited to paper tape and punch cards

### Mainframe Computers
###### - The move from paper tape to screens and keyboards was revolutionary
###### - Today, many interfaces are available, including touch screens, microphones and speakers, keyboards, and touchpads


###### - Because users could view the output from calculations on a screen, a computer lab could connect multiple terminals to the same computer
###### - Operators could enter data on a keyboard at a terminal and see the result on their screen, while sharing time on the same computer
###### - This type of computer is a mainframe. Mainframes get their name from the large frame of the cabinet that housed these early computers
###### - A mainframe is a central computer that does all the “thinking,” or processing, and sends the result to the “dumb” terminal

#### Modern Mainframes
###### - Who uses mainframes? Just about everyone has used a mainframe computer at one point or another
###### - If you ever used an automated teller machine (ATM) to interact with your bank account, you’ve used a mainframe

###### - Today, large organizations use mainframes to process large amounts of data. Companies use mainframes to: 
###### - Process billions of real-time calculations and web transactions every day. 
###### - Keep track of essential financial transactions like customer billing and employee payroll information. 
###### - Keep information safe and secure

##### High Processing Power
###### ==> Mainframes have powerful processors that can quickly handle large amounts of data and transactions
###### ==> Some configurations have a built-in AI processing chip to enable artificial intelligence (AI) scenarios without additional hardware

##### High Availability
###### ==> Mainframes are designed to serve users’ needs with little to no downtime
###### ==> They use features like redundant components and advanced electronics that deal with errors and other problems that might cause the system to fail

##### Virtualization
###### ==> Mainframes can run multiple operating systems and applications simultaneously in virtualized environments. This makes them very efficient machines.

##### Security
###### ==> Mainframes include advanced security features, such as encryption, authentication, and access control to protect sensitive data.

##### Scalability
###### ==> Mainframes can scale to handle growing workloads with the ability to add processing power, storage capacity, and other resources as needed.

##### Integration
###### ==> Mainframes can work with other systems and platforms to allow for easy sharing of data and smooth interaction between different applications.

##### Management
###### ==> Mainframes come with sophisticated management tools and automation capabilities to simplify administration and maintenance of the system.

***Modern mainframes power some of the most complex and demanding workloads on the cloud. But mainframes have uses beyond the data centers that cloud providers host. Businesses running their own data centers also use them.***

### Hosting infrastructure on premises
###### - Before the cloud became mainstream, businesses owned and operated their own infrastructure
###### - This included the hardware, like mainframes, and the software
###### - This is called on-premises hosting. Everything a business needs to run their daily operations is on the premises of the business
###### - In a sense, these self-hosted computer systems are private data centers. On-premises hosting includes some of the following features. 

##### Environmental Controls
###### ==> On-premises data centers require large amounts of electricity to power hardware
###### ==> They use sophisticated cooling systems to maintain the proper temperature and humidity levels.

##### Physical security
###### ==> On-premises data centers are designed to be highly secure
###### ==> They use measures such as security cameras, access control systems, and biometric authentication to prevent unauthorized physical access.

##### Storage Systems
###### ==> Most servers include some local storage capability as well as networked storage for multiple servers to use

##### Network Connectivity
###### ==> Like any data center, on-premises data centers must connect to high-speed, reliable networks to enable the transfer of data between hardware, software, and users.

##### Redundancy and disaster recovery
###### ==> To ensure maximum uptime and reliability, on-premises data centers often include redundant power and cooling systems, backup generators, and multiple network connections.


#### What are the benefits of an on-premises data center?
##### 1. 
###### ==> Hosting servers on premises can be good for businesses that require high levels of security and data privacy
###### ==> They have complete control over their infrastructure and can implement their own security protocols

##### 2.
###### ==> On-premises hosting is also more cost-effective in the long run for businesses that have large amounts of data to store and process
###### ==> This is because there are no ongoing costs associated with renting server capacity from a third-party provider. 

##### 3. 
###### ==> Hosting servers on premises allows businesses to customize hardware and software to meet their specific needs ###### ==> Businesses have complete control over their infrastructure

##### 4. 
###### ==> Also, if businesses are subject to industry-specific regulations or compliance requirements, they can ensure that they are compliant by hosting servers on premises

#### Setting up an on-premises data center
##### Step 1: Determine the hardware requirements
###### ==> The business decides what hardware resources such as servers, storage, and networking equipment they need to host the servers and software on premises
###### ==> Their decisions in this step depend on what work they need their data center to accomplish

##### Step 2: Choose the software
###### ==> The business chooses the operating system and other software components that will run on the hardware
###### ==> These can include database software, application servers, web servers, and other software that will make the data center operate
###### ==> They also need to decide whether they will use software they write or buy, or if they will use open source software, or a blend of both

##### Step 3: Install and configure the software
###### ==> After getting the hardware and software, the business installs and configures the software according to the business’s requirements
###### ==> This includes setting up user accounts, security settings, and other system settings

##### Step 4: Connect to the network
###### ==> The business connects the servers and software to the business’s network so that users can access the services
###### ==> The business also determines if and how the data center will connect to the internet and the policies that will govern that connectivity

##### Step 5: Implement backup and disaster recovery
###### ==> The business implements a backup and disaster recovery plan to ensure that they don’t lose data and services in the event of a hardware failure, natural disaster, or other catastrophic events.

##### Step 6: Maintain and upgrade
###### ==> The business maintains and upgrades the hardware and software over time to ensure that it remains secure and up to date with the latest patches and features.

##### Step 7: Add innovative services
###### ==> To take advantage of new technology like AI or blockchain, the business can build or buy additional services, and then maintain those services.

### Migrating to the cloud
###### - Some businesses need or choose to build their infrastructure on premises
###### - But many that started out on premises are choosing to migrate to the cloud.   
###### - Once businesses choose to migrate to the cloud, they begin the process of moving from on-premises hosting to cloud deployment

##### Step 1: Access current infrastructure
###### ==> the business needs to determine what hardware, software, and services are currently being used on premises and how they are being utilized

##### Step 2: Choose a cloud provider
###### ==> The business needs to research and choose a cloud provider that meets its needs and requirements

##### Step 3: Plan the migration
###### ==> The business needs to develop a plan for migrating its data and services to the cloud. This should include a timeline and contingency plan

##### Step 4: Migrate data
###### ==> The business needs to move its data to the cloud.
###### ==> This can involve transferring data to the cloud provider’s storage system or using a migration tool to copy data over

##### Step 5: Configure cloud services
###### ==> The business needs to configure the cloud services it will use, such as virtual machines, databases, and storage

##### Step 6: Test and validate
###### ==> The business needs to test and validate the cloud environment to ensure that it is working as expected and that data is being accessed and stored correctly.

##### Step 7: Transition to the cloud
###### ==> Once the cloud environment is validated and tested, the business can transition to using the cloud environment for its data and services.

##### Step 8: Decommission on-premises hardware
###### ==> After the transition to the cloud is complete, the business can decommission its on-premises hardware, including servers and storage

#### A hybrid approach
###### - Although there are many valid reasons for hosting a data center on premises or moving entirely to the cloud, many businesses are choosing a hybrid approach
###### - This means a business will host some hardware and software on premises and use the cloud for many other services
###### - Businesses partner with cloud providers to enable a hybrid cloud scenario
###### - This gives them on-premises power and security along with many services and advanced capabilities the cloud provides

***By using a mainframe along with cloud computing, a business can process large amounts of data stored on premises across a hybrid cloud platform. They can also use AI to scale and automate data-driven insights. A hybrid approach enables a business to quickly process critical apps and data in real time, while assessing security risks.***

## MODULE 2: What is cloud development?

### Moving to the cloud

#### Deciding about cloud services
###### - Before businesses can choose a cloud provider, they need to determine which cloud services they want and need
###### - Choosing the right cloud services depends on various factors such as the business’s specific needs, requirements, goals, and budget
###### - Companies identify business needs that the cloud can help meet. Some common needs include: Scalable storage, Collaboration tools, Data analytics, and Security

##### Scalability
###### ==> As the business grows, cloud services should be scalable enough to support growth
###### ==> Companies need to evaluate the cloud services’ scalability before deciding on one

##### Security
###### ==> Companies must choose cloud services that have robust security measures in place to protect data from unauthorized access, hacking, and data breaches.

##### Integration
###### ==> Cloud services should integrate well with a business’s existing software and hardware systems
###### ==> This integration ensures a seamless workflow and easier data transfer.

#### Choosing a provider

##### Cost Effective
###### ==> Cloud services come with different pricing structures, so businesses must consider their budget when choosing a cloud provider
###### ==> Businesses must perform a cost-benefit analysis to determine the most cost-effective cloud services

##### Reliable and reputable
###### ==> Cloud providers must have a high availability of their services and an excellent reputation in the industry
###### ==> The reliability of a cloud service can impact the company’s productivity and revenue.

##### Support System
###### ==> The cloud services provider must have an efficient customer support system that can offer quick solutions to any technical issues.

### Planning for a cloud migration
###### - Your cloud migration plan needs to include the following important tasks to ensure a smooth transition to the cloud

##### Assess the current infrastructure
###### ==> You begin with an evaluation of the company’s current IT infrastructure
###### ==> You identify which systems, applications, and data you want to move to the cloud
###### ==> The evaluation will help the business decide whether to move all systems at once, or use a phased approach

##### Identify the right cloud provider
###### ==> You research different cloud providers to identify which one will best meet the company’s needs. You consider factors such as security, cost, scalability, and availability

##### Choose the right cloud services
###### ==> You choose which cloud services your business needs, such as infrastructure as a service (IaaS), platform as a service (PaaS), or software as a service (SaaS)
###### ==> Your migration plan provides the rationale for the appropriate service that suits the requirements of the business

##### Plan for resources
###### ==> You plan which resources the business will need to migrate and sustain after the migration is complete
###### ==> A cloud deployment needs continual investment, and a resource plan should account for that

##### Develop a migration strategy
###### ==> You include in your plan a detailed, step-by-step process for the migration. The process includes timelines, resources, and potential risks.

##### Train the IT team
###### ==> You complete your migration plan by training your IT team. Before the migration, the team should be familiar with the cloud provider’s console, deployment strategies, and other relevant services
###### ==> This will ensure that your team is trained on cloud technologies and security best practices

#### The 6 Rs
###### - Most major cloud providers have tools and checklists that businesses can use before and during a migration
###### - For instance, the following 6 “Rs” are a helpful way to remember essential parts of a strategy to ensure a successful cloud service migration

##### Rehost
###### ==> Identify any cloud-based systems the business already uses, and the systems that must be cloned and moved to the new cloud provider.

##### Replatform
###### ==> Determine the systems that must be optimized to work more efficiently, save money, and improve security.

##### Refactor
###### ==> Identify applications and services that benefit from cloud capabilities and make appropriate changes to the applications

##### Repurchase
###### ==> Move or replace systems from one service to another, such as from perpetual licenses to SaaS vendors, by repurchasing some more affordable or cost-effective services

##### Retire
###### ==> Determine which applications that the business doesn’t need any more and should be turned off or retired.

##### Retain
###### ==> Identify and retain applications that cannot be migrated for some reason

### Deploying the infrastructure and applications to the cloud

###### - To deploy to the cloud means to migrate or create and configure a set of computing resources, applications, services, and databases in a cloud environment
###### - The cloud environment could be IBM Cloud, Amazon Web Services (AWS), Microsoft Azure, or Google Cloud Platform (GCP)
###### - Deployment involves the creation of virtual machines (VMs), storage, network configurations, security settings, and other resources required to run applications, services, or databases in the cloud

##### Step 1: Design the architecture
###### ==> Design the cloud infrastructure, including the virtual network, security groups, storage accounts, and compute resources
###### ==> This step involves determining the size and configuration of the infrastructure based on the business requirements

##### Step 2: Configure security 
###### ==> Configure security settings, such as firewalls and access control lists (ACLs), to ensure the infrastructure is secure and protected from unauthorized access.

##### Step 3: Create virtual machines and containers
###### ==> Create a virtualized environment using virtual machines (VMs) and containers. These host applications, services, or databases
###### ==> This involves selecting the appropriate operating system and application software as well as configuring network settings

##### Step 4: Set up storage
###### ==> Configure storage options, such as object storage or block storage, to provide storage for data and applications

##### Step 5: Configure network settings
###### ==> Configure network settings, such as subnets, virtual private networks (VPNs), and load balancers, to ensure that the infrastructure is accessible and highly available.

##### Step 6: Deploy Applications
###### ==> Deploy applications, services, or databases to the cloud infrastructure. This might involve migrating data from on-premises infrastructure to the cloud.

##### Step 7: Test and validate infrastructure
###### ==> Test and validate the infrastructure and applications to ensure they are working as expected and meeting the business requirements

##### Step 8: Monitor and manage the infrastructure
###### ==> Monitor the infrastructure and applications for performance and security issues and manage the infrastructure to ensure that it is optimized for performance, cost, and scalability

## MODULE 3: Cloud deployment models

### Deployment models
###### - Cloud deployment models are the ways that cloud computing services are delivered and hosted
###### - The four main types of cloud deployment models are: public, private, hybrid, and community

##### Public Cloud
###### ==> A cloud deployment model where resources are available to anyone over the internet.  
###### ==> The service provider owns and manages the infrastructure, software, and security of the cloud
###### ==> Public clouds are typically cheaper and more scalable than other models, but they might have less control and customization options for users
###### ==> Public clouds are well suited for businesses and individuals that want to use open source software without modifying it

##### Private Cloud
###### ==> A cloud deployment model where resources are available to anyone over the internet.  
###### ==> The service provider owns and manages the infrastructure, software, and security of the cloud
###### ==> Public clouds are typically cheaper and more scalable than other models, but they might have less control and customization options for users. 
###### ==> Public clouds are well suited for businesses and individuals that want to use open source software without modifying it

##### Hybrid Cloud
###### ==> A cloud deployment model that combines public and private clouds
###### ==> The service provider or the organization can choose which resources and applications to run on each cloud based on their needs and preferences 
###### ==> Hybrid clouds are typically more flexible and efficient than other models, but they can have more complexity and security challenges

##### Community Cloud
###### ==> A cloud deployment model where resources are shared by a group of organizations or users with common goals or interests. 
###### ==> The service provider or one of the organizations owns and manages the infrastructure, services, and security of the cloud. 
###### ==> Community clouds are typically more cost-effective and collaborative than other models, but they might have less scalability and availability

### Private and public clouds
###### - A public cloud offers lower costs, scalability, and flexibility. But the company must share resources and infrastructure with other customers, which might pose some risks or limitations.
###### - A private cloud offers more customization, privacy, and compliance. But it also requires more investment, maintenance, and expertise.

### The hybrid cloud
###### - A hybrid cloud deployment is a way of using different types of cloud services together to achieve the best results for a business. For example, a company might use: 
###### - A private cloud for sensitive data and applications. 
###### - A public cloud for scalable and cost-effective resources. 
###### - A third-party cloud for specialized services.

###### - A hybrid cloud deployment requires careful planning and management to ensure compatibility, security, and performance across different environments. 
###### - And a hybrid cloud deployment can offer great advantages to businesses, such as: 
###### - More flexibility and control over their data and applications 
###### - Access to a wider range of features and benefits from different cloud providers 

## MODULE 4: Choosing an appropriate deployment model

### Which model is the best match
###### - Having different cloud deployment model options is an advantage to businesses because they can pick the deployment option that best suits their needs. For example, a business might choose: 
###### - A private deployment that isolates their cloud infrastructure from others. 
###### - A public deployment that shares infrastructure resources, like physical hardware and networking (but not data) with other users. 
###### - A community deployment where businesses pool resources and share them among a specific set of companies. 
###### - A hybrid model that is a combination of public and private deployments


### Choosing a public cloud deployment
###### - A public cloud deployment is a type of cloud computing service where a provider offers resources over the internet to multiple customers
###### - These resources might include servers, storage, networking, software, and applications

##### Time considerations
###### ==> The business needs to launch a new product or service quickly and does not have the time or resources to set up its own infrastructure
###### ==> The public cloud allows the business to deploy an infrastructure relatively quickly with fewer IT resources from within the company

##### Application considerations
###### ==> The business doesn’t have legacy or proprietary applications that require a specialized infrastructure to run
###### ==> While the public cloud can be configured for a variety of application scenarios, it’s best suited for applications that don’t have many dependencies on very specialized hardware and network configurations

##### Cost considerations
###### ==> The business wants to leverage the expertise and innovation of the cloud provider without having to hire IT personnel to manage every detail of their infrastructure.

##### Data considerations
###### ==> The business does not have sensitive or regulated data that requires a high level of control or compliance
###### ==> The public cloud is ideal for data that needs to be kept secure but doesn’t require full visibility and control of the infrastructure that manages it

### Choosing a private cloud deployment
###### - A private cloud deployment is a type of cloud computing where the cloud infrastructure and services are dedicated to a single organization or customer
###### - Unlike a public cloud, where multiple customers share the same resources and services, a private cloud offers more control, security, and customization for the organization

##### High security and compliance needs
###### ==> A private cloud can offer the business more protection for sensitive or confidential data and applications
###### ==> It also helps the business to meet specific regulatory or industry standards

##### High performance and availability needs
###### ==> A private cloud can offer the business more reliability and scalability for mission-critical or demanding workloads
###### ==> It also helps the business to reduce latency and network congestion.

##### High customization and integration needs
###### ==> A private cloud can offer the business more flexibility and control over the configuration and management of the cloud infrastructure and services
###### ==> It also helps the business to integrate with existing systems and applications

### Choosing a hybrid cloud deployment
###### - A hybrid cloud deployment is a mixed computing environment where applications are run using a combination of computing, storage, and services in different environments—public clouds and private clouds
###### - This includes on-premises data centers or edge locations. Edge computing is a way of processing data closer to where it is generated or used, instead of sending it to a central server or cloud

##### Reduce costs
###### ==> A hybrid cloud deployment can help a business optimize its spending by using: 
###### ==> Public cloud services for less sensitive or less critical workloads. 
###### ==> Private cloud services for more sensitive or more critical workloads.
###### ==> The business can avoid paying for unnecessary resources or security measures that they don’t need for every workload

##### Minimize risk
###### ==> A hybrid cloud deployment can help a business mitigate the risks of data breaches, compliance violations, or service outages
###### ==> It does this by keeping some data and applications in a private cloud or on-premises environment that is under its own control and governance.  
###### ==> This means the business can ensure that its data and applications are protected by its own security policies and standards
###### ==> And that it can access them even if the public cloud provider faces any issues

##### Extend capabilities
###### ==> A hybrid cloud deployment can help a business leverage the benefits of both public cloud and private cloud services
###### ==> Benefits such as scalability, agility, innovation, and performance, for example, a hybrid cloud deployment can enable a business to: 
###### ==> scale up or down its resources on demand
###### ==> access new features and services from public cloud providers
###### ==> modernize its on-premises infrastructure with private cloud solutions
###### ==> extend its compute and AI capabilities
