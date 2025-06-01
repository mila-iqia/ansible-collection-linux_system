# Multipath

This role configures the Linux Device Mapper Multipath (DM-Multipath) for
managing multiple paths to storage devices. It is specifically designed for Red
Hat-based systems.

## Role Variables

The following variables are required and must be defined in your inventory:

* `multipath_vendor`: Storage device vendor name
* `multipath_product`: Storage device product name
* `multipath_volumes`: List of multipath volumes to configure, each with:
  * `wwid`: World Wide Identifier of the device
  * `name`: Friendly name for the device

## Features

* Installs device-mapper-multipath package
* Configures multipath.conf with:
  * Default settings for multipath discovery and naming
  * Device-specific settings for your storage array
  * ALUA (Asymmetric Logical Unit Access) support
  * Path grouping by priority
  * Immediate failback
  * Service-time based path selection
* Configures multipath volumes with friendly names

## Example Playbook

```yaml
- hosts: servers
  become: true
  vars:
    multipath_vendor: "NETAPP"
    multipath_product: "LUN"
    multipath_volumes:
      - wwid: "3600508b400105e210000900000490000"
        name: "netapp_lun1"
      - wwid: "3600508b400105e210000900000490001"
        name: "netapp_lun2"
  roles:
    - mila.linux_system.multipath
```

## Dependencies

None
