# Introduction to Data Management and Security in the Cloud

## MODULE 1: Importance of security

### Data security in the cloud
###### - When you take a photo on your phone, you might save it to the cloud
###### - This is convenient because it provides an automatic backup of your photos, saves space on your phone, and makes it easier to access your photo from anywhere
###### - However, it also introduces a new possibility of compromising your private information

#### Protecting users and data

##### 1.
###### - Many cloud providers are developing systems to protect data in different ways

###### ==> Some systems encrypt data as it moves over the internet
###### ==> This is known as encryption in transit. For example, messaging apps encrypt messages in transit to prevent anyone else from viewing the messages. 
###### ===> Some systems encrypt data on the storage system itself
###### ==> This is known as encryption at rest. For example, a business might choose to encrypt employee data that they store in the cloud
###### ==> Even if a hacker accesses the data, without the decryption key they won’t be able to read it.

###### - Providers design the systems so that only their tools can decrypt the data

##### 2.
###### - Many devices and websites also use sophisticated methods to find patterns in user behavior
###### - They can alert you if things happen on a device or website that fall outside of those patterns. For example, credit card companies have done this for many years
###### - They assume you will generally use your card in your home area
###### - If suddenly the card is used in another country, the credit card company takes a better-safe-than-sorry approach and alerts you that someone might be fraudulently using your card

##### 3.
###### - Computer systems also watch for the same type of behaviors
###### - Suppose you generally log in to a website from a specific geographical location like from your home. The website keeps track of this
###### - If the website detects someone trying to log in using your details from another part of your country, it can alert you by email or text message and ask you to confirm whether it’s actually you
###### - This type of alert can save users and the website operators from serious problems

##### 4.
###### - When you want to protect your personal computer, you might install a virus scanner or a firewall
###### - Websites need similar protection, too. People with malicious intent might try to steal data or cause a website to fail
###### - For example, a denial of service (DoS) attack attempts to overload a website by sending an enormous amount of fake requests to it
###### - While responding to all the fake requests, the website can’t respond to the real requests from its users
###### - Cloud services include tools that engineers can use to keep their services safe from different types of attacks. These tools can include the following.

###### ==> Prevention tools detect DoS attacks and then either prevent the fake requests from reaching the website or alert the cloud engineer about the attack so they can respond.

###### ==> Monitoring tools examine the status of web services. Cloud engineers use them to view every aspect of their cloud service so they can detect if anything is under attack. Many cloud services offer a dashboard cloud engineers can customize to quickly see all essential data about their cloud service.

###### ==> Development tools that web developers use to create websites have built-in features that can alert cloud engineers about problems with their code that could cause security issues


### Complying with security regulations
##### Assess
###### ==> conduct a risk assessment to identify and prioritize the potential threats and vulnerabilities in the cloud environment

##### Control
###### ==> Implement appropriate security controls to protect the data and systems from unauthorized access, modification, or destruction
###### ==> These measures might include encryption, authentication, authorization, firewall, antivirus, and backup.

##### Monitor
###### ==> Test and monitor the security performance and compliance status of the cloud-based solutions regularly. Promptly address any issues or gaps.

##### Educate
###### ==> Educate and train staff and users on the security policies and procedures and ensure their adherence.

##### Review
###### ==> Review and update the security regulations and practices as needed to keep up with the changing technology and environment


## MODULE 2: Cloud-based security vulnerabilities

### Types of cloud vulnerabilities
###### - A vulnerability in a cloud-based service is a weakness or flaw in its security
###### - Threat actors exploit vulnerabilities in software in several ways, called attack vectors
###### - An attack vector in cloud security is a way that cybercriminals can access or damage cloud data or applications 
###### - For example, threat actors can use stolen or compromised credentials to log in to cloud accounts and launch attacks
###### - It’s important for cloud engineers to be prepared for attack vectors
###### - Here are some of the types of vulnerabilities to avoid when businesses develop cloud services

##### Misconfiguration
###### ==> One of the main vulnerabilities in cloud services is misconfiguration
###### ==> Misconfiguration is when the settings and options of the cloud service are not properly adjusted to match the security needs of the cloud engineer
###### ==> For example, if the cloud engineer grants too much access to a data storage service, it might expose sensitive information to unauthorized parties
###### ==> Or if the cloud engineer doesn’t enable encryption or backup for their data, it might be lost or corrupted when an attack occurs
###### ==> To prevent misconfiguration, engineers should follow the best practices and guidelines provided by their cloud service provider, and use tools to scan and detect any potential issues

