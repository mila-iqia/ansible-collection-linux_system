# Fail2ban

This role installs and configures Fail2ban, an intrusion prevention software
framework that protects computer servers from brute-force attacks.

## Features

* Installs and configures Fail2ban service
* Configures basic protection settings:
  * SSH brute force protection
  * Custom ban time and retry limits
  * Email notifications
* Optional Slack integration for notifications
* Customizable filter and jail configurations
* Support for custom action scripts
* Automatic service management:
  * Service enabled at boot
  * Automatic restart on configuration changes

## Role Variables

### Required Variables

None

### Optional Variables

#### Basic Configuration
* `fail2ban_bantime`: Duration of IP ban (default: 1h)
* `fail2ban_findtime`: Time window to count failures (default: 5m)
* `fail2ban_maxretry`: Number of failures before ban (default: 10)

#### Notification Settings
* `fail2ban_admin_mail`: Admin email address for notifications (default: admin@domain.tld)
* `fail2ban_slack_webhook`: Slack webhook URL for notifications (optional)

#### Custom Configuration Files
* `fail2ban_filter_d_conf_files`: List of filter.d configuration files to copy
* `fail2ban_jail_d_conf_templates`: List of jail.d configuration templates to deploy
* `fail2ban_action_d_conf_templates`: List of action.d configuration templates to deploy
* `fail2ban_action_d_sh_templates`: List of action.d shell script templates to deploy

## Available Files and Templates

The role includes several predefined configuration files and templates:

### Filter Files
* `nginx-ssh-filter.conf`: Custom filter for SSH attempts through Nginx

### Configuration Templates
* `defaults-debian-loginnodes.conf.j2`: Default settings for login nodes
* `defaults-debian-webservers.conf.j2`: Default settings for web servers
* `ignore.conf.j2`: IP addresses to ignore (whitelist)
* `sendmail.conf.j2`: Email notification configuration
* `slack-notify.conf.j2`: Slack notification integration
* `username.sh.j2`: Script to extract usernames from failed attempts

> **Note**: The current implementation has a limited set of predefined configurations. 
> Contributions to make this role more configurable and flexible are welcome. 
> Potential improvements could include:
> * More filter templates for common services
> * Additional jail configurations
> * Customizable action templates
> * Support for different notification methods
> Please feel free to submit merge requests to enhance the role's functionality.

## Example Playbook

```yaml
- hosts: servers
  become: true
  vars:
    # Basic configuration
    fail2ban_bantime: 1h
    fail2ban_findtime: 5m
    fail2ban_maxretry: 5

    # Notification settings
    fail2ban_admin_mail: admin@example.com
    fail2ban_slack_webhook: "https://hooks.slack.com/services/your-webhook-url"
  roles:
    - mila.linux_system.fail2ban
```

## Security Notes

* Fail2ban configuration files are owned by root with 0644 permissions
* Sensitive information (like Slack webhooks) should be stored in Ansible Vault
* Default configuration provides basic protection against common attacks
* Custom filters and jails can be added for specific services

## Dependencies

None
