IMUNES operates in three modes: `edit`, `exec`, and `paused`.

In `edit` mode, the topology exists only as a configuration and no system resources are instantiated. Starting an experiment switches IMUNES to `exec` mode, where the topology is instantiated and runs as an independent experiment identified by a unique experiment ID (*eid*). Changes made to the topology while in `exec` mode are immediately reflected in the running experiment.

The `paused` mode temporarily suspends the application of topology changes. Any modifications made while paused are accumulated and applied simultaneously when execution is resumed.

A running experiment exists independently of the IMUNES GUI and can be detached from and reattached to at any time. Terminating an experiment destroys all instantiated resources while preserving the topology configuration.

The *Experiment* submenus can be used to transition between these modes and manage the experiment lifecycle.

  * *Execute* - Start an experiment and switch to `exec` mode. In the process of starting an experiment, IMUNES creates and configures the virtual network. All events during this process will be shown in the statusbar.
  * *Terminate* - Terminate an experiment and switch to `edit` mode. During the termination process, IMUNES will shut down all network elements and it will terminate active services on each node. All events during this process will be shown in the statusbar.
  * *Restart* - Terminate and immediately execute the experiment again.
  * *Pause/Resume execution* - Temporarily pause or resume runtime topology updates.
  * *Attach to experiment* - This option opens a window with the list of attachable experiments on this (or the remote) machine.
  * *Refresh running experiment* - Synchronize the GUI with the current state of the running experiment. Useful only when multiple UI instances are attached to the same experiment.