##### Poor access management
###### ==> Another vulnerability in cloud services is poor access management
###### ==> This refers to the lack of proper authentication and authorization mechanisms for users and services that access the cloud resources
###### ==> For example, if a cloud engineer doesn’t use strong passwords or multifactor authentication for their service, they might make their users vulnerable to phishing or brute force attacks that can compromise their accounts
###### ==> Phishing attacks are attempts to trick users into revealing personal information like passwords or credit card details
###### ==> And in brute force attacks, hackers repeatedly submit different passwords in the hope of eventually using the correct one
###### ==> Cloud engineers should also implement the principle of least privilege, which means giving only the minimum access required for a specific task or role
###### ==> Not doing so can create unnecessary exposure for their data and applications.  
###### ==> To improve access control, cloud engineers should use secure methods of identification and verification, and regularly review and update their access policies

##### Insecure APIs
###### ==> Another vulnerability in cloud services is insecure APIs
###### ==> APIs are interfaces that allow different applications and services to communicate and exchange data with each other
###### ==> They are essential for cloud services to function properly
###### ==> However, they can introduce security risks if cloud engineers don’t design and implement them securely
###### ==> For example, if the API doesn’t validate the input and output data, it might allow applications to execute malicious code or commands on the cloud service
###### ==> And if the API doesn’t encrypt or protect the data in transit, it might expose the data to interception or modification by attackers
###### ==> To secure APIs, cloud engineers should follow the standards and best practices for API development and testing
###### ==> They should also use encryption and authentication techniques to protect their data

##### System vulnerabilities
###### ==> Another vulnerability in cloud services is system vulnerabilities
###### ==> These are flaws or weaknesses in the software or hardware components of the cloud service platform that attackers can exploit to compromise its security
###### ==> For example, if the cloud service provider doesn’t apply patches or updates regularly, it might leave their system vulnerable to known exploits
###### ==> And if the cloud service provider doesn’t isolate or segregate their resources properly, an attacker might be able to access other users’ data or applications.  
###### ==> To mitigate system vulnerabilities, cloud engineers should choose a reputable and reliable cloud service provider that follows industry standards and best practices for security management and maintenance

##### Lack of monitoring
###### ==> Another vulnerability is lack of monitoring
###### ==> This means that a cloud service does not keep track of or provide alerts on its activities and events, such as who accessed what data and when
###### ==> Without logging and monitoring, threat attackers might be able to perform malicious actions without being detected or traced

### Ways to mitigate vulnerabilities
###### - Cloud security is a critical concern for businesses and organizations that use cloud computing to store and process their data
###### - Cloud engineers follow several key approaches to help mitigate cloud vulnerabilities and protect company data from attacks. These approaches include: The shared responsibility model, The defense in depth strategy, The principle of least privilege, and Patching and updating

##### Shared responsibility model
###### ==> One of the most important principles for cloud security is to follow the shared responsibility model
###### ==> This means that both the cloud service provider (CSP) and the cloud customer have roles and responsibilities for securing the cloud platform
###### ==> The CSP is responsible for securing the infrastructure, such as the physical servers, networks, and hardware
###### ==> The cloud customer is responsible for securing the data, applications, and access in their cloud environment
###### ==> For example, the cloud customer should encrypt their data at rest and in transit, use strong passwords and multifactor authentication (MFA) for user accounts, and configure access policies and permissions for different roles and resources

##### Defense in depth strategy
###### ==> Another approach for cloud security is to adopt a defense in depth strategy
###### ==> This means that cloud engineers should implement multiple layers of security controls to protect the cloud platform from different types of attacks
###### ==> For example, a defense in depth strategy might include firewalls, intrusion detection and prevention systems (IDS/IPS), antivirus software, web application firewalls (WAF), encryption, backup and recovery solutions, vulnerability scanning tools, and security monitoring tools
###### ==> By using a defense in depth strategy, cloud engineers can reduce the attack surface and increase the chances of detecting and preventing an attack

