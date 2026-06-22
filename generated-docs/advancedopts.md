Custom vrootIf enabled, IMUNES will use the given jail path (virtual root - vroot) instead of the default one when running the node.

The default vroot is /var/imunes/vroot directory.
Custom imageIf enabled, IMUNES will use the given Docker image (virtual root - vroot) instead of the default one when running the node.

The default vroot is imunes/template Docker image.
External Docker interface(Linux only)

If enabled, IMUNES will create a Docker interface inside a node (dext0) connected to the imunes-bridge Docker network.

This interface is primarily used to enable internet connection on a node in a quick and easy way - the default route is automatically added on its creation. Users should configure /etc/resolv.conf by themselves as DNS resolver is not set automatically.
Advanced virt optionsAdditional options for Docker/Jail/others when creating the current node (such as mounts, CPUs, memory, etc.)
CPUs countThe maximum CPU resources a node can use.
Custom flagsInsert any custom Docker/jail flags.
