Additional options for Docker/Jail/others when creating the current node (such as mounts, CPUs, memory, etc).
Each node has `generic`, `docker` and `jail` specific options. Generic options are available on all platforms, while `jail` and `docker` options only on FreeBSD and Linux.

### [Generic options](#generic-options)

These are the options that are available for every platform IMUNES runs on (FreeBSD/Linux).

#### [Imported files](#imported-files)

Import (embed) host files in IMUNES topology file. Files are embedded as JSON arrays of plain text or, optionally, base64-encoded.

**NOTE**: embedding files increases total topology file size, base64-encoding even more so.

  * *Imported file enabled* - Enable or disable this imported file. Validation errors are ignored while the entry is disabled.
  * *Imported file internal path* - Destination of the imported file. Use either:
    - `absolute file path`,
    - `@node:path` - to link to an imported file from another node (linked entries cannot link to another linked entry)
    - `#hook:filename` - to make `filename` executed when hook is reached during deployCfg/undeployCfg.

Valid hooks are:

    - `pre-init_config` - before the initial node configuration
    - `post-init_config` - after initial node configuration
    - `pre-pifaces_create` - before creating physical interfaces
    - `post-pifaces_create` - after creating physical interfaces
    - `pre-pifaces_dcreate` - before creating physical interfaces (direct links)
    - `post-pifaces_dcreate` - after creating physical interfaces (direct links)
    - `pre-lifaces_create` - before creating logical interfaces
    - `post-lifaces_create` - after creating logical interfaces
    - `pre-ifaces_config` - before configuring all interfaces
    - `post-ifaces_config` - after configuring all interfaces
    - `pre-node_config` - before configuring the node
    - `post-node_config` - after configuring the node
    - `pre-node_unconfig` - before unconfiguring the node
    - `post-node_unconfig` - after unconfiguring the node
    - `pre-node_shutdown` - before shutting down all processes on the node
    - `post-node_shutdown` - after shutting down all processes on the node
    - `pre-ifaces_unconfig` - before unconfiguring all interfaces
    - `post-ifaces_unconfig` - after unconfiguring all interfaces
    - `pre-lifaces_destroy` - before destroying logical interfaces
    - `post-lifaces_destroy` - after destroying logical interfaces
    - `pre-pifaces_destroy` - before destroying physical interfaces
    - `post-pifaces_destroy` - after destroying physical interfaces
    - `pre-pifaces_ddestroy` - before destroying physical interfaces (direct links)
    - `post-pifaces_ddestroy` - after destroying physical interfaces (direct links)
    - `pre-node_destroy` - before destroying the node
  * *Imported file mode* - File permissions specified as a numeric mode, for example 644. An environment variable (a value starting with $) is also accepted.
  * *Imported file edit* - Edit the contents of the imported file using the built-in editor.
  * *Imported file external edit* - Edit the contents of the imported file using an external editor.
  * *Imported file import* - Select a local file and load its contents into this imported file entry.
  * *Imported file encode* - Store the file contents base64-encoded in the IMUNES configuration.  Use this for binary files or other content that should not be stored as plain text.
  * *Imported file delete* - Delete this imported file entry.

#### [Imported dirs](#imported-dirs)

Import (embed) host directories in IMUNES topology file. Directories are embedded as base64-encoded tar archives.


**NOTE**: embedding directories increases total topology file size.

  * *Imported dir enabled* - Enable or disable this imported directory. Validation errors are ignored while the entry is disabled.
  * *Imported dir internal path* - Destination of the imported directory. Use either:
    - `absolute directory path`,
    - `@node:path` - to link to an imported directory from another node (linked entries cannot link to another linked entry)
    - `#hook:dirname` - to save `dirname` in the `hook` folder.

