install_nginx:
  pkg.installed:
    - name: nginx
  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx
