# Cgroups

This role configures Linux Control Groups (cgroups) on the system.

## Role Variables

Check [defaults/main.yml](defaults/main.yml) for configuration variables.

## Example Playbook

```yaml
- hosts: servers
  become: true
  roles:
    - mila.linux_system.cgroups
```

## Dependencies

None
