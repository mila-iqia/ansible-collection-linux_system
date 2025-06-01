# Mount

This role manages filesystem mounts on the system, including creating
mountpoints, filesystems, and mounting volumes.

## Role Variables

Check [defaults/main.yml](defaults/main.yml) for configuration variables.

### Main Variables

* `mount_volumes`: List of volumes to mount, each with the following properties:
  * `path`: Mount point path
  * `source`: Source device or NFS share
  * `fstype`: Filesystem type (default: ext4)
  * `opts`: Mount options
  * `state`: Mount state (default: mounted)
  * `owner`: Mount point owner (default: root)
  * `group`: Mount point group (default: root)
  * `mode`: Mount point permissions (default: 0755)

## Example Playbook

```yaml
- hosts: servers
  become: true
  vars:
    mount_volumes:
      - path: /network/home
        source: nfs.example.tld:/home
        fstype: nfs
        opts: 'vers=3'
      - path: /var/opt/slurm/localstorage
        source: /dev/nvme1n1
        fstype: ext4
        owner: root
        group: root
        mode: 1777
      - path: /opt/apps
        state: absent
        source: ''
  roles:
    - mila.linux_system.mount
```

## Dependencies

* community.general collection (for filesystem module)
* ansible.posix collection (for mount module)
