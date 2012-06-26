# = Class: lockss::firewall
#
# This class provides configuration for lockss
#
class lockss::firewall {
  concat::fragment { '/etc/sysconfig/iptables.lockss':
    target => '/etc/sysconfig/iptables',
    source => 'puppet:///modules/lockss/iptables',
    order  => 200,
  }
}

