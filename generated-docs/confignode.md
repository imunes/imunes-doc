Node nameName that will be displayed next to the node. If this is a virtualized node, this will be configured as the node hostname.
Force nodeWhen applying the configuration, the node (or its interfaces) will be forcefully recreated/reconfigured with the currently configured values.
Custom static routesAdd defined routes on node startup. Set one route per line in the format
a.b.c.d/prefix x.y.z.w

For example: 0.0.0.0/0 10.0.0.1
Automatic default routesIf 'Enable automatic default routes' is enabled, IMUNES will dynamically generate default routes for this node and automatically add them on node startup.

You can see the default routes that will be generated in the 'Automatic default routes' tab.
Configure External interface'Steal' an interface from the host OS.
Depending on the type of link it connects to, the interface is handled differently.

FreeBSD
 - 'normal' link: the interface is moved to the experiment jail and connected with the nodes interface over a bridge
 - 'direct' link: the interface is moved to the experiment jail and connected with the nodes interface without a bridge

Linux
 - 'normal' link: the interface is moved to the experiment namespace and connected with the nodes interface over a bridge
 - 'direct' link: a new macvlan (or ipvlan if wireless) interface is created, and moved to the nodes namespace
Custom configIf enabled, custom configuration(s) will be run instead of default behaviour. There are currently two custom configuration options: interfaces config and node config.
Custom interfaces configIf enabled, custom interfaces configuration will be run instead of default behaviour from the 'Interfaces' tab. More information is available inside the custom config editor.
Custom node configIf enabled, custom node configuration will be run instead of default commands. More information is available inside the custom config editor.
Open in external editorOpen the selected custom configuration in external editor (configured in 'external_editor_command' custom variable).

Ignored if custom configuration is DISABLED.

Example values for 'external_editor_command' are:
    xterm+vim:	{xterm -T "%TITLE%" -e "vim %FILE_PATH%"}
    gedit:		{gedit --standalone %FILE_PATH%}
    mousepad:	{mousepad --disable-server %FILE_PATH%}
    kate		{kate --block %FILE_PATH%}
    vscode		{code --wait --new-window %FILE_PATH%}
    sublime	{subl -n -w %FILE_PATH%}
    gvim		{gvim -f %FILE_PATH%}

The external editor must quit, only then will IMUNES fetch the latest changes.
ServicesFor each enabled service, the node will start its daemon on node startup.
