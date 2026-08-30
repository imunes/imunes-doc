# [Appendix A: IMUNES Network Configuration File](#appendix-a-imunes-network-configuration-file)

Here is the example of IMUNES network configuration file for the network
topology shown in [@fig:network_topology] 

![Network topology\
](./assets/topology_example.png
){#fig:network_topology}

```json
{
  "nodes": {
    "n0": {
      "type": "router",
      "model": "quagga",
      "name": "office-router",
      "router_config": "rip 1 ripng 1",
      "ifaces": {
        "ifc0": {
          "name": "lo0",
          "type": "lo",
          "ipv4_addrs": [
            "127.0.0.1/8"
          ],
          "ipv6_addrs": [
            "::1/128"
          ]
        },
        "ifc1": {
          "name": "eth0",
          "mac": "42:00:aa:00:00:02",
          "ipv4_addrs": [
            "192.168.1.1/24"
          ],
          "type": "phys",
          "link": "l2"
        },
        "ifc2": {
          "name": "eth1",
          "mac": "42:00:aa:00:00:03",
          "ipv4_addrs": [
            "192.168.2.1/24"
          ],
          "ipv6_addrs": [
            "fc00:1::1/64"
          ],
          "type": "phys",
          "link": "l3"
        }
      },
      "auto_default_routes": "disabled"
    },
    "n1": {
      "type": "host",
      "name": "office-host",
      "ifaces": {
        "ifc0": {
          "name": "lo0",
          "type": "lo",
          "ipv4_addrs": [
            "127.0.0.1/8"
          ],
          "ipv6_addrs": [
            "::1/128"
          ]
        },
        "ifc1": {
          "name": "eth0",
          "mac": "42:00:aa:00:00:04",
          "ipv4_addrs": [
            "192.168.2.5/24"
          ],
          "type": "phys",
          "link": "l3"
        }
      },
      "croutes4": [
        "0.0.0.0/0 192.168.2.1"
      ],
      "auto_default_routes": "disabled"
    },
    "n2": {
      "type": "lanswitch",
      "name": "office-switch",
      "ifaces": {
        "ifc0": {
          "name": "e0",
          "ifc_qdisc": "WFQ",
          "type": "phys",
          "link": "l0"
        },
        "ifc1": {
          "name": "e1",
          "ifc_qdisc": "WFQ",
          "type": "phys",
          "link": "l1"
        },
        "ifc2": {
          "name": "e2",
          "ifc_qdisc": "WFQ",
          "type": "phys",
          "link": "l2"
        }
      }
    },
    "n3": {
      "type": "pc",
      "name": "office-pc1",
      "ifaces": {
        "ifc0": {
          "name": "lo0",
          "type": "lo",
          "ipv4_addrs": [
            "127.0.0.1/8"
          ],
          "ipv6_addrs": [
            "::1/128"
          ]
        },
        "ifc1": {
          "name": "eth0",
          "mtu": "1500",
          "mac": "42:00:aa:00:00:00",
          "ipv4_addrs": [
            "192.168.1.5/24"
          ],
          "type": "phys",
          "link": "l0"
        }
      },
      "croutes4": [
        "192.168.2.0/24 192.168.1.1"
      ],
      "custom_configs": {
        "NODE_CONFIG": [
          {
            "custom_name": "newconf",
            "custom_command": "/bin/sh",
            "custom_config": [
              "ifconfig lo0 inet 127.0.0.1/8",
              "ifconfig eth0 inet 192.168.1.5/24",
              "",
              "route -q add -inet 192.168.2.0/24 192.168.1.1",
              "",
              "echo \"Success!\" > /tmp/log",
              "ifconfig vlan0"
            ]
          }
        ]
      },
      "custom_enabled": "true",
      "custom_selected": "NODE_CONFIG newconf",
      "auto_default_routes": "disabled"
    },
    "n4": {
      "type": "pc",
      "name": "office-pc2",
      "ifaces": {
        "ifc0": {
          "name": "lo0",
          "type": "lo",
          "ipv4_addrs": [
            "127.0.0.1/8"
          ],
          "ipv6_addrs": [
            "::1/128"
          ]
        },
        "ifc1": {
          "name": "eth0",
          "mac": "42:00:aa:00:00:01",
          "ipv4_addrs": [
            "192.168.1.7/24"
          ],
          "type": "phys",
          "link": "l1"
        }
      },
      "croutes4": [
        "192.168.2.0/24 192.168.1.1"
      ],
      "auto_default_routes": "disabled"
    }
  },
  "links": {
    "l0": {
      "peers": "n3 n2",
      "peers_ifaces": "ifc1 ifc0"
    },
    "l1": {
      "peers": "n4 n2",
      "peers_ifaces": "ifc1 ifc1"
    },
    "l2": {
      "delay": "30000",
      "peers": "n2 n0",
      "peers_ifaces": "ifc2 ifc1",
      "bandwidth": "0"
    },
    "l3": {
      "peers": "n0 n1",
      "peers_ifaces": "ifc2 ifc1",
      "bandwidth": "0"
    }
  },
  "gui": {
    "options": {
      "show_interface_names": "1",
      "show_interface_ipv4": "1",
      "show_interface_ipv6": "0",
      "show_node_labels": "1",
      "show_link_labels": "0",
      "show_background_image": "0",
      "show_annotations": "1",
      "show_grid": "0",
      "icon_size": "normal",
      "zoom": "1.0"
    },
    "canvases": {
      "c0": {
        "name": "office-canvas"
      }
    },
    "annotations": {
      "a0": {
        "type": "rectangle",
        "iconcoords": "53 16 517 409",
        "color": "#ffffff",
        "bordercolor": "black",
        "width": "3",
        "rad": "53.6",
        "canvas": "c0"
      },
      "a1": {
        "type": "text",
        "iconcoords": "281 40",
        "label": "Office",
        "labelcolor": "#000000",
        "font": "-family {DejaVu Sans} -size 10 -weight bold -slant roman -underline 0 -overstrike 0",
        "canvas": "c0"
      },
      "a2": {
        "type": "rectangle",
        "iconcoords": "338 254 716 584",
        "color": "#b8d4e6",
        "bordercolor": "#000000",
        "width": "3",
        "rad": "30.78918918918919",
        "canvas": "c0"
      },
      "a3": {
        "type": "text",
        "iconcoords": "559 552",
        "label": "Server room",
        "labelcolor": "black",
        "font": "-family {DejaVu Sans} -size 10 -weight bold -slant roman -underline 0 -overstrike 0",
        "canvas": "c0"
      },
      "a4": {
        "type": "text",
        "iconcoords": "560 201",
        "label": "Simple network topology",
        "labelcolor": "black",
        "font": "-family {DejaVu Sans} -size 14 -weight normal -slant italic -underline 0 -overstrike 0",
        "canvas": "c0"
      }
    },
    "links": {
      "l0": {
        "peers": "n3 n2"
      },
      "l1": {
        "peers": "n4 n2"
      },
      "l2": {
        "peers": "n2 n0"
      },
      "l3": {
        "peers": "n0 n1"
      }
    },
    "nodes": {
      "n0": {
        "label": "office-router",
        "canvas": "c0",
        "iconcoords": "624 336",
        "labelcoords": "624 361"
      },
      "n1": {
        "label": "office-host",
        "canvas": "c0",
        "iconcoords": "408 528",
        "labelcoords": "408 564"
      },
      "n2": {
        "label": "office-switch",
        "canvas": "c0",
        "iconcoords": "408 192",
        "labelcoords": "408 215"
      },
      "n3": {
        "label": "office-pc1",
        "canvas": "c0",
        "iconcoords": "192 48",
        "labelcoords": "192 79"
      },
      "n4": {
        "label": "office-pc2",
        "canvas": "c0",
        "iconcoords": "192 360",
        "labelcoords": "192 391"
      }
    }
  },
  "options": {
    "auto_etc_hosts": "0",
    "version": "4"
  }
}
```