##### Principle of least privilege
###### ==> Another approach for cloud security is to follow the principle of least privilege
###### ==> This means that users and applications should only have the minimum level of access and permissions that they need to perform their tasks
###### ==> By following this principle, cloud engineers can limit the potential damage that an attacker can cause if they compromise a user account or an application
###### ==> For example, a user who only needs to read data from a database should not have write or delete permissions on that database
###### ==> Similarly, an application that only needs to access a specific resource should not have access to other resources that are not relevant to its function

##### Patching and updating
###### ==> Patching and updating are processes of applying fixes or improvements to software or systems that have known problems or vulnerabilities
###### ==> These problems or vulnerabilities can affect the performance, functionality, or security of the cloud services
###### ==> Threat actors can exploit unpatched software to access or damage data stored on the cloud
###### ==> For example, when a cloud engineer applies a security patch to a web server that hosts a website on the cloud, the security patch might fix a vulnerability that could allow hackers to inject malicious code into the website
###### ==> By applying the patch, the cloud engineer prevents hackers from exploiting the vulnerability and compromising the website or its visitors


## MODULE 3: Identity and access management

### Accessing systems and resources

#### Gaining access to a system

##### Authentication
###### ==> Authentication (AuthN) is a security measure that strengthens access points.  
###### ==> Authentication allows only appropriate people or systems to enter a network and keeps others out.  
###### ==> Lock screens provide an authentication service that allows only people with valid usernames and passwords to access a device
###### ==> Devices also can authenticate users with other methods such as fingerprints, facial recognition, voice prints, and even retinal scans

##### Authorization
###### ==> Authorization (AuthZ) provides access to resources within a system.  
###### ==> While authentication allows or prevents a user (or another system) from accessing a device or a system, authorization gives or denies them permission to use certain resources after the device or system authenticates them


### Zero Trust, Fully Secure
###### - The zero trust model is a way of securing modern organizations by removing the assumption of trust and enforcing strict verification and authorization
###### - In this model, every user, device, and component is considered untrusted at all times, regardless of whether they are inside or outside of an organization’s network
###### - The zero trust model is designed to adapt to the complexities of the cloud environment, where data and applications can be accessed from anywhere and by anyone
###### - The zero trust model is based on three main principles

##### Verify explicitly
###### ==> the services must authenticate and authorize every access request based on multiple factors, such as identify, location, device health, and data sensitivity

##### Use least privilege access
###### ==> users and devices should only have the minimum level of access they need to perform their tasks, and that they should only gain access for a limited time and under certain conditions

##### Assume breach
###### ==> design security measures to minimize the impact of a potential attack
###### ==> do this by encrypting data, segmenting networks, and monitoring for anomalies

#### The purpose of the zero trust model
###### - The zero trust model can help organizations to: Improve their security, Enable digital transformation, Empower productivity, Comply with regulations, Reduce costs and complexity
###### - However, implementing the zero trust model requires a strategic approach that covers six key elements: identities, devices, applications, data, networks, and infrastructure.

##### Identities
###### ==> This element focuses on verifying the identity of every user before granting access to resources
###### ==> Administrators can do this by using multifactor authentication and identity management solutions.

##### Devices
###### ==> This element focuses on ensuring that only secure and compliant devices can access resources
###### ==> Administrators can use device management and endpoint security solutions to implement this

##### Applications
###### ==> This element focuses on securing the applications that users access
###### ==> Administrators can use application security and access control solutions for this

##### Data
###### ==> This element focuses on protecting the data that users access and share
###### ==> Administrators use data encryption and data loss prevention solutions to protect data

##### Networks
###### ==> This element focuses on securing the networks that connect users to resources
###### ==> Administrators can secure networks by using network segmentation and network security solutions

##### Infrastructure
###### ==> This element focuses on securing the underlying infrastructure that supports the organization’s operations
###### ==> Administrators use infrastructure security and compliance solutions to secure this


## MODULE 4: Databases and DBaaS

### Delivering databse services on the cloud
###### - Databases exist to keep all that information organized and to efficiently and securely deliver it to the destinations that need it

###### - Database as a service (DBaaS) is a way of storing and managing data online without having to worry about the technical details
###### - Instead of buying, installing, and maintaining database software and hardware, businesses use a DBaaS provider that offers these services for a fee
###### - A DBaaS provider is like a landlord who rents out apartments to tenants
###### - Tenants can choose the size, location, and features of their apartment, but they don’t have to deal with the maintenance, security, or utilities
###### - the landlord takes care of all that for them

