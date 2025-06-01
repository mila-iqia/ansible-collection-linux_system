# Local Users

This role manages local user accounts on Linux systems, including administrators,
operators, service accounts, and automation users. It provides a structured way to
manage different types of users with appropriate permissions and configurations.

## Features

* User Management:
  * Administrator accounts with sudo privileges
  * Operator accounts with specific permissions
  * Service accounts for automated tasks
  * Automation user for Ansible operations
* Group Management:
  * Dedicated groups for each user type
  * Configurable group IDs
* SSH Key Management:
  * Centralized authorized keys management
  * Support for remote key fetching
  * Key caching for performance
* Security Features:
  * Passwordless sudo for administrators
  * Secure file permissions
  * Automatic cleanup of removed users

## Role Variables

### Required Variables

* `local_users_admins`: List of administrator users
  * `name`: Username
  * `uid`: User ID
  * `password`: User password
  * `shell`: Login shell (default: /bin/bash)

### Optional Variables

* `local_users_operators`: List of operator users
  * `name`: Username
  * `uid`: User ID
  * `password`: User password
  * `shell`: Login shell (default: /bin/bash)
* `local_users_service_accounts`: List of service accounts
  * `name`: Username
  * `uid`: User ID
  * `password`: User password
  * `shell`: Login shell (default: /bin/bash)
* `local_users_ansible_pub_key`: SSH public key for automation user
* `local_users_security_gitlab_runners`: List of GitLab runner IP addresses
* `local_users_authorized_keys_url`: URL to fetch authorized keys from
* `local_users_authorized_keys_path`: Path to authorized keys script
* `local_users_authorized_keys_cache`: Path for authorized keys cache

### Group IDs

* `local_users_admins_gid`: GID for administrators group (default: 2000)
* `local_users_operators_gid`: GID for operators group (default: 3000)
* `local_users_service_accounts_gid`: GID for service accounts group (default: 4000)

## Example Playbook

```yaml
- hosts: servers
  become: true
  vars:
    local_users_admins:
      - name: admin1
        uid: 2001
        password: "{{ vault_admin1_password }}"
      - name: admin2
        uid: 2002
        password: "{{ vault_admin2_password }}"
    local_users_operators:
      - name: operator1
        uid: 3001
        password: "{{ vault_operator1_password }}"
    local_users_service_accounts:
      - name: service1
        uid: 4001
        password: "{{ vault_service1_password }}"
    local_users_authorized_keys_url: "https://example.com/authorized_keys"
  roles:
    - mila.linux_system.local_users
```

## Dependencies

None

## Notes

* All user passwords should be stored in Ansible Vault
* The role automatically removes users that are no longer defined in the inventory
* Administrator users get passwordless sudo access
* The role requires curl and sudo packages to be available