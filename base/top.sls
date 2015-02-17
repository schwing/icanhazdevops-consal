base:
  '*':
    - common.users
    - common.packages
    - common.gems
  '*webhead*':
    - webhead.nginx
    - webhead.site_content
