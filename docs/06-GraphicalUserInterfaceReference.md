# [Graphical User Interface Reference](#graphical-user-interface-reference)

## [IMUNES Main Window](#imunes-main-window)

IMUNES GUI is a simple Tcl/Tk based management console, allowing specification
and management of virtual network topologies. Its main parts are the workspace
in the middle, called canvas, the menu bar on the top, the toolbox on the left
side and the status bar at the bottom ([@fig:imunes_gui]).

![IMUNES GUI\
](./assets/gui.png
){#fig:imunes_gui width=100%}

The default working mode after the initial start (or after creating a new
virtual network configuration file with the *File $\to$ New* option from the
menu bar) is `edit mode`. The `edit mode` is used to build and configure
network topologies, contrary to the `exec mode` whose purpose is the network
simulation. The network simulation will be explained later in the Section
[Simulating a Simple Network](#simulating-a-simple-network).

### [Working with IMUNES Canvas](#working-with-imunes-canvas)

### [IMUNES Canvas Reference](#imunes-canvas-reference)

### [Toolbox](#toolbox)

## [Menu Bar Reference](#menu-bar-reference)

The menu bar ([@fig:menubar]) consists of menus that provide access to various
functions. Some options from the menu bar are automatically disabled in the
execute mode. Options loaded from custom configuration are displayed in green,
while those additionally marked as `custom_override` are displayed in light gray
to indicate that they are read-only.

![Menu bar\
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

## [Toolbox Reference](#toolbox-reference)

The toolbox, placed on the left side of the GUI, contains tools for building
network topologies and tools for adding annotations ([@fig:toolbox_tools]).

![Toolbox tools\
](./assets/toolbox.png
){#fig:toolbox_tools width=70%}

Each toolbox item shown in [@fig:toolbox_tools], is described below.

{{include:generated-docs/selecttool.md}}

### [Link Tool](#toolbox-link-tool)

Link tool is explained in section [Link Tool](#link-tool).

### [Link-Layer Tools](#toolbox-link-layer-tools)

Link-layer tools are explained in section [Link-Layer Nodes](#link-layer-nodes):

 * [LAN Switch Node](#lan-switch-node)
 * [Hub Node](#hub-node)
 * [External Interface Node](#external-interface-node)
 * [RSTP Switch Node (FreeBSD only)](#rstp-switch-node)
 * [Filter Node (FreeBSD only)](#filter-node)
 * [Packet Generator Node (FreeBSD only)](#packet-generator-node)

### [Network-Layer Tools](#toolbox-network-layer-tools)

Network-layer tools are explained in section [Network-Layer Nodes](#network-layer-nodes):

 * [Router Node](#router-node)
 * [Host Node](#host-node)
 * [PC Node](#pc-node)
 * [NAT64 Node](#nat64-node)
 * [External Connection Node](#external-connection-node)
 * [Netns Node (Linux only)](#netns-node)

{{include:generated-docs/annotationtools.md}}

## [Status Bar Reference](#status-bar-reference)

The status bar shows various active options and information split accross
multiple sections ([@fig:status_bar]):

![Status bar (TODO)\
](./assets/status_bar.png
){#fig:status_bar width=100%}

{{include:generated-docs/status_bar.md}}

## [Context Menus](#context-menus)

{{include:generated-docs/canvas.md}}

{{include:generated-docs/node.md}}

{{include:generated-docs/ifaces.md}}

{{include:generated-docs/link.md}}

{{include:generated-docs/annotation.md}}

{{include:generated-docs/confignode.md}}

{{include:generated-docs/confignode_genericl3.md}}

{{include:generated-docs/configlink.md}}

{{include:generated-docs/misc.md}}

## [Editor Preferences](#editor-preferences)

## [Context-Sensitive Help](#context-sensitive-help)
