Repositories
============

This role configures repositories.

Current version only supports APT. Support of DNF/Yum will be added later.

Role Variables
--------------

    repositories_apt:
      - name: mila
        repository: "deb http://pkgs.mila.quebec/mila/debian/bookworm/ bookworm main"
        key: http://pkgs.mila.quebec/DEB-GPG-KEY-Mila
        key_checksum: 'sha256:2c80a9acdc591a79ced48b7ad3bbeac9322e1cc88fccd71dc158b668b77664da'

Playbook Example
----------------

    - hosts: localhost
      become: true
      tasks:
        - name: Import role mila.linux_system.repositories
          ansible.builtin.import_role:
            name: mila.linux_system.repositories
          tags: role::repositories
