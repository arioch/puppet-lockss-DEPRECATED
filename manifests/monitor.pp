# = Class: lockss::monitor
#
# This class provides monitoring configuration for lockss
#
class lockss::monitor {
  @@nagios_service { "check_http_lockss_${::hostname}":
    check_command       => 'check_http',
    use                 => 'generic-service',
    host_name           => $::fqdn,
    notification_period => '24x7',
    service_description => 'check_http_lockss',
    action_url          => '/pnp4nagios/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',
    target              => "/etc/icinga/objects/services/${::fqdn}.cfg",
  }
}

