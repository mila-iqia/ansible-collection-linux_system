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
  * Zsh profile configuration

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

### RedHat/CentOS
* Installs Lua and required packages:
  * lua
  * lua-json
  * lua-filesystem
  * lua-posix
  * tcl

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

* The role installs a global zsh profile by copying a `zprofile` file to
  `/etc/zsh/` that sources `/etc/profile`.
