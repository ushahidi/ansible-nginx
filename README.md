ushahidi.nginx
=========

Install nginx and enable vhosts

Role Variables
--------------


Dependencies
------------

- ushahidi.common

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: ushahidi.nginx, vhosts: [{ src: "{{playbook_dir}}/roles/platform-client/templates/nginx-platform-client.j2", dest: 'platform-client' }] }

License
-------

BSD
