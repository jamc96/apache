# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include apache::service
class apache::service {
  # create service
  service { 'httpd':
    ensure     => $apache::service_ensure,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
