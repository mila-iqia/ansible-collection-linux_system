# Ansible Collection - mila.linux_system

This collection provides a comprehensive set of roles for configuring and
managing Linux systems. While originally developed for the Mila infrastructure,
most roles are designed to be environment-agnostic and can be used in any Linux
environment. The collection is now open source to benefit the wider community.

## Overview

The collection is designed to provide a standardized way to configure Linux
systems, ensuring consistency across different machines and making system
administration more efficient. While some roles may have Mila-specific
configurations, contributions are welcome to make them more generic and
adaptable to other environments.

## Features

* **System Configuration**
  * Environment setup
  * Package management
  * Time synchronization
  * Message of the day (MOTD)
  * PAM configuration
  * Cgroups setup

* **Security**
  * Fail2ban intrusion prevention
  * Local user management
  * SSH key management
  * Service account configuration

* **Storage and Mounting**
  * CVMFS configuration
  * Multipath device management
  * Mount point configuration

* **System Services**
  * MSMTP email configuration
  * Lmod environment modules

## Roles

### System Configuration
* [cgroups](roles/cgroups/README.md) - Control groups configuration
* [environment](roles/environment/README.md) - System environment configuration
* [motd](roles/motd/README.md) - Message of the day configuration
* [packages](roles/packages/README.md) - Package management
* [pam](roles/pam/README.md) - PAM authentication configuration
* [time](roles/time/README.md) - Time synchronization

### Security
* [fail2ban](roles/fail2ban/README.md) - Intrusion prevention system
* [local_users](roles/local_users/README.md) - Local user management

### Storage and Mounting
* [cvmfs_opts](roles/cvmfs_opts/README.md) - CVMFS configuration options
* [mount](roles/mount/README.md) - Mount point management
* [multipath](roles/multipath/README.md) - Multipath device configuration

### System Services
* [modules](roles/modules/README.md) - Lmod environment modules
* [msmtp](roles/msmtp/README.md) - Email configuration

## Installation

```bash
ansible-galaxy collection install mila.linux_system
```

## Usage

Include the collection in your playbook:

```yaml
collections:
  - mila.linux_system
```

Then use the roles as needed:

```yaml
- hosts: servers
  roles:
    - mila.linux_system.environment
    - mila.linux_system.local_users
    - mila.linux_system.fail2ban
```

## Requirements

* Ansible 2.9 or higher
* Target systems running Linux
* Appropriate permissions for system configuration

## License

This collection is licensed under the MIT License. See the [LICENSE](LICENSE)
file for details.

## Contributing

Contributions are welcome! This collection was made open source to benefit the
wider community. We encourage contributions to:

* Make Mila-specific roles more generic and adaptable
* Add support for additional Linux distributions
* Improve documentation and examples
* Add new features and functionality
* Fix bugs and issues

Please feel free to submit a Pull Request.

## Support

For issues and feature requests, please use the [GitHub issue
tracker](https://github.com/mila-iqia/ansible-collection-linux_system/issues).
