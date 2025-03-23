Message-of-the-day
==================

This role configures Message-of-the-day (MOTD).

Role Variables
--------------

The content of `/etc/motd` is defined in variable `motd_content`.

    motd_content: |
      My awesome message-of-the-day.

The file `/etc/motd` is removed when `motd_content` is not defined.

The role also supports `update-motd(5)` on Debian and Ubuntu OS. All scripts
from `/etc/update-motd.d/` are disabled by default. To enable an existing
script, add it to the list `motd_scripts`.

    motd_scripts:
      - name: 98-reboot-required

To add custom scripts or overwrite existing script, define the content of the
script in `motd_scripts`.

    motd_scripts:
      - name: 01-acme
        content: |
          printf "Welcome to ACME Inc."

Example Playbook
----------------

Add new scripts `01-cluster` and `99-footer` in `/etc/update-motd.d/` and
enable existing script `98-reboot-required`.

    - hosts: ubuntu
      become: true
      vars:
        motd_scripts:
          - name: 01-cowsay
            content: |
              /usr/games/cowsay Hello World
          - name: 98-reboot-required
          - name: 99-footer
            content: |
              printf "##############################\n"
      tasks:
        - name: Import role mila.linux_system.motd
          ansible.builtin.import_role:
            name: mila.linux_system.motd
          tags: role::motd