#### Benefits of using DBaaS
##### Cost savings
###### ==> busineeses only pay for what they use and don't have to invest in expensive hardware and software

##### Flexibility
###### ==> businesses can scale their databse resources up or down as their demand changes

##### Availability
###### ==> users can access the databse anytime and anywhere with an internet connection

##### Security
###### ==> data is encrypted and protected by the provider's security measures

##### Reliability
###### ==> data is abcked up and replicated by the provider to ensure high availability and disaster recovery

### Managing databases with DBaaS
###### - Database management is the process of creating, maintaining, and securing databases
###### - Databases are collections of organized data that are stored in a way that makes them easy to access and manipulate
###### - Database management can be challenging and time-consuming, especially for large and complex databases that require specialized skills and software

### Securing databases with DBaaS
###### - Cloud services that provide DBaaS have made database security a top priority
###### - When a business chooses to move its data from servers housed on premises, they must ensure their cloud provider will prioritize the security of their data as much as they do themselves

###### - One key difference between on-premises and DBaaS security is that with on-premises, a company has more control over their security protocols and can customize them to their specific needs.

###### - With DBaaS, the provider handles most of the security details, which can be both a convenience and a potential concern
###### - However, DBaaS providers typically have advanced security measures in place, including encryption, backup and recovery, and access control, which might be harder for a business to implement themselves due to cost and complexity

###### - Another difference is that with on-premises, the company is responsible for maintaining and updating their own security measures
###### - With DBaaS, the provider takes care of most of the maintenance and updates, which can free up resources for other tasks
###### - However, companies also must trust that the provider is keeping up with the latest security measures and responding to new threats in a timely manner

#### Security features of DBaaS
###### - Cloud databases have many of the same security features that on-premises databases provide
###### - However, DBaaS has an advantage over on-premises databases in that most of the security features are built in and managed for the user
###### - Further, cloud providers manage continual improvements and updates so the risk of security gaps lessens over timE

##### Encryption
###### ==> One of the main security features of DBaaS is encryption
###### ==> Encryption is a process of transforming data into a secret code that only authorized parties can read
###### ==> DBaaS providers use encryption to protect data when storing it on their servers and when transferring it over the internet
###### ==> This means that even if someone manages to access the data, they will not be able to understand it without the proper key

##### Backup and Recovery
###### ==> Backup and recovery are methods of saving copies of data and restoring them in case of a disaster
###### ==> DBaaS providers offer backup and recovery services that automatically create and store backups of data on multiple locations and devices
###### ==> This means that businesses don’t have to worry about losing their data due to hardware failure, human error, natural disaster, or cyberattack

##### Access Control
###### ==> Access control is a way of limiting who can access the data and what they can do with it
###### ==> DBaaS providers offer access control tools that allow you to set permissions and roles for different users and groups
###### ==> This means that businesses can control who can view, edit, delete, or share their data, and track their activities


## MODULE 5: Data governance and data compliance

### Managing data in the cloud
| Data governance is the collection of processes, policies, roles, metrics, and standards that ensures an effective and efficient use of information in the cloud. It helps to ensure that data is clean, accurate, secure, and available for authorized users. Data governance also helps to establish data management practices that align with the organization’s goals and comply with external regulations. | Data compliance is the adherence to the rules and regulations that apply to the data in the cloud. These may include industry standards, government laws, contractual obligations, or ethical principles. It helps to protect the data from unauthorized access, misuse, or loss. Compliance also helps to avoid legal risks and reputational damage that may result from data breaches or violations. |
| -- | -- |

***Data governance and data compliance are critical for cloud computing because they enable companies to take advantage of the benefits of the cloud while minimizing the risks. By implementing a data governance and compliance framework, companies can ensure that their data is well-managed and protected in the cloud.***


### Cloud support for data governance and compliance
###### - Cloud service providers offer different levels of support for data governance and data compliance depending on the type of service they offer and the contract they have with the customer
###### - Here are some of the common ways that cloud service providers support data governance and data compliance
###### - Certifying their compliance 
###### - Providing tools and documentation for customers 
###### - Collaborating with customers and regulators

