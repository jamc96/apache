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
  # home
  file { $apache::home_dir_path: ensure => directory }
  # configurations
  $apache::config_dir_path.each |$name| {
    file { $name:
      ensure  => directory,
      require => File[$apache::home_dir_path],
    }
  }
  file { $apache::log_dir_path:
    ensure => directory,
    mode   => '0775',
  }
  # create config files
  file { $apache::config_file_path:
    mode    => '0755',
    notify  => Service[$apache::service_name],
    require => File[$apache::home_dir_path],
  }
}


