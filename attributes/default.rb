default['vagrant-main']['ruby_gems'] = ['compass', 'bundler']
default['vagrant-main']['npm_packages'] = ['foreman', 'grunt-cli']
default['vagrant-main']['install_heroku'] = false
default['vagrant-main']['apt_packages'] =  [
  'php5-common', 'php5-cli', 'php5-intl', 'php5-curl', 'php5-fpm',
  'php5-gd', 'php5-mysql', 'php5-pgsql', 'php5-sqlite', 'php5-mcrypt',
  'php5-apc'
]
default['vagrant-main']['php_ini_locations'] = [
  '/etc/php5/fpm/php.ini', '/etc/php5/cli/php.ini'
]
default['vagrant-main']['phpunit_executable_path'] = '/usr/local/bin/phpunit'
default['vagrant-main']['composer_executable_path'] = '/usr/local/bin/composer'
