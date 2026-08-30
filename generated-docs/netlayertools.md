
### [Network layer node tool](#network-layer-node-tool)

This opens a list of network-layer (L3) nodes available for use:

  * Router node
  * Host node
  * PC node
  * NAT64 node
  * External connection node
  * Netns node (Linux only)

**NOTE**: It is not possible to execute node types with red background on current architecture.

#### [Router node](#router-node)

A network layer node capable of forwarding packets using routes learned through dynamic routing protocols or routes configured statically. Dynamic routing is supported through FRRouting (FRR) or standard FreeBSD/Linux routing daemons.

The following routing protocols can be configured to start automatically on each node: RIP, RIPng, OSPF, OSPFv3, BGP, LDP, and IS-IS.

Routing daemons are started before the node's interfaces are configured and stopped after its interfaces are unconfigured. Unless custom configuration is enabled, IMUNES automatically generates default configurations for each 'physical interface' for RIP, RIPng, OSPF, and OSPFv3. It also automatically configures default router IDs and route redistribution settings for these protocols.

#### [Host node](#host-node)

A network layer node that does not forward packets and uses static routing by default. It provides standard network services through `inetd`.

#### [PC node](#pc-node)

The most basic IMUNES network layer node. It does not automatically forward packets and uses static routing by default. Unlike the Host node, it does not start any network services.

#### [NAT64 node](#nat64-node)

A network layer node that enables communication between IPv4 and IPv6 networks by translating between the two protocols using the `tayga` NAT64 daemon.

#### [External connection node](#external-connection-node)

A tool that connects an IMUNES experiment or its virtual node to the host machine by creating a virtual network interface on the host.

  * FreeBSD - An `ng_eiface` netgraph node is created on the host and connected to the corresponding interface inside the experiment jail using `ng_pipe`.

  * Linux - A `veth` pair is created, with one end remaining on the host and the other moved into the experiment's network namespace (netns). The interface inside the experiment can be connected through a regular link or, when using a direct link, moved into the connected node's network namespace.

#### [Netns node](#netns-node)

A Linux network namespace node that allows integration with existing namespaces and processes. (Linux only)
