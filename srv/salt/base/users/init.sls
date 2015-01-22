{% for user, config in pillar.get('users').items() %}
{{user}}:
  group.present:
    - name: {{user}}
    - gid: {{config.gid}}
  user.present:
    - name: {{user}}
    - shell: {{config.shell}}
    - uid: {{config.uid}}
    - gid: {{config.gid}}
    - require:
      - group: {{user}}
    - home: {{config.get('home', '/home/' + user)}}
  ssh_auth.present:
    - user: {{user}}
    - names:
      - {{config.pubkey}}
    - require:
      - user: {{user}}
  {% if config.sudo %}
  file.managed:
    - name: /etc/sudoers.d/{{user}}
    - contents: "{{user}} ALL=(ALL) NOPASSWD: ALL"
  {% endif %}
{% endfor %}
