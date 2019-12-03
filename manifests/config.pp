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
    owner  => $apache::config_owner,
    group  => $apache::config_group,
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
    mode   => $apache::log_dir_mode,
  }
  exec { 'logs permissions':
    command     => "chown -R ${apache::config_owner}:${apache::config_group} ${$apache::log_dir_path}",
    path        => ['/usr/bin', '/usr/sbin'],
    refreshonly => true,
    subscribe   => File[$apache::log_dir_path],
  }
  # create config files
  file { $apache::config_file_path:
    mode    => '0755',
    notify  => Service[$apache::service_name],
    require => File[$apache::home_dir_path],
  }
}


