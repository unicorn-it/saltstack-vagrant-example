mysql:
  global:
    client-server:
      default_character_set: utf8

  clients:
    mysql:
      default_character_set: utf8
    mysqldump:
      default_character_set: utf8

  library:
    client:
      default_character_set: utf8

  server:
    # Use this account for database admin (defaults to root)
    root_user: 'root'
    # root_password: '' - to have root@localhost without password
    root_password: 'somepass'
    root_password_hash: '*13883BDDBE566ECECC0501CDE9B293303116521A'
    user: mysql
    # If you only manage the dbs and users and the server is on
    # another host
    host: 123.123.123.123
    # my.cnf sections changes
    mysqld:
      # you can use either underscore or hyphen in param names
      bind-address: 0.0.0.0
      log_bin: /var/log/mysql/mysql-bin.log
      port: 3307
      binlog_do_db: foo
      auto_increment_increment: 5
    mysql:
      # my.cnf param that not require value
      no-auto-rehash: noarg_present

  salt_user:
    salt_user_name: 'root'
    salt_user_password: 'somepass'
    grants:
      - 'all privileges'

  # Manage databases
  database:
    - saltstack_vagrant
  schema:
    saltstack_vagrant:
      load: False
      #source: salt://mysql/files/foo.schema

  # Manage users
  # you can get pillar for existing server using scripts/import_users.py script
  user:
    unicorn:
      password: 'somepass'
      host: localhost
      databases:
        - database: saltstack_vagrant
          grants: ['all privileges']
    nopassuser:
      password: ~
      host: localhost
      databases: []

  # Override any names defined in map.jinja
  lookup:
    server: mysql-server
    client: mysql-client
    service: mysql-service
    python: python-mysqldb

  # Install MySQL headers
  dev:
    # Install dev package - defaults to False
    install: True