Valid hooks are:

    - `pre-init_config` - before the initial node configuration
    - `post-init_config` - after initial node configuration
    - `pre-pifaces_create` - before creating physical interfaces
    - `post-pifaces_create` - after creating physical interfaces
    - `pre-pifaces_dcreate` - before creating physical interfaces (direct links)
    - `post-pifaces_dcreate` - after creating physical interfaces (direct links)
    - `pre-lifaces_create` - before creating logical interfaces
    - `post-lifaces_create` - after creating logical interfaces
    - `pre-ifaces_config` - before configuring all interfaces
    - `post-ifaces_config` - after configuring all interfaces
    - `pre-node_config` - before configuring the node
    - `post-node_config` - after configuring the node
    - `pre-node_unconfig` - before unconfiguring the node
    - `post-node_unconfig` - after unconfiguring the node
    - `pre-node_shutdown` - before shutting down all processes on the node
    - `post-node_shutdown` - after shutting down all processes on the node
    - `pre-ifaces_unconfig` - before unconfiguring all interfaces
    - `post-ifaces_unconfig` - after unconfiguring all interfaces
    - `pre-lifaces_destroy` - before destroying logical interfaces
    - `post-lifaces_destroy` - after destroying logical interfaces
    - `pre-pifaces_destroy` - before destroying physical interfaces
    - `post-pifaces_destroy` - after destroying physical interfaces
    - `pre-pifaces_ddestroy` - before destroying physical interfaces (direct links)
    - `post-pifaces_ddestroy` - after destroying physical interfaces (direct links)
    - `pre-node_destroy` - before destroying the node
  * *Imported dir import* - Select a local directory and import its contents. The directory contents are stored as a base64-encoded tar archive in the IMUNES configuration.
  * *Imported dir delete* - Delete this imported directory entry.

### [Jail options](#jail-options)

Node options available specifically for nodes running jails (on FreeBSD).

#### [General jail options](#general-jail-options)

General options to attach to `jail -c` command

  * *Custom vroot* - If enabled, IMUNES will use the given jail path (virtual root - vroot) instead of the default one when running the node. The default vroot is /var/imunes/vroot directory.
  * *Custom image* - If enabled, IMUNES will use the given Docker image (virtual root - vroot) instead of the default one when running the node. The default vroot is imunes/template Docker image.

### [Docker options](#docker-options)

Node options available specifically for nodes running Docker (on Linux).

#### [General Docker options](#general-docker-options)

General options to attach to `docker run` command.

  * *External Docker interface* - If enabled, IMUNES will create a Docker interface inside a node (`dext0`) connected to the imunes-bridge Docker network. This interface is primarily used to enable internet connection on a node in a quick and easy way - the default route is automatically added on its creation. Users should configure `/etc/resolv.conf` by themselves as DNS resolver is not set automatically.
  * *CPUs count* - The maximum CPU resources a node can use.
  * *Custom jail flags* - Insert any custom jail flags.
  * *Custom Docker flags* - Insert any custom Docker flags.

#### [Docker port forwardings](#docker-port-forwardings)

Configure TCP, UDP, SCTP or any port mappings from the host to this Docker node. Each entry defines the protocol and host/container ports used by Docker.

  * *Port forwarding enabled* - Enable or disable this port forwarding rule. Disabled rules are kept in the configuration but are not applied.
  * *Port forwarding host IP* - Optional host IP address on which the forwarded port is exposed. Leave empty to use Docker's default host binding.
  * *Port forwarding host port* - Optional port number exposed on the host. Leave empty to let Docker automatically assign an available host port.
  * *Port forwarding node port* - Port number inside the Docker node to which incoming connections are forwarded.
  * *Port forwarding protocol* - Network protocol used by this port forwarding rule. Use tcp/udp/sctp or leave empty for any.
  * *Port forwarding delete* - Delete this port forwarding rule.

#### [*Docker environment variables*](#*docker-environment-variables*)

Define environment variables passed to the Docker container when the node is created.

  * *Environment variable enable* - Enable or disable this environment variable. Disabled variables are kept in the configuration but are not applied.
  * *Environment variable name* - Name of the environment variable passed to the Docker container.
  * *Environment variable value* - Value assigned to the environment variable. The value may be left empty.
  * *Environment variable deleted* - Delete this environment variable.

#### [Docker volumes](#docker-volumes)

Configure host paths or Docker volumes that are mounted inside the node container.

  * *Volume enabled* - Enable or disable this volume. Disabled volumes are kept in the configuration but are not applied.
  * *Volume type* - Bind mount (host file/directoey) or Docker volume.
  * *Volume source* - Host path or Docker volume name to mount into the container.
  * *Volume destination* - Path inside the Docker container where the volume is mounted.
  * *Volume read only* - Mount the volume as read-only. When enabled, the container can read files from the volume but cannot modify them.
  * *Volume delete* - Delete this volume mapping.
