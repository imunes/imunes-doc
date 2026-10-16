# [Command-Line Tools and Automation](#command-line-tools-and-automation)

## [Running IMUNES from the Command Line](#running-imunes-from-the-command-line)

### [Command-Line Options and Batch Mode](#command-line-options-and-batch-mode)

In addition to the *File$\to$Open* option to open an .imn file and the
*Experiment$\to$Execute* option used to initiate the virtual network topology
in the GUI, the simulation can be initiated through the command-line interface
(CLI) with the following command:

`# imunes -b simple-network.imn`
 
Using IMUNES through GUI, the *Experiment$\to$Terminate* option is used for
shutting down the simulation and cleaning up the virtual network topology from
the kernel. The CLI alternative for the latter is the following command:

`# imunes -b -e experimentId`

The parameter `exeperimentId` represents the experiment identifier. In order to
get the experiment identifier you can use the `himage` command. With `himage
-l` you will get a list of identifiers of all started experiments. 

### [Interactive CLI Mode](#interactive-cli-mode)

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

## [IMUNES Utilities](#imunes-utilities)

### [himage tool](#himage-tool)

The jls and jexec commands can be impractical for creating scripts for
topologies since the output of the jls command is needed for starting the jexec
command. The jexec command can't take the hostname of the jail as an argument,
it can only take the jail name or jail id. The jail name is created from the
IMUNES experiment ID and the node identifier (not hostname). Every experiment
started in IMUNES has a different randomly generated experiment ID to enable
execution of multiple experiments at once.

IMUNES comes with the `himage` tool that enables the usage of hostnames when
starting commands in virtual nodes. The `himage` tool starts the jexec command
with the appropriate jail name so that the user doesn't have to search for it. 

The `himage` command has the following options:

 * `himage vi_hostname command ...` - executes the command in the virtual node
 with the specified hostname. If no command is specified, it starts an
 interactive shell.
 * `himage -m vi_hostname` - executes the command in the experiment master
 jail. If no command is specified, it starts an interactive shell.
 * `himage -v vi_hostname` - gets the jail node name of the virtual node with
 the specified hostname
 * `himage -n vi_hostname` - gets the node identifier for the specified
 hostname.
 * `himage -e vi_hostname` - gets the experiment ID in which the virtual node
 with the specified hostname is running.
 * `himage -j/-i vi_hostname` - gets the jail ID in which the virtual node
 with the specified hostname is running.
 * `himage -d` - gets the hostname jail filesystem path on the host machine.
 * `himage -l` - gets the experiment list with the experiment data.
 * `himage -ln` - gets the experiment list with node names.

Example of usage of the command himage on a node with the hostname "pc" to get
a list of running processes:

`# himage pc ps ax`

If there are multiple experiments running and there are nodes with the same
hostnames in these experiments the `himage` command accepts the following node
specification where `vi_hostname` is specified as `hostname@eid`, where eid is
the experiments' ID.

`# himage hostname@eid command ...`

i.e:

`# himage pc@i3d05a ps ax`

where `i3d05a` is the experiment ID of the running experiments. To find out
which experiments are running the `himage -l` command can be used as well as
`jls -h jid name host.hostname`.

Execute the `ifconfig` command the IMUNES node named `server`:

`# himage server ifconfig`

### [hcp tool](#hcp-tool)

While the `himage` command is used for running programs inside virtual nodes
the `hcp` is used to copy files directly to the filesystem of running mobile
nodes, thus simplifying deployment of configuration files for starting various
services on virtual nodes.

Usage of the command `hcp`:

`hcp [cp_command_options] [vi_hostname1:]filename [vi_hostname2:]filename`

The `hcp` command invokes the cp command with the specified options. If the
`vi_hostname1` is specified the script copies a file from the virtual node,
otherwise it copies a file from the local folders. The second `vi_hostname2`
specifies on which node the first file will be copied, if not specified the
file is copied to the local folders.

`vi_hostname` is specified in the same way as in the `himage` command,
`hostname` or `hostname@eid`.

Copy file dhcpd.conf from a local folder to the virtual node DHCP:

`# hcp dhcpd.conf DHCP:/usr/local/etc/`

