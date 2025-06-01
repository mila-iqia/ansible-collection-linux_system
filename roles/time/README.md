# Time

This role configures time synchronization and timezone settings on the system
using Chrony, a modern NTP client and server.

## Role Variables

Check [defaults/main.yml](defaults/main.yml) for configuration variables.

### Main Variables

* `time_timezone`: System timezone (default: 'America/Toronto')
* `time_servers`: List of NTP servers to use (default: ['0.pool.ntp.org'])

## Features

* Configures system timezone using `community.general.timezone` module
* Installs and configures Chrony for NTP synchronization
* Configures Chrony with:
  * Kernel synchronization (rtcsync)
  * Step adjustment for large time differences
  * Maximum update skew protection
  * Burst mode for faster initial synchronization
  * Custom NTP servers

## Example Playbook

```yaml
- hosts: servers
  become: true
  vars:
    time_timezone: "Europe/Paris"
    time_servers:
      - 0.ca.pool.ntp.org
      - 1.ca.pool.ntp.org
      - 2.ca.pool.ntp.org
      - 3.ca.pool.ntp.org
  roles:
    - mila.linux_system.time
```

## Dependencies

* community.general collection (for timezone module)
