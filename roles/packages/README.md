# Packages

A simple role for installing/removing packages without any configuration steps.

To install a package, add it to `packages_install_list`:

```yaml
packages_install_list:
  - ansible
  - python3
```

To remove a package, add it to `packages_remove_list`:

```yaml
packages_remove_list:
  - puppet
```
