Systemd
============

This role configures system-systemd drop-ins
Those drop-ins have higher precedence and override the main configuration file


Role Variables
--------------
* `default_timeout_stop`: default global stop timeout for systemd services, usually use to reduce the system-wide shutdown delay

Playbook Example
----------------

    - hosts: localhost
      become: true
      tasks:
        - name: Import role mila.linux_system.systemd
          ansible.builtin.import_role:
            name: mila.linux_system.systemd
          tags: role::systemd
