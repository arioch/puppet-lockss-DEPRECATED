# = Class: lockss::params
#
# This class provides configuration parameters for lockss
#
# == Parameters:
#
# $lockss_config_version::   Used to set the config version.
# $lockss_user::             Used to set the Lockss user.
# $lockss_hostname::         Used to set Lockss hostname.
# $lockss_ipaddr::           Used to set ip address used to access Lockss.
# $lockss_external_ipaddr::  Used to set external ip address when using NAT.
# $lockss_v3_port::          Used to set LCAP V3 protocol port.
# $lockss_access_subnet::    Used to set the subnet allowed to manage Lockss.
# $lockss_mailhub::          Used to set a mail relay.
# $lockss_mailhub_user::     Used to set a mail relay user.
# $lockss_mailhub_password:: Used to set a mail relay user's password.
# $lockss_email::            Used to set an email address for the admin user.
# $lockss_props_url::        Used to set which url the Lockss provided config can be obtained from.
# $lockss_props_proxy::      Used to set a proxy needed to reach the props url.
# $lockss_test_group::       Used to set a preservation group.
# $lockss_disk_paths::       Used to set a content directory.
# $lockss_admin_user::       Used to set a username for the admin user.
# $lockss_admin_passwd::     Used to set a password for the admin user.
# $lockss_proxy_port::       Used to set the proxy port.
# $lockss_ui_port::          Used to set the Admin user interface port.
# $lockss_tmpdir::           Used to set where the tmp directory resides.
# $lockss_clear_tmpdir::     Used to set wether or not to clear tmp directory.
# $lockss_java_cmd::         Used to set full path to Java binary.
# $lockss_java_switches::    Used to set additional options to be passed to Java.
# $lockss_java_heap::        Used to set the Java heap size.
#
class lockss::params {
  $conf_dir     = '/etc/lockss'
  $log_dir      = '/var/log/lockss'
  $data_dir     = '/var/lockss'
  $pid_dir      = '/var/run'
  $daemon_name  = 'lockss'
  $daemon_user  = 'lockss'
  $package_list = 'lockss-daemon'
  $package_deps = [
    'java-1.6.0-openjdk',
    'trousers',
    'fipscheck',
    #'ntp',
    #'yum-cron'
  ]

  # /etc/lockss/hostconfig
  $lockss_config_version   = '1'
  $lockss_nat              = 'N'
  $lockss_user             = $daemon_user
  $lockss_hostname         = $::fqdn
  $lockss_ipaddr           = $::ipaddress
  $lockss_external_ipaddr  = ''
  $lockss_v3_port          = '9729'
  $lockss_access_subnet    = "${::ipaddress}/24"
  $lockss_mailhub          = 'localhost'
  $lockss_mailhub_auth     = 'N'
  $lockss_mailhub_user     = ''
  $lockss_mailhub_password = ''
  $lockss_email            = 'admin@example.org'
  $lockss_props_url        = 'http://props.lockss.org:8001/daemon/lockss.xml'
  $lockss_props_proxy      = 'none'
  $lockss_test_group       = 'prod'
  $lockss_disk_paths       = $data_dir
  $lockss_admin_user       = 'admin'
  $lockss_admin_passwd     = 'sha1:a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'
  $lockss_proxy_port       = '8080'
  $lockss_ui_port          = '8081'
  $lockss_tmpdir           = "${data_dir}/tmp"
  $lockss_clear_tmpdir     = 'yes'
  $lockss_props_keystore   = ''
  $lockss_java_cmd         = '/usr/bin/java'
  $lockss_java_switches    = $::architecture ? {
    'x86_64' => '-d64',
    default  => '-d32',
  }
  $lockss_java_heap        = $::architecture ? {
    'x86_64' => '5120m',
    default  => '2048m',
  }
}

