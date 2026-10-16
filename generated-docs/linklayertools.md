
### [Link-Layer Nodes](#link-layer-nodes)

Link-layer (L2) nodes available for use:

  * [LAN Switch Node](#lan-switch-node)
  * [Hub Node](#hub-node)
  * [External Interface Node](#external-interface-node)
  * [RSTP Switch Node (FreeBSD only)](#rstp-switch-node)
  * [Filter Node (FreeBSD only)](#filter-node)
  * [Packet Generator Node (FreeBSD only)](#packet-generator-node)

Nodes of all supported platform types can be added to a topology, regardless of the platform on which IMUNES is currently running. Nodes that are incompatible with the current platform are displayed with a different background in the toolbox and marked with the **DISABLED** label on the canvas. These nodes will not be started when the experiment begins.

#### [LAN Switch Node](#lan-switch-node)

The LAN switch node behaves like a standard Layer 2 switch, forwarding incoming packets to connected nodes based on destination MAC addresses and its forwarding table. The switch maintains its own MAC address forwarding table and supports configuring ports in *trunk* or *access* mode, including VLAN tagging.

The LAN switch node is implemented using the FreeBSD `ng_bridge` Netgraph node or the Linux in-kernel `bridge` subsystem. Since `ng_bridge` does not support VLAN management, IMUNES combines `ng_bridge` and `ng_vlan` Netgraph nodes to separate VLAN domains on FreeBSD. On Linux, the `bridge` subsystem supports VLAN management natively, allowing IMUNES to configure VLANs directly on the bridge as needed.

#### [Hub Node](#hub-node)

A link layer node that forwards every incoming packet to all of its ports and, thus, to every connected node.

#### [External Interface Node](#external-interface-node)

A tool that connects a virtual node to a physical network interface on the host computer, allowing the experiment to communicate with external networks (e.g., to provide Internet access).

The selected host interface is typically 'stolen' from the host OS and assigned to the experiment. For direct links, the interface is handled differently depending on the operating system: on Linux, a `macvlan` or `ipvlan` interface may be created instead.

For details on interface handling for normal and direct links on FreeBSD and Linux, see the documentation section [Configure External interface](#configure-external-interface).

#### [RSTP Switch Node](#rstp-switch-node)

A Rapid Spanning Tree Protocol switch that can prevent bridge loops and allow providing backup links if an active link fails. (FreeBSD only)

#### [Filter Node](#filter-node)

A link layer node that can filter/divert/forward packets depending on their content. (FreeBSD only)

#### [Packet Generator Node](#packet-generator-node)

A link layer node to craft custom packets and send them with given packet rate. (FreeBSD only)
