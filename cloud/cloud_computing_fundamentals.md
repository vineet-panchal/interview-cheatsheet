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