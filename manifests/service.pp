# = Class: lockss::service
#
# This class provides configuration for lockss
#
class lockss::service inherits lockss::params {
  exec { 'Refresh config':
    command => "${conf_dir}/hostconfig < ${conf_dir}/.answers",
    notify  => Service[$daemon_name],
    require => File["${conf_dir}/.answers"];
  }

  service { $daemon_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
  }
}

