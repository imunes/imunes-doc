
### [TopoGen Menu](#topogen-menu)

The *TopoGen* menu ([@fig:topogen_menu]) contains options for simple and fast specification of various network topologies using a selected node type (see Section [Generating a Network Topology](#generating-a-network-topology)).

![Topogen menu](./assets/topogen_menu.png){#fig:topogen_menu width=12%}

Select any node type and click on one of the options to automatically generate predefined network topologies using any of the following rules:

  * *Chain(n)* - Create *n* nodes and connect them sequentially in a chain.
  * *Star(n)* - Create *n* nodes and connect *n-1* of them to a single, central node.
  * *Cycle(n)* - Create *n* nodes and connect them sequentially, but connecting the last node with the first one.
  * *Wheel(n)* - Create *n* nodes and connect *n-1* of them to a single, central node, and to their neighbors.
  * *Cube(n)* - Create *2^n* nodes and connect them each of them with *n* other nodes.
  * *Clique(n)* - Create *n* nodes and connect them with each other.
  * *Bipartite(n,m)* - Create *n+m* nodes and connect each of *n* nodes with each of *m* nodes.
  * *Random(n,m)* - Create *n* nodes and randomly connect *m* links between them.
