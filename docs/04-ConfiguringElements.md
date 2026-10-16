# [Configuring Nodes, Interfaces and Links](#configuring-nodes-interfaces-and-links)

## [Node Configuration](#node-configuration)

### [General Node Settings](#general-node-settings)

### [Static Routes and Automatic Default Routes](#static routes-and-automatic-default-routes)

### [Routing Models and Protocols](#routing-models-and-protocols)

### [Custom Node Configuration](#custom-node-configuration)

The configuration window of each network layer node (PC, Host, Router, NAT64
and Click router) also has the *Custom startup configuration* field. In order
to view or edit the generated startup configuration click on the *Editor*
button as shown in [@fig:config_tab].

![Configuration tab\
](./assets/configuration_tab.png
){#fig:config_tab}

In a newly opened window, write a new configuration name and click *Create*. An
empty configuration file will be created. By clicking on *Fill defaults*, in
case of a non-router network layer node or a router node with the static
routing model, the default configuration consists of *ifconfig* and *route*
commands with the `/bin/sh` shell. [@fig:custom_config] shows the created
default configuration.

![Custom configuration window\
](./assets/custom_configuration.png
){#fig:custom_config}

It is possible to add custom commands that will be executed at the boot time.
When finished, click on the *Apply* or *Apply and Close* button to save the
changes. When you have multiple configurations, you can choose the default one
in the *Default configuration* drop-down menu. To delete a configuration,
select its tab and click *Delete config* button.

**NOTE:** After starting the network simulation, the new/custom configuration
will be considered only if *Custom startup configuration* is enabled. This is
done by checking the *Enabled* check box in the *Custom startup config* field
in [@fig:config_tab].

## [Advanced Node Configuration](#advanced-node-configuration)

{{include:generated-docs/advancedopts.md}}

### [Advanced Generic Node Options](#advanced-generic-node-options)

#### [Imported Files](#imported-files)

#### [Imported Dirs](#imported-dirs)

#### [Node Runtime Hooks](#node-runtime-hooks)

### [Advanced Jail Node Options](#advanced-jail-node-options)

#### [General Jail Options](#general-jail-options)

### [Advanced Docker Node Options](#advanced-docker-node-options)

#### [General Docker Options](#general-docker-options)

#### [Docker Port Forwardings](#docker-port-forwardings)

#### [Docker Environment Variables](#docker-environment-variables)

#### [Docker Volumes](#docker-volumes)

## [Interface Configuration](#interface-configuration)

### [Generic Interface Parameters](#generic-interface-parameters)

#### [Interface States](#interface-states)

#### [Interfaces Queuing](#interface-queuing)

#### [Interface MTU](#interface-mtu)

### [Physical Interfaces](#physical-interfaces)

#### [Managing Physical Interfaces](#managing-physical-interfaces)

When the Interfaces tab is opened, a configuration window similar to the one
shown in [@fig:phys_log_ifc] is shown to the user. The Physical
Interfaces list represents actual interfaces connected to links in IMUNES. Thus
we can see that the selected node has one link in IMUNES.

IMUNES also offers the feature to configure additional logical interfaces. By
default only one logical interface is added: `lo0` - the loopback interface
with the following addresses: `127.0.0.1` for IPv4 and `::1` for IPv6. 

![Physical and logical interfaces\
](./assets/physical_logical_interfaces.png
){#fig:phys_log_ifc}

#### [Interface MAC address](#interface-mac-address)

#### [Interface IPv4 address](#interface-ipv4-address)

#### [Interface IPv6 address](#interface-ipv6-address)

#### [Interface VLAN Filtering](#interface-vlan-filtering)

#### [Interface Isolation](#interface-isolation)

### [Logical Interfaces](#logical-interfaces)

#### [Managing Logical Interfaces](#managing-logical-interfaces)

Users can configure additional logical interfaces by clicking on the Logical
Interfaces item in the Interfaces list. The Logical Interfaces configuration
window is show in [@fig:logical_ifcs]. At the moment IMUNES supports
two types of logical interfaces: `lo` and `vlan`.

![Logical interfaces management\
](./assets/logical_interfaces.png
){#fig:logical_ifcs}

[@fig:vlan_logical_ifcs] shows an example for setting up a `vlan`
logical interface `vlan0` on a physical interface `eth0` with an arbitrary tag
`10` and an IPv4 address `10.0.0.1/24`.

![Logical interfaces management\
](./assets/vlan_logical_interfaces.png
){#fig:vlan_logical_ifcs}

#### [Loopback Interfaces](#loopback-interfaces)

#### [VLAN Interfaces](#vlan-interfaces)

### [Custom Interface Configuration](#custom-interface-configuration)

## [Link Configuration](#link-configuration)

### [Link Types](#link-types)

### [Link Emulation Parameters](#link-emulation-parameters)

### [Link Display Properties](#link-display-properties)

#### [Splitting a Link](#splitting-a-link)

Links can be split in two separate parts and it is possible to change location
of both of its parts after selecting it with the *Select tool*. Right click on
the link and than left click on the *Split label* in the pop-up menu to split
the link in two halves. Separated link parts can be merged back with the
*Merge* option from the link menu. This feature is shown in [@fig:split_link].

![Split link\
](./assets/split_link.png
){#fig:split_link}

![Example of transforming existing network layer nodes\
](./assets/transform.png
){#fig:transform width=75%}

## [Global Network Settings](#global-network-settings)

### [IP Address Pools](#ip-address-pools)

#### [IPv4 Address Pool](#ipv4-address-pool)

*IPv4 address pool* option from the *Tools* menu is used for replacing default
10.0.0.0/24 address pool. Choosing that option invokes a dialog shown in
[@fig:ipv4_addr_pool].

![IPv4 address pool dialog\
](./assets/ipv4_addr_pool.png
){#fig:ipv4_addr_pool}

In order to replace default 10.0.0.0/24 address pool, set variable-mask IPv4
address pool through the invoked dialog. CIDR notation is required, so the IPv4
address needs to be followed by a slash and a network length. To apply changes
click on the *Apply* button. The given address pool will be applied to all the
subsequentially created network layer elements ([@fig:ipv4_addr_pool_example]).

![IPv4 address pool example\
](./assets/ipv4_addr_pool_example.png
){#fig:ipv4_addr_pool_example}

In order to apply the given address pool to selected elements, right click on
the network layer element and choose the option *IPv4 autorenumber* from the
pop-up menu. In example shown in [@fig:ipv4_autorenumber_example] we have set
IPv4 address pool to 160.153.1.1/24, selected all network elements and selected
the option *IPv4 autorenumber* from the node menu to apply the given address
pool to selected elements.

![IPv4 autorenumber example\
](./assets/ipv4_autorenumber_example.png
){#fig:ipv4_autorenumber_example width=75%}

#### [IPv6 Address Pool](#ipv6-address-pool)

*IPv6 address pool* option from the *Tools* menu is used for replacing default
fc00::/64 address pool.  The procedure for setting the IPv6 address pool is the
same as for setting the IPv4 address pool.

### [Automatic Subnetting](#automatic-subnetting)

The default IMUNES behavior when connecting a Layer 3 node to a broadcast
domain (e.g., a PC to a lanswitch node) is to automatically assign IPv4 and
IPv6 addresses to the newly created interface, provided that *IPv4/IPv6
auto-assign* is enabled in the options. If another L3 node already exists in
that domain, the interface is assigned an address from the same subnet as the
existing one.

This behavior remains unchanged in the new IMUNES version; however, the process
is now VLAN-aware and includes VLAN logical interfaces.

The new funcions include (right-click menu, described in *TODO*):

 * *Settings* -> *Remove IPv4/IPv6 addresses* (for all interfaces)
 * *Interface settings* -> *Remove IPv4/IPv6 addresses*, *IPv4/IPv6
   autorenumber*, *Match IPv4/IPv6 subnet* (for specific interface)

### [Routing Protocol Defaults](#routing-protocol-defaults)

In the *Tools* menu you can find the *Routing protocol defaults* option.
Selecting this option invokes a popup window shown in [@fig:router_def_1]. Just
as a reminder, settings referring to routing protocols can be also changed in
the *router configuration* window. The difference is that changes made there
are applied only to the router that is being configured. This tool in contrary
makes it possible to apply changes to one or more selected routers. If there is
no router selected than the changes will be applied to subsequentially created
routers. Note that this option will be disabled when the experiment starts.

![Router defaults window\
](./assets/router_defaults_1.png
){#fig:router_def_1}