##### Certifying compliance
###### ==> Cloud service providers often provide certificates that demonstrate their compliance with various standards and frameworks
###### ==> One type in the US is the Federal Risk and Authorization Management Program (FedRAMP), which provides guidance for how federal agencies should use cloud services

##### Providing tools
###### ==> Cloud service providers offer tools and features that help customers to manage their data
###### ==> These might include tools for encryption, backup, recovery, access control, logging, and auditing

##### Providing documentation
###### ==> Cloud service providers usually share documentation and guidance that helps customers understand their roles and responsibilities in data governance and compliance
###### ==> Documentation might include service level agreements (SLAs), terms of service (TOS), and privacy policies

##### Collaborating
###### ==> Cloud service providers collaborate with customers and regulators to address issues or requests related to data governance and data compliance
###### ==> These might include data subject requests (DSRs), data breach notifications, and audits

#### Cloud security tools that support governance and compliance

###### - Cloud security tools are software or services that help businesses protect their data and applications in the cloud
###### - Cloud security tools can also help businesses to manage data governance and data compliance

##### Encryption
###### ==> Encryption is the process of transforming data into a secret code that only authorized parties can read
###### ==> Encryption can protect data at rest (stored in the cloud) or in transit (moving between the cloud and the user)
###### ==> Most cloud providers offer encryption for both data at rest and data in transit, using industry-standard algorithms and protocols

##### Key management
###### ==> Key management is the process of creating, storing, and managing the keys or passwords used to encrypt and decrypt data
###### ==> Key management is essential for ensuring that only authorized parties can access the encrypted data
###### ==> Key management services can allow businesses to create and manage their own encryption keys, or use the cloud provider’s managed keys

##### Identity and access management (IAM)
###### ==> IAM is the process of defining and enforcing who can access what resources in the cloud, and under what conditions
###### ==> IAM can help businesses control and monitor the access of their employees, customers, partners, and vendors to their cloud data and applications
###### ==> Cloud providers offer IAM services that allow businesses to create and manage user accounts, roles, permissions, policies, and multifactor authentication

##### Data loss prevention (DLP)
###### ==> DLP is the process of detecting and preventing the unauthorized exposure or leakage of sensitive data from the cloud
###### ==> DLP can help businesses comply with data privacy and security regulations, such as GDPR and HIPAA
###### ==> DLP services allow businesses to scan, classify, and monitor their cloud data for potential risks and violations

##### Security information and event management (SIEM)
###### ==> SIEM is the process of collecting, analyzing, and correlating security-related data from various sources in the cloud, such as logs, alerts, events, and incidents
###### ==> SIEM can help businesses detect and respond to cyberattacks, breaches, or anomalies in their cloud environment


## MODULE 6: You're a cloud security analyst

### Your new cloud security analyst role

##### Your role
###### ==> your entry-level role is to provide general support for other cloud security analysts to protect your global company resources on the cloud

##### Your customers
###### ==> your department focuses on creating and delivering internal company software and services using the cloud

##### Your area
###### ==> you work alongside security and databse experts to assist them in their work

#### Assignment
###### - Your first task is to assist a senior cloud security analyst to create an IBM Cloudant data resource on IBM Cloud
###### - Cloudant databases are ideal for web, mobile, and serverless cloud applications and the development team requested this type of database from your team
###### - You’ll then use the IBM Security and Compliance tool to create a security profile for the IBM Cloudant resource and test it to ensure it meets the security requirements of your organization

#### The toolkit
###### - As a cloud security analyst, you will use a variety of tools depending on the task
###### - For this project scenario, you’ll use the interface from your company’s cloud provider, IBM Cloud, to interact with the cloud services

#### the skills to apply

##### Technical skills
###### ==> deploy an IBM Cloudant databse
###### ==> create a security profile on the IBM Security and Compliance tool
###### ==> run the IBM Security and Compliance tool

##### Testing skills
###### ==> review the security settings for the database
###### ==> evaluate the results of the tests performed by the IBM Security and Compliance tool

### Your first project

#### Purpose of the project
###### - The software development team in your company needs a secure database in which to store sensitive customer data and they’ve asked your team to deploy it
###### - In addition to creating the database for the team, you’ve been tasked with ensuring that the database is set up in the most secure way possible before handing it off to the development team

