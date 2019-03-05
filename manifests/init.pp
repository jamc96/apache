# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include apache
class apache(
  Array $packages,
  Array $modules,
  Enum['present', 'absent'] $package_ensure,
  Enum['present', 'absent'] $config_ensure,
  String $config_file_path,
  Array $config_dir_path,
  String $log_dir_path,
  Enum['running','stopped'] $service_ensure,
) {
  # class containment
  include ::apache::install
  include ::apache::config
  include ::apache::service
  # class relationship
  Class['::apache::install']
  -> Class['::apache::config']
  ~> Class['::apache::service']
