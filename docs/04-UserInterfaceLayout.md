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
execute mode. Options loaded from custom configuration are displayed in green,
while those additionally marked as `custom_override` are displayed in light gray
to indicate that they are read-only.

![Menubar\
](./assets/menubar.png
){#fig:menubar width=100%}

{{include:generated-docs/menubarfile.md}}

{{include:generated-docs/menubaredit.md}}

{{include:generated-docs/menubarcanvas.md}}

{{include:generated-docs/menubarview.md}}

{{include:generated-docs/menubartools.md}}

{{include:generated-docs/menubartopogen.md}}

{{include:generated-docs/menubarwidgets.md}}

{{include:generated-docs/menubarevents.md}}

{{include:generated-docs/menubarexperiment.md}}

{{include:generated-docs/menubarhelp.md}}

### [Other menus](#other-menus)

![Bottom menu (TODO)\
](./assets/bottom_menu.png
){#fig:bottom_menu width=100%}

Bottom menu ([@fig:bottom_menu]) gives information about current experiment:

{{include:generated-docs/bottombar.md}}

### [Testing...](#testing)

{{include:generated-docs/canvas.md}}

{{include:generated-docs/node.md}}

{{include:generated-docs/ifaces.md}}

{{include:generated-docs/link.md}}

{{include:generated-docs/annotation.md}}

{{include:generated-docs/confignode.md}}

{{include:generated-docs/configlink.md}}

{{include:generated-docs/misc.md}}
