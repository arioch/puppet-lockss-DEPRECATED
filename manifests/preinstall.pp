# = Class: lockss::preinstall
#
# This class installs the lockss application
#
class lockss::preinstall inherits lockss::params {
  case $operatingsystem {
    /RedHat|CentOS|Scientific|OEL|Amazon/: {
      yumrepo { 'lockss':
        descr    => 'LOCKSS Daemon Repository ',
        baseurl  => 'http://www.lockss.org/repo/',
        gpgkey   => 'http://www.lockss.org/LOCKSS-GPG-RPM-KEY',
        enabled  => 1,
        gpgcheck => 1;
      }
    }

    default: {
      fail 'The target operatingsystem is not supported.'
    }
  }
}