Copy file message.txt from the virtual node PC to a local folder:

`# hcp PC:/root/message.txt .`

Copy file index.html from the virtual node HOST to the virtual node HTTP:

`# hcp HOST:/usr/local/www/data/index.html HTTP:/usr/local/www/data/`

### [vlink tool](#vlink-tool)

The `vlink` tool is used to change link parameters. The following link
parameters are available:

 * bandwidth (bps, bits-per-second)
 * bit-error rate, BER (number of bits in which one error will occur)
 * delay (microseconds)
 * packet duplication (%, percentage of packets that will be duplicated)

A link is identified by the endpoint node names. The link between pc1 and pc2
is identified by *pc1:pc2* or *pc2:pc1*.

Usage of the command `vlink`:

`vlink [options] link_name[@eid]`

Setting the bandwidth to 10 Mb/s with a delay of 30 ms to the link connecting
*router1* and *pc1*:

`# vlink -bw 10000000 -dly 30000 router1:pc1`

Generate an error on one bit in a million:

`# vlink -BER 1000000 router1:pc1`

Set packet duplication to 20%:

`# vlink -dup 20 router1:pc1`

Modifying a link in a specific experiment (i.e. Experiment ID = i56ad1):

`# vlink -dup 20 router1:pc1@i56ad1`

To reset the link settings to the default values the -r flag is used:

`# vlink -r router1:pc1@i56ad1`

Check all `vlink` arguments with:

`# vlink -h`
### [cleanupAll tool](#cleanupAll-tool)

## [Platform-Specific Utilities](#platform-specific-utilities)

### [FreeBSD jls and jexec](#freebsd-jls-and-jexec)

The FreeBSD jail mechanism allows partitioning of a FreeBSD-based computer
system into several independent smaller systems called jails. This mechanism
enables creation of a safe environment, separate from the rest of the system.
Processes created inside a jail are limited within that jail environment. Each
jail is a virtual environment running on the host machine, having its own file
system, processes, set of users, networking subsystem of the FreeBSD kernel and
a few other things.

Two main commands exist in FreeBSD for manging and configuring previously
created jails:

 * `jexec` - executes a command inside an existing jail
 * `jls` - lists jails.

A virtual image or vimage is a jail with its own independent network stack
instance. Every process, socket and network interface present in the system is
always attached to one, and only one, virtual network stack instance (vnet).
During system bootup sequence a default vnet is created to which all the
configured interfaces and user processes are initially attached. 

The `jexec` command allows for execution of arbitrary processes in a targeted
virtual image.

`jexec jname command ...`

The jexec command starts the selected command and it's arguments in the jail
`jname`.

To find out the names of started jails the jls command is used: 

`# jls [-hnqsv] [parameter ...]`
 
Since the default jls command doesn't list names of jails a better output is
provided using the command:

`# jls -h jid name host.hostname`

Also, the command `jls -v` gives a more detailed output.

Execute the `ifconfig` command in the jail with the jail name `n1`:

`# jexec n1 ifconfig`

Execute the `csh` command in the IMUNES virtual node named `host1`:

First we need to find out the jail ID or jail name to execute the wanted
command:

`# jls -h jid name host.hostname | grep host1`

The first parameter output is the jail ID, the second is the jail name and the
last is the hostname. To execute the command you need the jail ID or jail name:

```
# jexec <jid> csh
or 
# jexec <jname> csh
```

### [Linux docker and namespace commands](#linux-docker-and-namespace-commands)

## [Automating Experiments](#automating-experiments)

#### [IMUNES Host Services](#imunes-host-services)

### [Scripting Experiment Lifecycles](#scripting-experiment-lifecycles)

This is an example of starting an DHCP server through a script with the
provided configuration file dhcpd.conf.

Kill the server if it's started:

`# himage DHCP killall -9 dhcpd`

Copy the configuration file:

`# hcp dhcpd.conf DHCP:/usr/local/etc/`

Create the `.leases` file defined in `dhcpd.conf`:

`# himage DHCP touch /var/db/dhcpd.leases`

Start the sever with the copied configuration file:

`# himage DHCP dhcpd -cf /usr/local/etc/dhcpd.conf`

