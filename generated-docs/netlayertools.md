
### [Network-Layer Nodes](#network-layer-nodes)

Network-layer (L3) nodes available for use:

  * [Router Node](#router-node)
  * [Host Node](#host-node)
  * [PC Node](#pc-node)
  * [NAT64 Node](#nat64-node)
  * [External Connection Node](#external-connection-node)
  * [Netns Node (Linux only)](#netns-node)

Nodes of all supported platform types can be added to a topology, regardless of the platform on which IMUNES is currently running. Nodes that are incompatible with the current platform are displayed with a different background in the toolbox and marked with the **DISABLED** label on the canvas. These nodes will not be started when the experiment begins.

#### [Router Node](#router-node)

A network layer node capable of forwarding packets using routes learned through dynamic routing protocols or routes configured statically. Dynamic routing is supported through FRRouting (FRR) or standard FreeBSD/Linux routing daemons.

The following routing protocols can be configured to start automatically on each node: RIP, RIPng, OSPF, OSPFv3, BGP, LDP, and IS-IS.

Routing daemons are started before the node's interfaces are configured and stopped after its interfaces are unconfigured. Unless custom configuration is enabled, IMUNES automatically generates default configurations for each 'physical interface' for RIP, RIPng, OSPF, and OSPFv3. It also automatically configures default router IDs and route redistribution settings for these protocols.

#### [Host Node](#host-node)

A network layer node that does not forward packets and uses static routing by default. It provides standard network services through `inetd`.

#### [PC Node](#pc-node)

The most basic IMUNES network layer node. It does not automatically forward packets and uses static routing by default. Unlike the Host node, it does not start any network services.

#### [NAT64 Node](#nat64-node)

A network layer node that enables communication between IPv4 and IPv6 networks by translating between the two protocols using the `tayga` NAT64 daemon.

#### [External Connection Node](#external-connection-node)

A tool that connects an IMUNES experiment or its virtual node to the host machine by creating a virtual network interface on the host.

  * FreeBSD - An `ng_eiface` netgraph node is created on the host and connected to the corresponding interface inside the experiment jail using `ng_pipe`.

  * Linux - A `veth` pair is created, with one end remaining on the host and the other moved into the experiment's network namespace (netns). The interface inside the experiment can be connected through a regular link or, when using a direct link, moved into the connected node's network namespace.

#### [Netns Node](#netns-node)

A Linux network namespace node that allows integration with existing namespaces and processes. (Linux only)
