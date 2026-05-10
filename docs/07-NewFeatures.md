# [Features](#features)

## [Live Mode](#live-mode)

Previous versions of IMUNES had a limitation: changing the topology required
the experiment to be stopped. Starting with v3, the experiment no longer needs
to be stopped to modify the topology, so adding, removing or modifying nodes or
links is immediately reflected in the system experiment snapshot.

There is also an option to *Pause execution*. Any changes made while the
experiment is running will not affect the live snapshot until you *Resume
execution*. At that point, all changes are applied simultaneously. For example:
deleting multiple nodes while **not** in paused mode will stop and destroy the
nodes one by one, whereas performing the same action in paused mode will
terminate them in parallel.

## [New .imn Format](#new-.imn-format)

Starting with v3, topologies are no longer stored in a custom format and have
been replaced with JSON. Opening topologies in a legacy format is still
supported, but they will be saved in the new format, as the legacy format is no
longer maintained.

## [Help Labels](#help-labels)

When hovering over certain label GUI elements, the cursor changes to a question
mark (?). Holding the right mouse button on such a label creates a button, and
releasing it over the created button opens the help section for the option
associated with that label.

## [Direct Links](#direct-links)

Right-clicking on a link provides the option to change its type to *Direct
link*.

Regular links in IMUNES are created using *bridge* on Linux and *ng_pipe* on
FreeBSD. On Linux, interfaces are created as *veth pairs*, where one end of the
pair resides in the node namespace and the other in the experiment namespace.
When linking two nodes, each 'public' (the one in the experiment namespace)
interface of the pair is attached to the *bridge* representing the link. On
FreeBSD, interfaces are created as *ng_eiface* netgraph nodes. Connecting each
interface hook to a dedicated *ng_pipe* netgraph node effectively links them
through that node.

Between two regular nodes, this type of link is no longer created using
*ng_pipe* or *bridge*. Instead, it directly connects the interfaces of both
nodes. The implementation differs between FreeBSD and Linux: on FreeBSD, two
*ng_eiface* hooks are connected directly, while on Linux, a *veth pair* is
used. Using direct links **disables** *link configuration* for that link.

## [Remote Mode](#remote-mode)

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

## [CLI Mode](#cli-mode)

Starting IMUNES with `-c` flag opens it in 'CLI' mode, without GUI. This is an experimental feature, and it's used mostly for basic topology control (for now). Since IMUNES does not have an API, all the commands are evaluated as if running an interactive TCL shell. **WARNING**: be careful! The return of every command is returned as `OK` or `ERROR` along with its return value.

The following example shows:

 * opening an empty topology
 * creating 2 PC nodes
 * executing the experiment
 * connecting PC nodes with a link
 * redeploying the topology to apply any changes
 * terminating the experiment
 * saving the topology as a JSON file
 * showing the whole topology as a TCL dictionary
 * showing the IPv4 addresses for interface `ifc1` of node `n0`

```bash
$ sudo imunes -c

*** WARNING: This is an experimental feature. Proceed with caution! ***

> newNode pc
OK: 'n0'
> newNode pc
OK: 'n1'
> setOperMode exec
Loading kernel modules...
Preparing virtual filesystem...
...
Network topology instantiated in 1.511 seconds (2 nodes and 0 links).
Experiment ID = i407
OK: ''
> newLink n0 n1
OK: 'l0'
> redeployCfg
Preparing for initialization...
Instantiating VIRTUALIZED nodes...
...
Network topology instantiated in 0.353 seconds (0 nodes and 1 links).
Experiment ID = i407
OK: ''
> setOperMode edit
Preparing for termination...
Stopping services for NODESTOP hook...
...
Cleanup completed in 1.371 seconds.
Terminated experiment ID = i407
OK: ''
> saveCfgJson /tmp/topology.imn
OK: '{
...
}'
> cfgGet
OK: 'options {version 3} nodes {n0 {type pc name pc1 auto_default_routes enabled ifaces {ifc0 {type lo name lo0 ipv4_addrs 127.0.0.1/8 ipv6_addrs ::1/128} ifc1 {type phys name eth0 link l0 ipv4_addrs 10.0.0.20/24 ipv6_addrs fc00::20/64 mac 42:00:aa:00:00:00}}} n1 {type pc name pc2 auto_default_routes enabled ifaces {ifc0 {type lo name lo0 ipv4_addrs 127.0.0.1/8 ipv6_addrs ::1/128} ifc1 {type phys name eth0 link l0 ipv4_addrs 10.0.0.21/24 ipv6_addrs fc00::21/64 mac 42:00:aa:00:00:01}}}} links {l0 {peers {n0 n1} peers_ifaces {ifc1 ifc1}}}'
> cfgGet nodes n0 ifaces ifc1 ipv4_addrs
OK: '10.0.0.20/24'
> exit
```

## [New Subnet Functionalities](#new-subnet-functionalities)

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
