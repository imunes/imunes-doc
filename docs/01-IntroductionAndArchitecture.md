# [Introduction and Architecture](#introduction-and-architecture)

This manual is intended for both new users getting started with IMUNES and
experienced users who want to learn more about its advanced features.

## [What is IMUNES?](#what-is-imunes)

IMUNES (Integrated MUltiprotocol Network Emulator/Simulator) is a tool for
emulating and simulating IP-based networks. It allows users to create,
configure, and execute virtual network topologies consisting of various network
elements, including hosts, routers, switches, and links.

Virtual nodes in IMUNES are independent network stack instances implemented
using FreeBSD kernel virtualization mechanisms or Docker containers on Linux.
Virtual nodes can be connected to other virtual nodes or to physical network
interfaces through emulated links. Depending on the platform and node
configuration, virtual nodes can share a common set of application binaries and
libraries. The main strengths of IMUNES are its high scalability, performance,
and fidelity.

## [Document Overview](#document-overview)

This manual is organized into eight chapters and four appendices, covering
everything from basic network topology creation to advanced configuration,
experiment management, and automation.

**Chapter 1, [Introduction and Architecture](#introduction-and-architecture),**
introduces IMUNES, defines its core concepts, and explains how it operates
internally on supported platforms (FreeBSD and Linux).

**Chapter 2, [Getting Started](#getting-started),** guides new users through
installing IMUNES, understanding its interface, creating and configuring a
simple network topology, and running their first experiment.

**Chapter 3, [Building and Organizing
Topologies](#building-and-organizing-topologies),** describes the available
network elements and explains how to create, edit, and organize topologies. It
also covers canvas management and visual customization.

**Chapter 4, [Configuring Nodes, Interfaces and
Links](#configuring-nodes-interfaces-and-links),** provides detailed
explanations of network configuration options, including node settings,
interface parameters, link properties, and advanced platform-specific features.

**Chapter 5, [Running and Managing
Experiments](#running-and-managing-experiments),** explains the experiment
lifecycle, runtime topology modifications, network inspection and debugging
tools, and event scheduling.

**Chapter 6, [Graphical User Interface
Reference](#graphical-user-interface-reference),** provides a reference for the
IMUNES graphical interface, including the main window, toolbox, menus, context
menus, preferences, and context-sensitive help.

**Chapter 7, [Advanced Usage and
Integration](#advanced-usage-and-integration),** covers external network
connectivity, remote operation, custom nodes, runtime hooks, and advanced usage
examples.

**Chapter 8, [Command-Line Tools and
Automation](#command-line-tools-and-automation),** describes command-line
operation, IMUNES utilities such as `himage`, `hcp`, and `vlink`,
platform-specific tools, and experiment automation.

The **appendices** provide additional reference material, including the IMUNES
topology file format (`.imn`), configuration and preference files, keyboard
shortcuts, and troubleshooting information.

## [Core Concepts](#core-concepts)

This section introduces the core concepts and terminology used throughout the
manual. Readers are assumed to be familiar with common networking terminology;
therefore, concepts such as *router*, *IP address*, and *link-layer* are not
explained.

### [Topologies and Topology Elements](#topologies-and-topology-elements)

In IMUNES, a *topology* refers to a network configuration stored in a single
`.imn` file. It consists of topology-wide options, zero or more functional
elements, and zero or more graphical elements.

> **New .imn Format**
>
> Starting with IMUNES v3, the custom topology file format has been replaced
> with JSON. Opening topologies in the legacy format is still supported, but
> they are saved in the new format, as the legacy format is no longer
> maintained.

*Topology-wide options* are settings that apply to a specific topology. They
can affect functionality (e.g., the default routing protocol when creating a
new router node) or graphical presentation (e.g., the default zoom level).

*Functional elements* participate in network emulation and represent components
such as nodes, interfaces, and links.

*Graphical elements* are used to organize and visualize the topology, including
canvases, icons, and annotations.

#### [Functional Elements](#functional-elements)

Functional elements are the components of an IMUNES topology that participate
in [experiment execution and termination](#experiments-and-operating-modes).
Their implementation depends on the underlying operating system
([FreeBSD](#freebsd-architecture) or [Linux](#linux-architecture)).

**Nodes**

Nodes represent network devices or components within a topology. IMUNES
distinguishes between two implementation categories: *VIRTUALIZED* and
*NATIVE*.

*VIRTUALIZED* nodes use operating-system virtualization mechanisms to emulate
independent network devices, such as hosts and routers. These nodes typically
have their own network stack, interfaces, routing tables, and running
processes.

*NATIVE* nodes use networking mechanisms provided directly by the host
operating system, such as bridges and other virtual networking facilities,
without requiring a separate virtualized environment for each node.

Both *VIRTUALIZED* and *NATIVE* nodes can be classified as *link-layer* or
*network-layer* nodes, depending on their functionality within the network
stack. Link-layer nodes primarily operate on Ethernet frames, while
network-layer nodes also provide functionality at the network layer and above.

**Interfaces**

Interfaces provide connection points through which nodes communicate with other
network elements. As with physical networking devices, IMUNES interfaces are
classified as *physical* or *logical*, with *stolen* as an additional interface
type.

*Physical* interfaces are the primary interfaces used to exchange frames over
links. Although they are implemented as virtual interfaces, they behave
similarly to physical network interfaces. A physical interface can exist
without being connected to a link, representing a disconnected network
interface.

*Logical* interfaces are software-defined interfaces that provide additional
networking functionality, such as loopback and VLAN interfaces. They may
operate independently or depend on another interface, depending on their type.

*Stolen* interfaces are host interfaces inserted into the topology, regardless
of their *real* type.

**Links**

Links connect different interfaces, allowing them to exchange network traffic.
They are implemented using networking mechanisms provided by the underlying
operating system.

Each link is defined by its endpoints, represented as *(node, interface)*
pairs. A link cannot exist without its associated interfaces. Removing a node
or an interface that serves as a link endpoint also removes the corresponding
link.

IMUNES supports two link types: *regular* and *direct*. Both provide
connectivity between network elements, but they differ in their underlying
implementation and support for link emulation parameters.

See [IMUNES Architecture](#imunes-architecture) for more information about
elements' implementation and behavior.

#### [Graphical Elements](#graphical-elements)

Graphical elements are used to represent, organize, and customize the
appearance of a topology in the IMUNES graphical user interface. Unlike
functional elements, they do not directly participate in network emulation and
do not create virtual networking resources during experiment execution.

IMUNES provides several types of graphical elements and properties:

**Canvases** provide workspaces in which topology elements are displayed and
organized. A topology can contain multiple canvases, allowing larger networks
to be divided into smaller, more manageable sections. Nodes on different
canvases can still be connected through links.

**Node icons and labels** provide a visual representation of functional nodes
and their properties. Each node is represented by an icon corresponding to its
type, while labels can display information such as node names and interface
addresses.

**Links**, like functional links, are represented graphically on the canvas,
connecting the two interfaces. The visual appearance of a link can be
customized. Links can also be split (e.g., when each node is on its own
canvas), creating *pseudo nodes* that represent the corresponding peers and can
be moved independently of the actual nodes. Additionally, links can be
segmented into multiple line sections using intermediate *points*.

**Annotations** allow users to add text and graphical shapes to a topology.
They can be used to document network segments, highlight specific areas, or
improve the readability of complex topologies. Annotations have no effect on
the emulated network.

**Canvas appearance settings**, such as backgrounds, grids, and display
options, control how the topology is presented in the GUI without affecting its
functional configuration.

Graphical elements and their properties are stored as part of the topology
configuration, allowing the visual layout to be preserved when the topology is
saved and reopened.

For instructions on using these features, see [Building and Organizing
Topologies](#building-and-organizing-topologies).

### [Experiments and Operating Modes](#experiments-and-operating-modes)

A *topology* describes a network configuration, while an *experiment* is a
running instance of that configuration.

A topology can be created, modified, and saved without starting an experiment.
When an experiment is started, IMUNES creates the required operating-system
resources and configures them according to the topology definition. This
process is called *instantiation*.

IMUNES provides three main operating modes:

**Edit mode (`edit mode`)**

In edit mode, users can create and modify network topologies without
instantiating them. Changes affect only the topology configuration and do not
create or modify running network resources.

**Execution mode (`exec mode`)**

In execution mode, the topology is instantiated as a running experiment.
Virtual nodes, interfaces, and links are created and configured using the
underlying operating-system mechanisms.

Users can interact with running nodes, execute commands, inspect network
traffic, and modify the topology. Supported topology changes are applied to the
running experiment as they are made.

**Paused mode (`paused mode`)**

Paused mode allows users to modify the topology while temporarily suspending
the application of those changes to the running experiment.

The experiment itself continues running, but topology modifications are
deferred until execution is resumed. When the user selects *Resume execution*,
the pending changes are applied to the running experiment.

Each running experiment is identified by a unique *experiment ID* (*eid*),
which allows IMUNES to manage its resources and reconnect to it after the GUI
or CLI has been closed.

The experiment lifecycle and operating modes are described in more detail in
[Running and Managing Experiments](#running-and-managing-experiments).

## [IMUNES Architecture](#imunes-architecture)

IMUNES separates topology configuration from network emulation. Users define
network elements and their parameters through the graphical interface or
configuration files, while the runtime system translates these definitions into
operating-system resources.

The runtime system is implemented primarily in Tcl and uses platform-specific
mechanisms to create and manage virtual nodes, interfaces, and links. Although
the underlying implementations differ between FreeBSD and Linux, both follow
the same general procedures for starting, configuring, updating, and
terminating experiments.

The following sections describe the platform-specific implementations and the
lifecycle of a running experiment.

### [Experiment Lifecycle and Runtime Environment](#experiment-lifecycle-and-runtime-environment)

An IMUNES experiment represents an instantiated network topology. Starting an
experiment involves creating the required virtual networking resources,
configuring them according to the topology definition, and initializing the
services running on individual nodes.

> **Exec/Live Mode**
>
> In previous versions of IMUNES, modifying the topology required stopping the
> experiment. Starting with v3, the topology can be modified without stopping
> the experiment. Adding, removing, or modifying nodes and links is immediately
> reflected in the running experiment.

When an experiment is terminated, IMUNES performs the corresponding cleanup
operations, removing the instantiated resources while preserving the topology
configuration.

#### [Experiment Instantiation](#experiment-instantiation)

The instantiation process is initiated when a user selects *Experiment $\to$
Execute* or starts an experiment through the command-line interface.

Before creating any resources, IMUNES checks whether the system supports
experiment execution. These checks include verifying the operating system,
required permissions, availability of system dependencies, and the validity of
configured external interfaces.

Once the preliminary checks succeed, IMUNES begins the instantiation process,
which consists of the following stages:

1. **Preparing the experiment environment**

   IMUNES assigns an experiment ID (*eid*), ensuring that it does not conflict
   with an existing experiments. It then loads the required kernel modules,
   prepares the virtual filesystem and device filesystem where applicable, and
   creates the experiment's top-level networking environment.

   The topology configuration and runtime state information are also written to
   the experiment's runtime directory.

2. **Creating virtualized nodes**

   IMUNES creates all *VIRTUALIZED* nodes using the platform-specific
   virtualization mechanisms: FreeBSD jails or Docker containers on Linux.

   Node creation is followed by a verification step that checks whether the
   corresponding environments have started successfully.

3. **Importing node files**

   Embedded files and directories specified in the node configuration are
   imported into the virtualized node environments.

   This allows users to provide custom configuration files, scripts, and other
   resources required by applications running inside the nodes.

4. **Preparing node environments**

   IMUNES performs the namespace setup required by both *VIRTUALIZED* and
   *NATIVE* node implementations and applies their initial configuration.

   This stage does initial (post-startup) virtual node configuration and setup.

5. **Creating native nodes**

   Once the virtualized environments have been prepared, IMUNES creates the
   *NATIVE* nodes using the appropriate operating-system networking mechanisms.

   After node creation, the `NODEINST` lifecycle hook is triggered for
   applicable nodes.

6. **Creating and configuring interfaces**

   IMUNES first creates the physical interfaces associated with the nodes,
   followed by logical interfaces such as loopback and VLAN interfaces.

   The interfaces are then configured according to the topology definition,
   including their addresses and other interface-specific parameters.

7. **Creating and configuring links**

   After the interfaces have been prepared, IMUNES creates the links connecting
   them.

   Regular and direct links use different platform-specific networking
   mechanisms, as described in [Normal and Direct
   Links](#normal-and-direct-links).

   Once the links have been created, IMUNES applies the supported link
   emulation parameters, such as bandwidth limitations, delay, and packet loss.

   The `LINKINST` lifecycle hook is then triggered for applicable nodes.

8. **Configuring nodes and starting services**

   Finally, IMUNES applies the remaining node configuration, including routing
   information, startup commands, and configured network services.

   After node configuration has been completed, the `NODECONF` lifecycle hook
   is triggered.

9. **Verifying the experiment**

   IMUNES checks the results of interface and node configuration, reports
   detected errors, and updates the runtime state information.

   When instantiation finishes, the experiment is available for interaction
   through the GUI or command-line tools.

Some operations are performed in parallel across multiple nodes or links.
IMUNES uses separate execution and verification stages to initiate operations
and wait for their completion, improving startup performance for larger
topologies.

#### [Experiment Termination](#experiment-termination)

Experiment termination is initiated when the user selects *Experiment $\to$
Terminate* or terminates an experiment through the command-line interface.

Rather than immediately destroying all virtual resources, IMUNES performs an
ordered cleanup procedure that accounts for dependencies between nodes,
interfaces, and links.

The termination process consists of the following stages:

1. **Stopping services and unconfiguring nodes**

   The `NODESTOP` lifecycle hook is triggered before node shutdown.

   IMUNES then executes the node-specific unconfiguration procedures, stopping
   or removing the configured services and other runtime settings as
   appropriate.

2. **Shutting down nodes**

   IMUNES initiates the shutdown procedures for the nodes and waits for their
   completion.

   This allows running processes and services to be stopped before the
   underlying virtual networking resources are destroyed.

3. **Removing links**

   The `LINKDEST` lifecycle hook is triggered before link removal.

   IMUNES then unconfigures the relevant links and destroys their underlying
   networking resources, such as Linux bridges or FreeBSD Netgraph connections.

4. **Removing interfaces**

   Logical interfaces are unconfigured and destroyed first, followed by
   physical interfaces.

   This order helps ensure that interfaces depending on other interfaces are
   removed before their underlying resources.

5. **Destroying native nodes**

   IMUNES destroys the remaining resources belonging to *NATIVE* nodes and
   performs their associated cleanup operations.

6. **Destroying virtualized nodes**

   Before destroying *VIRTUALIZED* nodes, IMUNES performs additional
   platform-specific cleanup operations where required.

   The `NODEDEST` lifecycle hook is triggered, after which the virtualized node
   environments are destroyed. Their associated filesystem resources are then
   cleaned up.

7. **Removing the experiment environment**

   Once the nodes, interfaces, and links have been removed, IMUNES destroys the
   experiment's top-level networking environment and removes its runtime files
   and metadata.

After successful termination, the topology remains available in the editor and
can be executed again.

### [FreeBSD Architecture](#freebsd-architecture)

On FreeBSD, IMUNES uses kernel virtualization and networking mechanisms to
create isolated network environments and interconnect them into an emulated
topology.

Virtualized nodes are implemented using FreeBSD jails with virtualized network
stacks. Each node can have its own network interfaces, IP addresses, routing
tables, and network services while sharing the host operating system's kernel.

The virtualized network stack allows nodes to behave as independent network
devices without requiring a separate operating-system kernel for each node.

Node filesystems are prepared from a common filesystem template, allowing nodes
to share application binaries and libraries while maintaining separate
environments for their configuration and runtime data.

Network connectivity is implemented using the FreeBSD *Netgraph* framework.
Netgraph provides a modular mechanism for connecting networking components
through nodes and hooks.

IMUNES uses several Netgraph node types, including:

- `ng_eiface` — provides Ethernet interfaces that can be assigned to
  virtualized nodes.
- `ng_pipe` — connects interfaces and provides link emulation functionality.
- Direct hook connections — connect interfaces without an intermediate
  emulation node.

When an experiment is started, IMUNES creates the required jails, virtual
interfaces, and Netgraph connections. It then configures network addresses,
routing information, services, and other node-specific parameters.

When the experiment is terminated, these resources are removed.

### [Linux Architecture](#linux-architecture)

On Linux, IMUNES uses Docker containers and Linux networking mechanisms to
implement virtualized nodes and network connectivity.

Each virtualized node runs inside a Docker container, providing an isolated
environment with its own processes, network interfaces, IP addresses, and
routing tables. All containers share the host's Linux kernel.

The container filesystem is based on a Docker image, which provides the
application binaries, libraries, and other files required by the node.
Additional files, directories, and volumes can be configured to customize the
node environment.

Network connectivity is implemented using Linux network namespaces, virtual
Ethernet interfaces (*veth pairs*), and bridges.

A veth pair consists of two interconnected virtual Ethernet interfaces. Frames
transmitted through one interface are received by the other.

For regular links, IMUNES creates veth pairs connecting the network namespaces
of virtualized nodes to the experiment networking environment. The
experiment-side interfaces are then attached to a Linux bridge representing the
link.

The Linux traffic control subsystem (`tc`) is used to configure supported link
emulation parameters, such as bandwidth limitations, delay, and packet loss.
These mechanisms allow IMUNES to reproduce different network conditions without
requiring physical networking equipment.

When an experiment is started, IMUNES creates and configures the necessary
containers, namespaces, interfaces, bridges, and traffic control settings.

When the experiment is terminated, the associated resources are removed.

#### [Experiment IDs and Runtime Files](#experiment-ids-and-runtime-files)

Every instantiated experiment is identified by an *experiment ID* (*eid*). This
identifier distinguishes experiments running on the same host and is used when
naming, locating, and managing their operating-system resources.

The experiment ID can be assigned automatically or specified explicitly when
starting an experiment through the command-line interface.

IMUNES maintains experiment-specific runtime data in a directory typically
located under `/var/run/imunes/<eid>/`.

This directory stores the topology configuration and additional state
information required to manage and reconnect to the running experiment.

Depending on the operating system and node configuration, further filesystem
resources may be created for individual nodes, including virtual root
filesystems, generated configuration files, and imported data.

Because the instantiated network exists independently of the GUI or CLI
process, closing the application does not terminate the experiment. Another
IMUNES instance can later reattach to it by loading the saved runtime
information.

When an experiment is terminated, its runtime state and associated resources
are removed. The topology configuration itself is preserved, allowing the
experiment to be started again.

### [Normal and Direct Links](#normal-and-direct-links)

IMUNES supports two types of links: *regular* and *direct*. Both connect
network interfaces and allow them to exchange Ethernet frames, but their
implementation differs depending on the underlying operating system.

**Regular links**

Regular links are implemented using Linux bridges on Linux and `ng_pipe`
Netgraph nodes on FreeBSD.

On Linux, interfaces are created as *veth pairs*. One end of each pair resides
in the node's network namespace, while the other resides in the experiment's
network namespace.

When two nodes are connected, the experiment-side interfaces are attached to a
Linux bridge representing the link. The bridge forwards Ethernet frames between
the connected interfaces.

On FreeBSD, interfaces are implemented using `ng_eiface` Netgraph nodes. Each
interface is connected through its Netgraph hook to a dedicated `ng_pipe` node,
which provides connectivity between the interfaces.

Regular links support configurable emulation parameters, allowing users to
introduce network conditions such as bandwidth limitations, propagation delay,
packet loss, and other supported impairments.

**Direct links**

Direct links connect two interfaces without creating an intermediate `ng_pipe`
node or Linux bridge.

On FreeBSD, the hooks of two `ng_eiface` nodes are connected directly.

On Linux, a single *veth pair* is used to connect the two endpoints, with each
end placed in the corresponding node's network namespace.

This approach avoids the additional networking components used by regular
links.

However, using direct links **disables link emulation** for that connection.
Link configuration parameters can still be stored in the topology
configuration, but they are ignored during experiment execution.

Direct links are therefore useful when a direct connection between two nodes is
sufficient and configurable link emulation is not required.

**NOTE:** On Linux, `direct` links require both interfaces to exist
simultaneously. Destroying one interface therefore also destroys the interface
at the other end of the link. Since the intended behavior is usually to
preserve the other interface, it is automatically recreated after the *veth
pair* is destroyed. FreeBSD does not have this limitation.