#### Your scope of work
###### - The senior security analyst decides to use an IBM Cloudant cloud database for this purpose
###### - He’s asked you to help deploy the database and then create a security profile on the IBM Security and Compliance tool against which you’ll test your newly-created database
###### - You’ll then review the results of the test which the senior cloud analyst will use to make further decisions. The process works as follows
###### - You’ll create an IBM Cloudant data resource on IBM Cloud
###### - You’ll set up a cloud object storage instance to hold the results of the security test you’ll run 
###### - You’ll create a profile in the IBM Security and Compliance tool which will run a set of security tests on the IBM Cloudant database
###### - You’ll review the result of the test so you can call out any issues to the senior cloud security analyst


### Simulation: Secure an IBM Cloudant database

##### Step 1
###### ==> the first step is to create an IBM Cloudant database on IBM Cloud
###### ==> Cloudant databses are ideal for web, mobile, and serverless cloud applications and the development team requested this type of databse from your team
###### ==> change the name in the Instance name field to "usr-cldnt-database" and leave all other values as their defaults
###### ==> select the create button to create the database
![Image](https://github.com/user-attachments/assets/ec93a7a3-8800-4f90-817f-99deca8802eb)

##### Step 2
###### ==> the next step is to prepare for the security check
###### ==> since the databse will be storing user information, your team needs to ensure that its using excryption and a secure authentication method
###### ==> first, you will perform a visual check of the database settings
![Image](https://github.com/user-attachments/assets/9e34f805-8a38-4d7c-9509-9fc79b9cde1b)

###### ==> under the Name column, select the usr-cldnt-database from the list of databases
![Image](https://github.com/user-attachments/assets/07ab4f43-f8ee-40e1-914d-5535c1dd8e54)

###### ==> verify the two settings to ensure the database is secure
###### ==> notice that the Authentication methods is using IBM Cloud IAM
###### ==> this ensures that only authorized users can access the database
###### ==> also notice that Disk encryption is set to Yes, which ensures that the data in the database is securely stored and transported

##### Step 3
###### ==> the next task is to create a cloud object storage instance
###### ==> to store the results from the compliance and security tests you'll be runningm you need to set up this object storage service
###### ==> this type of storage is best for files and other unstructured data
###### ==> you find the Cloud Object Storage service in the IBM catalog
###### ==> notice that you're creating this storage on IBM Cloud, but its possible to use object storage from an on-premises source or even from another cloud provider
![Image](https://github.com/user-attachments/assets/319b14e6-6e7e-4b4e-a9ba-d0d520ed3591)

###### ==> you've created the cloud object

##### Step 4
###### ==> now you need to create a bucket to store any files that will be put in object storage
###### ==> for this project, the result of your security test will be stored here
###### ==> select the Create Bucket button
![Image](https://github.com/user-attachments/assets/815800fa-2639-405c-aa1d-f896441415b8)

##### Step 5
###### ==> you can use a predefined bucket for this project
###### ==> using this option will optimize the bucket type for you, so you don't have to configure a lot of options
###### ==> under the Predefined beckets section, select the arrow in the Quickly get started block
![Image](https://github.com/user-attachments/assets/35d5c55e-44c7-41ac-b20d-6dfe8e703637)

###### ==> you can leave the default bucket name as it is, select the Next button
![Image](https://github.com/user-attachments/assets/8bdb0402-ae48-4926-8631-23b4a1415c5b)

###### ==> since you're not uploading files at this point, you can just create your bucket, select the View bucket configuration button
![Image](https://github.com/user-attachments/assets/4a2e2f3a-f184-4b7d-82bc-ac7d4ff6eaf2)

##### Step 6
###### ==> you have created the cloud object storage and tells you that you're now ready to create the Cloudant tests and store them in the cloud object storage you just created
![Image](https://github.com/user-attachments/assets/e1bab264-def8-4ae7-9481-0a86c168cdc0)

###### ==> you're ready to create some tests that you can run against the IBM Cloudant database to make sure its ready for the development team
###### ==> the Security and Compliance page that the service enables you to create a control that will run specific tests against services on IBM Cloud
###### ==> start by creating a control library that will store the controls
###### ==> a control is similar to a policy in that it defines the security measures your organization requires
###### ==> under Controls select Control libraries
![Image](https://github.com/user-attachments/assets/4dff1bd9-eff5-4592-a809-b7938e22b43d)

##### Step 7
###### ==> create a new control library that will store the IBM Cloudant controls
###### ==> open the Control libraries menu item so you can create a new control library, select the Create button
![Image](https://github.com/user-attachments/assets/f4e016d0-a678-4fd7-a3f3-a0297c0cd16f)

##### Step 8
###### ==> name the control library, by writing "Cloudant Database Controls" in the name field
![Image](https://github.com/user-attachments/assets/66f1602c-68bc-4942-98bc-5e951188fcaa)

###### ==> you created the control libary
###### ==> the control library needs assessments, the actual tests the tool will perform against the database
###### ==> create a new control called Cloudant developer control
![Image](https://github.com/user-attachments/assets/370f23fb-b1b2-41e6-adda-9ad782088c4f)

##### Step 9
###### ==> examine each of the Cloudant control assessments
###### ==> notice that two of them are related to secure communication
###### ==> the last one in the list is related to a specific type of encryption that corporations use when they want to tightly control particular areas of their security
![Image](https://github.com/user-attachments/assets/cf976f89-f61d-475c-b8c9-93c7d15058f9)

###### ==> you'll run the IBM Cloudant tests that will check that the database is enabled with encryption and is accessible only through HTTPS, which is a secure way to send data over the internet
###### ==> select the checkboxes for Check whether Cloudant is enabled with encryption and Check whether Cloudant is accessible only through TLS 1.2 or higher and select Create

##### Step 10
###### ==> now that you've added the assessments, you can create the control
###### ==> on the Create a control page, select Create
![Image](https://github.com/user-attachments/assets/bee8dc29-5b64-4e80-a15a-7a026dccb6d0)

##### Step 11
###### ==> in order to run the tests, the Security and Compliance service needs a profile under which to run
![Image](https://github.com/user-attachments/assets/535f5ccf-7e0a-4ace-b019-3348c559c6db)

##### Step 12
###### ==> the profile is set up, now its time to create an assessment
###### ==> an assessment is joining a profile to a set of assessments
###### ==> once you join a profile with assessments, the IBM Cloudant tests will run and you can view the results, select Create
![Image](https://github.com/user-attachments/assets/c038c1c3-cac3-4514-9d71-3878dcfa9c28)

##### Step 13
###### ==> on the Profile and scope page, you need to select a scope that includes the IBM Cloudant database you created earlier
###### ==> you'll use the default scope for this project
###### ==> under Scope, select Default from the drop down menu, and then select the Next button
![Image](https://github.com/user-attachments/assets/4d88141a-922a-4718-9429-815f055ada69)

###### ==> this is the parameters page, there aren't any parameters that you need to set or edit for this assessment
![Image](https://github.com/user-attachments/assets/c4832649-38cc-4c8d-bfad-db25e41ae51d)

###### ==> here is the Scan Settings page, you can leave the scan settings to their defaults
###### ==> the scan setting defaults will run a scan on your IBM Cloudant database once every day and show you a report
###### ==> this will help you know if something critical has changed on your database that might compromise the data in it
###### ==> you'll be able to see the results in the Security and Compliance dashboard
![Image](https://github.com/user-attachments/assets/31bd95e1-1d2e-4c99-8d18-13cb2830d7ae)

##### Step 14
###### ==> this is the Review page
###### ==> create the attachment that will start the scan
###### ==> after the scan runs, the tool will create a file that stores the result of the tests and place it in the object storage bucket you created in a previous step
![Image](https://github.com/user-attachments/assets/f76927b4-4253-4e23-a0f1-aa8b745ec1bd)

###### ==> your scan is successful, review the results
###### ==> notice the green check marks next to each of the assessments, this means your IBM Cloudant database passed the tests
![Image](https://github.com/user-attachments/assets/5f3d8a48-565a-447c-b6e8-e0c07c78ed8b)

###### ==> you have successfully created a secure IBM Cloudant database
###### ==> you reviewed the settings on the database that showed that the database is secure
###### ==> you then created controls that test the database to assess that the database uses the HTTPS protocol and that is encrypted
###### ==> you attached a profile to these controls that regularly tests the database to ensure nothing has changed

