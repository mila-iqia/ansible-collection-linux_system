# Modules

This role installs and configures the Lmod environment modules system, along
with its dependencies and shell configurations. It provides a consistent module
environment across different Linux distributions.

## Features

* Installs Lmod and its dependencies:
  * Lua 5.1 and required libraries
  * TCL
  * Additional shell support (fish, zsh)
* Configures shell environments:
  * Bash profile integration
  * Csh/Tcsh integration
  * Fish shell integration (Debian only)
* Sets up Mila-specific configurations:
  * Links Mila default profiles
  * Configures Lmod initialization scripts

## Role Variables

### Required Variables

None

### Optional Variables

None

## Distribution Support

### Debian/Ubuntu
* Installs Lua 5.1 and development packages:
  * lua5.1
  * liblua5.1-0
  * liblua5.1-0-dev
  * lua-json
  * lua-filesystem
  * lua-filesystem-dev
  * lua-posix
  * tcl
* Installs additional shells:
  * fish
  * zsh
* Configures all shell environments (bash, csh, fish)

### RedHat/CentOS
* Installs Lua and required packages:
  * lua
  * lua-json
  * lua-filesystem
  * lua-posix
  * tcl
* Configures bash and csh environments

## Example Playbook

```yaml
- hosts: servers
  become: true
  roles:
    - mila.linux_system.modules
```

## Dependencies

None

## Notes

* The role assumes the presence of CVMFS for accessing Mila-specific configurations:
  * `/cvmfs/config.mila.quebec/` for Mila profiles
  * `/cvmfs/ai.mila.quebec/` for Lmod initialization scripts
* Shell configurations are installed in the appropriate system directories:
  * `/etc/profile.d/` for bash and csh
  * `/etc/fish/conf.d/` for fish (Debian only)
  * `/etc/zsh/` for zsh profile
* Module system is configured to work with the Mila software stack
