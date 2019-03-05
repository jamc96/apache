# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include apache::install
class apache::install {
  # default values
  Package {
    ensure   => $apache::package_ensure,
    provider => 'yum',
  }
  # install packages
  $apache::packages.each |$name| { package { $name: } }
  # install modules
  $apache::modules.each |$name| { package { $name: } }
}
