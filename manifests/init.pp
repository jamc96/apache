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
  String $home_dir_path,
  Array $config_dir_path,
  String $config_owner,
  String $config_group,
  String $log_dir_path,
  Enum['running','stopped'] $service_ensure,
  String $service_name,
) {
  # class containment
  include ::apache::install
  include ::apache::config
  include ::apache::service
}
