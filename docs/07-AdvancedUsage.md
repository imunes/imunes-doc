# [Advanced Usage and Integration](#advanced-usage-and-integration)

## [External Network Connectivity](#external-network-connectivity)

### [Stealing External Interfaces](#stealing-external-interfaces)

The *External interface* tool from the toolbox provides the possibility to
attach a physical interface to a virtual node. This way the virtual network is
able to communicate with nodes from the external network.

We will now add the external interface to the *roadwarrior-canvas*. To add a
external interface to the canvas select the *External interface* tool and click
on the canvas.

*External interface* nodes can be connected either with the LAN switch or the
router. Connect the newly created external interface with the virtual node
*roadwarrior-router* using the *Link* tool from the toolbox or the *Create link
to* option from the node menu.

The newly created external interface node is unassigned and in the node name
field it contains *UNASSIGNED*. Open the external interface configuration
window with a double click or right click on it and select the *Configure*
option. Choose the name of the designated physical interface in the *Physical
interface* drop-down list, e.g. em1, obtained from `ifconfig -a` command ran on
the physical machine (outside IMUNES). ([@fig:rj45_conf]) The name of the
physical interface will appear in the node name label. It is also possible to
assign a VLAN tag to it. ([@fig:rj45_canvas])

![External interface configuration dialog\
](./assets/rj45_conf.png
){#fig:rj45_conf}

![External interface node label\
](./assets/rj45_canvas.png
){#fig:rj45_canvas}

Check that *roadwarrior-router* has a properly configured IP address on the
network interface connected to the physical interface. Additionally, check that
routes which route packets between virtual network and the external network
through the physical interface exist in both the external network and in the
virtual network (on *roadwarrior-router*).

Save this configuration to a new file by selecting the *Save as* option from
the *File* menu. Name the file `extended-topology.imn`.

### [External Connections to the Host](#external-connections-to-the-host)

## [Remote Operation](#remote-operation)

Starting IMUNES with `-r` flag opens it in 'remote' mode. It uses SSH to
connect to a remote machine, for example:

```bash
$ imunes -r user@192.168.100.24
or
$ imunes -r remote # if saved in .ssh/config
```

This command opens the GUI locally, while all system commands are executed on
the remote machine. As a result, jails, Docker containers, namespaces, links,
and other resources are created on the remote system. Running IMUNES remotely
does not require IMUNES to be installed on the remote machine, but it does
require VROOT to be set up (on Linux, this means imunes/template Docker image).

Prepare the remote machine: *TODO*

### [Remote GUI over SSH](#remote-gui-over-ssh)

### [Remote Experiment Management](#remote-experiment-management)

## [Custom Nodes and Extensions](#custom-nodes-and-extensions)

### [Creating Custom Nodes](#creating-custom-nodes)

### [Runtime Hooks and Lifecycle Customization](#runtime-hooks-and-lifecycle-customization)

## [Advanced Examples](#advanced-examples)

In this section we will show how to extend the simple network topology (see
[Simple Network Scenario](#simple-network-scenario)). We will explain the
additional possibilities of building and configuring the extended network
scenario:

The simple network topology is placed in the *office-canvas* while the
additional elements are placed in the *roadwarrior-canvas*. The
*roadwarrior-canvas* consists of a router (*roadwarrior-router*), a PC
(*roadwarrior*) and a physical interface. The *roadwarrior-router* is connected
to the *office-router* on the *office-canvas* through the 192.168.3.0/24
network, the PC is in the 161.53.19.0/24 network whereas the physical interface
is in the 161.53.20.0/24 network.

We will now extend the simple network from the last chapter by adding the
*roadwarrior-router*, *roadwarrior* and the physical interface all placed on
another canvas. To open an existing IMUNES network configuration file use *File
$\to$ Open* from the menubar or start IMUNES with the imn file as an argument:
`imunes simple-topology.imn`. Check that you are in the edit mode. If not,
switch with *Experiment $\to$ Terminate*.
