# = Class: lockss::install
#
# This class installs the lockss application
#
class lockss::install inherits lockss::params {
  Package {
    require => Class['lockss::preinstall'],
  }

  package {
    $package_list:
      ensure => present;

    $package_deps:
      ensure => present;
  }
}

