### [Link layer node tool](#link-layer-node-tool)

This opens a list of link-layer (L2) nodes available for use:

  * LAN switch node
  * Hub node
  * External interface node
  * RSTP switch node (FreeBSD only)
  * Filter node (FreeBSD only)
  * Packet generator node (FreeBSD only)

**NOTE**: It is not possible to execute node types with red background on the current architecture.

#### [LAN switch node](#lan-switch-node)

A link layer element that forwards incoming packets to connected nodes using the table of destination addresses and its ports.

#### [Hub node](#hub-node)

A link layer element that forwards every incoming packet to all of its ports and, thus, to every connected node.

#### [External interface node](#external-interface-node)

A tool that provides the possibility to connect a virtual node with the physical interface (e.g. to give the node the access to the Internet).

#### [RSTP switch node](#rstp-switch-node)

A Rapid Spanning Tree Protocol switch that can prevent bridge loops and allow providing backup links if an active link fails. (FreeBSD only)

#### [Filter node](#filter-node)

A link layer element that can filter/divert/forward packets depending on their content. (FreeBSD only)

#### [Packet generator node](#packet-generator-node)

A link layer element to craft custom packets and send them with given packet rate. (FreeBSD only)

