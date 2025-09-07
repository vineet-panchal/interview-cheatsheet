# Agile Development and Scrum Introduction

## The Waterfall Model
The Waterfall Model is a linear and sequential approach to software development.

**Requirements Analysis -> System Design --> Code --> Integration --> Testing --> Deployment --> Maintenance**

While it provides a structured approach, it has several limitations:
- Inflexibility to changes in requirements once the project is underway.
- Late discovery of issues, as testing occurs only after the development phase.
- Limited customer involvement, which can lead to misalignment with user needs.
- Delays in delivery, as the entire project must be completed before any part is delivered to the customer.
- Risk of project failure if initial requirements are misunderstood or incomplete.
- Lack of iterative feedback, which can result in a product that does not meet user expectations.
- Challenges in accommodating evolving technologies and market conditions.
- Difficulty in managing complex projects with interdependent components.
- Potential for increased costs and time overruns due to the rigid structure.

## Agile Methodologies
Agile methodologies prioritize flexibility, collaboration, and customer satisfaction in software development. They promote iterative development, where requirements and solutions evolve through the collaborative effort of cross-functional teams.

## Agile Software Development Manifesto
We are uncovering better ways of developing software by doing it and helping others do it. Through this work we have come to value:
- **Individuals and interactions** over processes and tools
- **Working software** over comprehensive documentation
- **Customer collaboration** over contract negotiation
- **Responding to change** over following a plan
That is, while there is value in the items on the right, we value the items on the left more.

## Customer's Bill of Rights
- to set objectives for the project and have them followed
- to know how long the software project will take and how much it will cost
- to decide which features are in and which are out of the software
- to know the project's status at any time during the development
- to make reasonable changes to requirements throughout the project and to know the costs of making the changes
- to be apprised reqularly of the risks that could affect cost, schedule, or quality
- to have ready access to project deliverables throughout the project

## Developer's Bill of Rights
- to know the project objectives and to be able to clarify priorities
- to know in detail the project that is supposed to be built
- to have ready access to the customer, manager, marketer, or any other person responsible for the functionality
- to work each phase of the project in a technically responsible way
- to approve effort and schedule estimates for any work that you will be asked to perform
- to work in a productive environment free from frequent (and unnecessary) interruptions

## The Essence of Agile: Fast Reaction, and Small, Incremental Releases
Deliver real business value on a very short cycle
- business value delivered sooner
- increased customer confidence
- sense of accomplishment in the development team
- reduced risk for the project
- rapid feedback from customers
- rapid reaction to any changes in the requirements

## Every Project has Four "Control" Variables
Four Variables
- scope is how much to be done
- resources are how many people are available
- time is when the project or release will be done
- quality is how good the software will be and how well tested it will be

External forces get to pick the values of any three...
The development team picks the value of the fourth

## Visibility
- the values of all four variables need to be "visible"
- if stakeholders (e.g., customers, management) can see all four variables they can consciously choose which variables to control 
- if they do not like the resulting value of the fourth variable, they can choose to change the inputs or choose to control a different set of three
- agile approaches argue that "scope" is the most important of the four control variables as we have the most control over it
- time and resources are usually beyond our control, and so is quality - most of the time
- hence, by adjusting project scope based on the values of the other three, you increase your change of success
- thus agile methodologies were born: XP, Scrum, Adaptive Software Development, Crystal Methodologies

## Scrum
- Scrum divides the project into fixed or variable size iterations called Sprints
- Each Sprint features a complete development cycle
<img width="566" height="324" alt="Image" src="https://github.com/user-attachments/assets/52879193-27c5-4076-902f-1d8e47a27c71" />

## Scrum Sprints
- complete development: yes, but for a limited number of requirements or features

Short duration of each Sprint means that
- any changes in the requirements can be dealt with pretty quickly, and without the need to restart the entire process
- any estimates will be much more accurate due to reduced time horizon
- the development team can deliver a working increment after each Sprint

While a single Scrum team may be small, Sprints can be undertaken in parallel in order to increase productivity

## Scrum Flow
- First, a Sprint Planning Meeting: define Sprint Backlog, make estimates, assign tasks
- Sprint: typically, a thirty-day development, with Daily Scrums
- In the end, Sprint Review Meeting, followed (optionally) by Sprint Retrospective Meeting

<img width="342" height="468" alt="Image" src="https://github.com/user-attachments/assets/1940e39c-d6c2-447d-9464-1e3954103840" />

## Backlogs
- Product Backlog: requirements which will be implemented in the current Sprint
- These are prioritized (by the customers), estimated (by the developers), and a subset to be implemented in the Sprint is moved to the Sprint Backlog
- New requirements can be added to the Product Backlog at any time
- Unfinished items from a previous Sprint are also there
- Sprint Backlog: requirements which will be implemented in the current Sprint
- During the Sprint, there can be no changes to the Sprint Backlog

## Pre-Game Phase (architecture)
- the high level design of the system - including its architecture, is planned based on the current items in the Product Backlog
- if the project is an enchancement of an existing system, the changes needed for implementing the Backlog items are identified, along with the problems they may cause (risk analysis)
- a design review meeting is held to review the proposals for the implementation, and decisions are made on the basis of this review
- preliminary plans for individual releases are prepared

## Post-Game Phase
- Post-game: in effect, the closure of the release - this phase is entered when we all agree that the requirements are complete: no more items and issues can be found, no new ones can be invented
- the system is ready for release and various preparation activities are performed: integration, system testing, documentation (among others)

## Roles In The Development Team

#### Scrum Master
- interacts with the project team as well as with the customer and the management, responsible for ensuring that the project is carried through, and for removal of any impediments so as to keep the team working as productively as possible

#### Product Owner
- officially responsible for the project, managing, controlling, and making visible the Product Backlog list

#### Scrum Team
- the project team with the authority to decide on the necessary actions in order to achieve the goals of each Sprint; they are involved in effort estimation, creation of the Sprint Backlog, reviews of the Product Backlog
