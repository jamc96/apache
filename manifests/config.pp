# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include apache::config
class apache::config {
  # default values
  File {
    ensure => $apache::config_ensure,
    owner  => 'apache',
    group  => 'apache',
  }
  # create directories
  $apache::config_dir_path.each |$name| {
    file { $name: ensure => directory }
  }
  file { $apache::log_dir_path:
    ensure => directory,
    mode   => '0775',
  }
  # create config files
  file { $apache::config_file_path: require => File['/etc/httpd/conf'] }
}


