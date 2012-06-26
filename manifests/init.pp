# = Class: lockss
#
# This class provides lockss
#
# == Parameters:
#
# $parameter:: This global variable is used to set
#
# == Actions:
#   actions
#
# == Sample Usage:
#
# class { 'lockss': }
#
# Or when not satisfied with provided defaults:
#
# class { 'lockss':
#   lockss_java_heap  => '5120',
#   lockss_disk_paths => '/var/lockss',
#   lockss_tmpdir     => '/var/lockss/tmp',
# }
#
class lockss (
  $lockss_user             = $lockss::params::lockss_user,
  $lockss_hostname         = $lockss::params::lockss_hostname,
  $lockss_ipaddr           = $lockss::params::lockss_ipaddr,
  $lockss_external_ipaddr  = $lockss::params::lockss_external_ipaddr,
  $lockss_v3_port          = $lockss::params::lockss_v3_port,
  $lockss_access_subnet    = $lockss::params::lockss_access_subnet,
  $lockss_mailhub          = $lockss::params::lockss_mailhub,
  $lockss_mailhub_user     = $lockss::params::lockss_mailhub_user,
  $lockss_mailhub_password = $lockss::params::lockss_mailhub_password,
  $lockss_email            = $lockss::params::lockss_email,
  $lockss_java_cmd         = $lockss::params::lockss_java_cmd,
  $lockss_java_switches    = $lockss::params::lockss_java_switches,
  $lockss_java_heap        = $lockss::params::lockss_java_heap,
  $lockss_props_url        = $lockss::params::lockss_props_url,
  $lockss_props_proxy      = $lockss::params::lockss_props_proxy,
  $lockss_test_group       = $lockss::params::lockss_test_group,
  $lockss_disk_paths       = $lockss::params::lockss_disk_paths,
  $lockss_admin_user       = $lockss::params::lockss_admin_user,
  $lockss_admin_passwd     = $lockss::params::lockss_admin_passwd,
  $lockss_proxy_port       = $lockss::params::lockss_proxy_port,
  $lockss_ui_port          = $lockss::params::lockss_ui_port,
  $lockss_tmpdir           = $lockss::params::lockss_tmpdir,
  $lockss_clear_tmpdir     = $lockss::params::lockss_clear_tmpdir,
  $lockss_props_keystore   = $lockss::params::lockss_props_keystore
) inherits lockss::params {

  include lockss::params
  include lockss::preinstall
  include lockss::install
  include lockss::config
  include lockss::service

  Class['preinstall'] ->
  Class['install'] ->
  Class['config'] ->
  Class['service']

  case $operatingsystem {
    # Live fast, die young.
    /RedHat|CentOS|Scientific|OEL|Amazon/: {}
    default: { fail 'The target operatingsystem is not supported by Lockss.' }
  }
}

