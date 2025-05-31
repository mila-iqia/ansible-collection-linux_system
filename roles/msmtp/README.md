# MSMTP

This role installs and configures MSMTP, a simple SMTP client that can be used to
send mail from the command line. It can also be configured as a Mail Transfer
Agent (MTA) for system-wide email delivery.

## Role Variables

### Required Variables

* `msmtp_host`: SMTP server hostname (default: smtp.gmail.com)
* `msmtp_port`: SMTP server port (default: 587)
* `msmtp_user`: SMTP username
* `msmtp_from`: Sender email address
* `msmtp_password`: SMTP password

### Optional Variables

* `msmtp_mta_enabled`: Enable MSMTP as system MTA (default: false)

## Features

* Installs MSMTP package
* Configures MSMTP with:
  * TLS encryption
  * STARTTLS support
  * SMTP authentication
  * Custom SMTP server settings
* Optional MTA configuration:
  * Installs msmtp-mta package
  * Enables and starts msmtpd service

## Example Playbook

```yaml
- hosts: servers
  become: true
  vars:
    msmtp_host: smtp.gmail.com
    msmtp_port: 587
    msmtp_user: user@gmail.com
    msmtp_from: user@gmail.com
    msmtp_password: "{{ vault_msmtp_password }}"
    msmtp_mta_enabled: true
  roles:
    - mila.linux_system.msmtp
```

## Security Notes

* The MSMTP configuration file (/etc/msmtprc) is owned by root and has group
  ownership set to msmtp with permissions 0640
* It is recommended to store the SMTP password in Ansible Vault
* TLS certificate verification is disabled by default

## Dependencies

None
