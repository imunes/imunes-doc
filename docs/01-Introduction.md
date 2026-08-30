# [Introduction](#introduction)

IMUNES is an Integrated Multiprotocol Network Emulator / Simulator of IP based
networks. Virtual nodes in IMUNES are multiple network stack instances that are
formed through special FreeBSD kernel modifications and Docker containters on
Linux. Virtual nodes can be linked either with other virtual nodes or with the
physical network interface through simulated links. All virtual nodes share a
single place for their application binaries and libraries. The main strengths
of this tool are high scalability, performance and fidelity.

## [Document Overview](#document-overview)

This document is intended to be a manual for users that are getting started
with IMUNES, likewise for the ones that want to know more about its advanced
features.

The first part, [Quick Intro](#quick-intro), is intended to prepare beginners
to get a working network simulation in a short time. It gives detailed
explanations for building, configuring and simulating a simple network. At the
end it gives instructions related to IMUNES configuration files.

The second part, [IMUNES Architecture](#imunes-architecture), defines the core
concepts of IMUNES and describes how IMUNES works internally on supported
platforms (FreeBSD and Linux).

The third part, [User Interface Layout](#user-interface-layout), gives detailed
description of IMUNES graphical user interface. 

The forth part, [Advanced Usage](#advanced-usage), gives instructions for
extending the network topology built in the first section. It also explains the
usage of additional tools and configuration possibilities. It proceeds with
features for customizing look, such as annotations, background image and icon
size. At the end, it gives instructions related to event scheduling, starting
and terminating simulation through command-line interface and himage, hcp and
vlink commands.
