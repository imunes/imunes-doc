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

A network layer element that is capable of packet forwarding using the routes obtained by dynamic routing protocols (available through quagga or xorp by default installation or any other standard FreeBSD routing daemon).
#### [Host node](#host-node)

A network layer element that does not forward packets and has static routes. It starts standard network services, via portmap and inetd.
#### [PC node](#pc-node)

A network layer element that also does not forward packets and has static routes. Unlike host, it does not start any network services.
#### [NAT64 node](#nat64-node)

A router node which is capable to enable translation between IPv4 and IPv6 protocols using a form of network address translation (NAT).
#### [External connection node](#external-connection-node)

A tool that provides the possibility to connect your host PC with a virtual node by creating an interface on your computer.
#### [Netns node](#netns-node)

A Linux network namespace node that allows integration with existing namespaces and processes. (Linux only)
