# CVMFS Options

This role configures additional options for CernVM-FS (CVMFS) repositories and
complements the Galaxy CVMFS role. It manages repository-specific
configurations and autofs settings.

## Features

* Configures additional options for CVMFS repositories:
  * Repository-specific client options
  * Config repository options
* Manages autofs configuration:
  * Sets up auto.master entry for CVMFS
  * Configures timeout settings
* Automatic autofs service management

## Role Variables

### Required Variables

None

### Optional Variables

* `cvmfs_config_repo`: Configuration for the config repository
  * `repository.repository`: Repository name
  * `repository.client_options`: List of client options
* `cvmfs_repositories`: List of repositories to configure
  * `repository`: Repository name
  * `client_configd`: List of client configurations

## Example Playbook

```yaml
- hosts: servers
  become: true
  vars:
    cvmfs_config_repo:
      repository:
        repository: config.mila.quebec
        client_options:
          - CVMFS_CLAIM_OWNERSHIP="no"
          - CVMFS_CONFIG_REPO_REQUIRED="yes"
    cvmfs_repositories:
      - repository: ai.mila.quebec
        client_configd:
          - LMOD_ARCH={{ ansible_facts['architecture'] | lower }}
          - LMOD_DISTRO={{ ansible_facts['os_family'] | lower }}
  roles:
    - mila.linux_system.cvmfs_opts
```

## Dependencies

* Galaxy CVMFS role (complements its functionality)

## Notes

* Configuration files are owned by root with appropriate permissions
* Changes to repository configurations trigger autofs service reload
* The role assumes CVMFS is already installed and configured
* Repository configurations are applied only if the repository is defined and supported
