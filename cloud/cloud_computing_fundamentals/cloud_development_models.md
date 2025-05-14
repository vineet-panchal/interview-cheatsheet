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


