config_icanhazdevops:
  file.managed:
    - name: /etc/nginx/sites-available/icanhazdevops.conf
    - source: salt://files/nginx/servers.conf
    - listen_in:
      - service: service_nginx
  require:
    - pkg: install_nginx

enable_icanhazdevops:
  file.symlink:
    - name: /etc/nginx/sites-enabled/icanhazdevops.conf
    - target: /etc/nginx/sites-available/icanhazdevops.conf
    - listen_in:
      - service: service_nginx

disable_default:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - listen_in:
      - service: service_nginx
