# [User Interface Layout](#user-interface-layout)

IMUNES can be used either through the simple Tcl/Tk based graphical user
interface (GUI) or through the command line interface (CLI).

We will run IMUNES on FreeBSD with some kind of X11 window manager and explain
the main GUI components. If X11 is not running you can start it using `startx`
command. To run IMUNES GUI use `imunes` command.

IMUNES GUI is a simple Tcl/Tk based management console, allowing specification
and management of virtual network topologies. Its main parts are the work space
in the middle, called canvas, the menubar on the top, the toolbox on the left
side and the statusbar at the bottom ([@fig:imunes_gui]).

![IMUNES GUI\
](./assets/gui.png
){#fig:imunes_gui width=100%}

The default working mode after the initial start (or after creating a new
virtual network configuration file with the *File $\to$ New* option from the
menubar) is edit mode. The edit mode is used to build and configure network
topologies, contrary to the execute mode whose purpose is the network
simulation. The network simulation will be explained later in the Section
[Simulating a Simple Network](#simulating-a-simple-network).

## [Toolbox](#toolbox)

The toolbox, placed on the left side of the GUI, contains tools for building
network topologies and tools for adding annotations ([@fig:toolbox_tools]).
These tools are all available in the edit mode. In the execute mode, these
tools (except for the *Select tool*) are shaded and cannot be used.

![Toolbox tools\
](./assets/toolbox.png
){#fig:toolbox_tools width=70%}

Each toolbox item shown in [@fig:toolbox_tools], is described below.

{{include:generated-docs/selecttool.md}}

{{include:generated-docs/linktool.md}}

{{include:generated-docs/linklayertools.md}}

{{include:generated-docs/netlayertools.md}}

{{include:generated-docs/annotationtools.md}}

## [Menubar](#menubar)

The menubar ([@fig:menubar]) consists of menus that provide access to various
functions. Some options from the menubar are automatically disabled in the
execute mode.

![Menubar\
](./assets/menubar.png
){#fig:menubar width=100%}

### [File Menu](#file-menu)

The *File* menu ([@fig:file_menu]) contains options for configuration files
management.

![File menu\
](./assets/file_menu.png
){#fig:file_menu width=20%}

 * *New* - Create a new virtual network configuration file.
 * *Open* - Open an existing IMUNES network configuration file (.imn) by
   selecting it from the invoked *File Open* dialog.
 * *Save*, *Save As* - Save the current virtual network topology in IMUNES
   network configuration file format (.imn).
 * *Print* - Print the current canvas using Tcl/Tk PostScript and send it
   through the pipe to the default printing command (*lpr*) (that can also be
   changed, (e.g > *filename*)).
 * *Print to file* - Print all canvases to PDF or PostScript file.
 * *Close* - Close the virtual network configuration file. NOTE: If the
   experiment is not explicitly terminated it remains running.
 * *Quit* - Exit the IMUNES GUI.
 * *Recently used files* - A list of recently used files. Clicking on one of
   the files opens that configuration file.

### [Edit Menu](#edit-menu)

The *Edit* menu ([@fig:edit_menu]) contains options for handling elements on
the canvas.

![Edit menu\
](./assets/edit_menu.png
){#fig:edit_menu width=19%}

 * *Undo* - Undo the last change on the canvas reverting it to an older state.
 * *Redo* - Reverse the undo command.
 * *Cut*, *Copy*, *Paste* - Cut or copy elements from source and paste them to
   destination.
 * *Select all* - Select a whole network topology.
 * *Select adjacent* - Select nodes connected to the selected node(s). This
   feature is also available through the node menu.

### [Canvas Menu](#canvas-menu)

The *Canvas* menu contains options for canvas management [@fig:canvas_menu].

![Canvas menu\
](./assets/canvas_menu.png
){#fig:canvas_menu width=20%}

 * *New* - Create a new empty canvas.
 * *Rename* - Rename the current canvas through the invoked dialog.
 * *Delete* - Delete the current canvas.
 * *Resize* - Resize the current canvas through the invoked dialog.
 * *Background image* - Change background on the current canvas (see Section
   [Canvas Background Image](#canvas-background-image)).
 * *Previous, Next, First, Last* - Switch between available canvases.

### [View Menu](#view-menu)

The *View* menu ([@fig:view_menu]) contains options for showing / hiding links
and nodes parameters on the canvas, options for changing icon size, zooming
options, etc.

![View menu\
](./assets/view_menu.png
){#fig:view_menu width=25%}

 * *Icon size* - Change the size (normal or small) of all network elements (see
   Section [Icons](#icons)).  
 * *Show [network element parameter]* - Show or hide information such as
   interface names, IPv4/IPv6 addresses, etc. These options are usually saved
   in the .imn files, providing consistent look of scenarios running on
   different computers.
 * *Show Topology Tree* - Show or hide the tree with a list of all network
   topology elements.
 * *Show Background Image* - Show or hide background image.
 * *Show Annotations* - Show or hide annotations (text, oval, rectangle).
 * *Show Grid* - Show or hide grid.
 * *Zoom In, Zoom Out* - Magnify (*Zoom In*) or reduce (*Zoom Out*) the size of
   the display. 
 * *Themes* - Choose one of the themes from the submenu. Each theme represents
   a collection of styles, where a style describes the appearance (or
   appearances) of a Ttk widget class.

### [Tools Menu](#tools-menu)

The *Tools* menu ([@fig:tools_menu]) contains the network topology management
tools.

![Tools menu\
](./assets/tools_menu.png
){#fig:tools_menu width=30%}

 * *Auto rearrange all* - Automatically rearrange position of all network
   elements on canvas.
 * *Auto rearrange selected* - Automatically rearrange position of the selected
   group of network elements.
 * *Align to grid* - Arrange all network elements on canvas aligning them to
   grid.
 * *IPv4 auto-assign addresses/routes* - Automatically assign IPv4 addresses
   and routes upon creating a new node.
 * *IPv6 auto-assign addresses/routes* - Automatically assign IPv6 addresses
   and routes upon creating a new node.
 * *Auto-generate /etc/hosts file} - Create a \emph{hosts* file on every node
   and map every other node hostname with its address.
 * *Randomize MAC bytes* - Randomizes the 4th and 5th byte of the automatically
   generated MAC address.
 * *IPv4 address pool* - Set variable-mask IPv4 address pool through the
   invoked dialog in order to replace default 10.0.0.0/24 address pool (see
   Section [IPv4 Address Pool](#ipv4-address-pool)). This will be applied to
   all the subsequentially created network layer elements. 
 * *IPv6 address pool* - Set variable-mask IPv6 address pool through the
   invoked dialog in order to replace default fc00::/64 address pool (see
   Section [IPv6 Address Pool](#ipv6-address-pool)). This will be applied to
   all the subsequentially created network layer elements. 
 * *Routing protocol defaults* - Set the routing protocol defaults (routing
   model and protocols) through the invoked dialog (see Section [Routing
   Protocol Defaults](#routing-protocol-defaults)). This will be applied to all
   selected routers (if any) at the time of change, as well as to all the
   subsequentially created ones.

### [Topogen Menu](#topogen-menu)

The *TopoGen* menu ([@fig:topogen_menu]) contains options for simple and fast
specification of various network topologies (see Section [Generating a Network
Topology](#generating-a-network-topology)).

![Topogen menu\
](./assets/topogen_menu.png
){#fig:topogen_menu width=12%}

### [Widgets Menu](#widgets-menu)

The *Widgets* menu ([@fig:widgets_menu]) contains options for displaying
information about the virtual network. To see these information, place the
mouse pointer on the virtual node of interest after selecting a widget.

![Widgets menu\
](./assets/widgets_menu.png
){#fig:widgets_menu width=20%}

 * *None* - Do not show any information about the virtual network.
 * *ifconfig* - Show network interfaces parameters.
 * *IPv4 Routing table* - Show the IPv4 routing table.
 * *IPv6 Routing table* - Show the IPv6 routing table.
 * *RIP routes info* - Show the RIP routing information.
 * *RIPng routes info* - Show the RIPng routing information.
 * *Process list* - Show the running processes.
 * *IPv4 sockets* - Show the IPv4 sockets.
 * *IPv6 sockets* - Show the IPv6 sockets.
 * *View startup script* - Show the startup script /boot.conf
 * *View startup log* - Show the startup log /out.log
 * *Custom...* - Allows the specification of the command that will be executed
   inside a virtual node upon placing the mouse pointer on the virtual node.
   The result of the command will be displayed inside the widget. 

### [Events Menu](#events-menu)

The *Events* menu ([@fig:events_menu]) is used to configure event scheduling.
The event scheduling will be explained later in the Section [User-configurable
Event Scheduling](#user-configurable-event-scheduling).

![Events menu\
](./assets/events_menu.png
){#fig:events_menu width=15%}

 * *Start scheduling* - Start the scheduling of events.
 * *Stop scheduling* - Stop the scheduling of events.
 * *Event editor* - Schedule events on the links through the opened editor.

### [Experiment Menu](#experiment-menu)

![Experiment menu\
](./assets/experiment_menu.png
){#fig:experiment_menu width=25%}

{{include:generated-docs/menubarexperiment.md}}

See more details in the [IMUNES Architecture](#imunes-architecture) chapter.

### [Help Menu](#help-menu)

![Help menu\
](./assets/help_menu.png
){#fig:help_menu width=8%}

{{include:generated-docs/menubarhelp.md}}

### [Other menus](#other-menus)

![Bottom menu (TODO)\
](./assets/bottom_menu.png
){#fig:bottom_menu width=100%}

Bottom menu ([@fig:bottom_menu]) gives information about current experiment:

{{include:generated-docs/bottombar.md}}
