# [IMUNES Architecture](#imunes-architecture)

IMUNES works by allowing users to build a topology composed of nodes,
interfaces, and links, and configure their parameters, such as startup scripts,
IP addresses, routing daemons, and link properties. The topology is stored as a
`.imn` (JSON) configuration file (an example is provided in the [Appendix A
](#appendix-a-imunes-network-configuration-file)).

    New .imn Format
    
    Starting with v3, topologies are no longer stored in a custom format and have been replaced with JSON. Opening topologies in the legacy format is still supported, but they will be saved in the new format, as the legacy format is no longer maintained.

At this stage, no system resources are created and nothing is being emulated
(`edit` mode). When an experiment is started (`exec` mode), the topology is
*instantiated* and assigned a unique identifier, known as the experiment ID
(*eid*). The instantiated topology then exists as a running experiment
containing all elements defined in the configuration file. Experiment metadata
is stored in the IMUNES runtime directory (typically `/var/run/imunes/`), while
experiment artifacts are stored in `/var/imunes/<eid>/`.

Changing the topology while in `exec` mode is possible. Any modifications made
to the topology configuration are immediately reflected in the running
experiment.

    Exec/Live Mode
    
    Previous versions of IMUNES had a limitation: changing the topology required the experiment to be stopped. Starting with v3, the experiment no longer needs to be stopped to modify the topology, so adding, removing, or modifying nodes or links is immediately reflected in the running experiment.

While the experiment is running, it is also possible to change to a `paused`
mode using the *Pause Execution* option. Any changes made while in this mode
will not affect the live experiment until you *Resume Execution*.  At that
point, all changes are applied simultaneously. For example, deleting multiple
nodes while in regular `exec` mode will stop and destroy the nodes one by one,
whereas performing the same action in `paused` mode will cause their
termination to occur in parallel, when resuming the experiment.

Once instantiated, the experiment exists independently of the IMUNES GUI or
CLI. The application can be closed at any time and later reattached to the
running experiment.

Upon *termination* of an experiment, all topology elements are destroyed and
the associated runtime metadata is removed. The experiment can then be
instantiated again, in which case it starts from the currently configured
topology while retaining the same experiment ID (*eid*).

## [Running On FreeBSD](#running-on-freebsd)

## [Running On Linux](#running-on-linux)
