# Environment

This role manages system-wide environment configuration files and shell
initialization scripts.

## Features

* Configure `/etc/environment` with system-wide environment variables
* Manage shell initialization scripts in `/etc/profile.d/`
* Configure bash to source `/etc/profile.d/` in `/etc/bash.bashrc`
* Support CC/DRAC environment configuration
* Configure HTTP proxy module for Lmod

## Role Variables

Check [defaults/main.yml](defaults/main.yml) for configuration variables.

### Main Variables

* `environment_file`: Content for `/etc/environment`
* `environment_source_profiled`: Whether to source `/etc/profile.d/` in bash (default: true)
* `environment_profile_files`: List of files to manage in `/etc/profile.d/`
* `environment_cc_env`: Whether to configure CC/DRAC environment (default: false)
* `environment_proxy_http`: HTTP proxy URL for Lmod configuration
* `environment_proxy_https`: HTTPS proxy URL for Lmod configuration
* `environment_proxy_rsync`: Rsync proxy URL for Lmod configuration
* `environment_no_proxy`: Comma-separated list of hosts that should not be proxied

## Example Playbook

```yaml
- hosts: servers
  become: true
  vars:
    environment_file: |
      PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
      LANG=en_US.UTF-8
    environment_profile_files:
      - name: 99-custom.sh
        content: |
          # Custom environment variables
          export CUSTOM_VAR=value
    environment_proxy_http: http://squid.example.tld:3128
    environment_proxy_https: http://squid.example.tld:3128
    environment_proxy_rsync: squid.example.tld:3128
    environment_no_proxy: example.tld
  roles:
    - mila.linux_system.environment
```

## Dependencies

None
