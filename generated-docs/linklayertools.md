
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

A link layer node that forwards incoming packets to connected nodes using the table of destination addresses and its ports.

#### [Hub node](#hub-node)

A link layer node that forwards every incoming packet to all of its ports and, thus, to every connected node.

#### [External interface node](#external-interface-node)

A tool that connects a virtual node to a physical network interface on the host computer, allowing the experiment to communicate with external networks (e.g., to provide Internet access).

The selected host interface is typically 'stolen' from the host OS and assigned to the experiment. For direct links, the interface is handled differently depending on the operating system: on Linux, a `macvlan` or `ipvlan` interface may be created instead.

For details on interface handling for normal and direct links on FreeBSD and Linux, see the documentation section [Configure External interface](#configure-external-interface).

#### [RSTP switch node](#rstp-switch-node)

A Rapid Spanning Tree Protocol switch that can prevent bridge loops and allow providing backup links if an active link fails. (FreeBSD only)

#### [Filter node](#filter-node)

A link layer node that can filter/divert/forward packets depending on their content. (FreeBSD only)

#### [Packet generator node](#packet-generator-node)

A link layer node to craft custom packets and send them with given packet rate. (FreeBSD only)
