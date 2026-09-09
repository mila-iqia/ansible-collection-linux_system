AI Agents Config
==================
Ansible role to deploy AI agents config files, allowing for example sending telemetry.
The templates are searched in your Ansible inventory, but if they don't exist they're taken from this role `templates` folder.

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml).

To declare AI agents and the path to their config filei:

    ai_agents_config_agents:
      - name: claude
        src: claude.json.j2
        dest: /etc/claude-code/managed-settings.json
      - name: codex
        src: codex.toml.j2
        dest: /etc/codex/config.toml

Example Playbook
----------------

    - hosts: computes
      tasks:
        - name: Import role mila.linux_system.ai_agents_config
          ansible.builtin.import_role:
            name: mila.linux_system.ai_agents_config
          tags: role::ai_agents_config

Note: for this minimalist telemetry example to work, you would need to set environment variables for your collector (`OTEL_EXPORTER_OTLP_ENDPOINT` for OTEL, etc).
