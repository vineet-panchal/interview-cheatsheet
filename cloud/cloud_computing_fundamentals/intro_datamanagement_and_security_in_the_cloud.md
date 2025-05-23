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

