require 'spec_helper'

describe 'lockss::config' do
  let(:title) { 'lockss' }
  let(:facts) {
    {
      :environment => 'development',
    }
  }

  rpm_distros = [ 'RedHat', 'CentOS', 'Scientific', 'OEL', 'Amazon' ]
  deb_distros = [ 'Debian', 'Ubuntu' ]

  rpm_distros.each do |os|
    describe "on #{os}" do
      let(:facts) do
        {
          'operatingsystem' => os
        }
      end

      it do
        should include_class('lockss::params')
        should contain_class('lockss::config')
    
        should contain_file('/etc/lockss').with_ensure('directory')
        should contain_file('/var/lockss').with_ensure('directory')
        should contain_file('/var/lockss/tmp').with_ensure('directory')
        should contain_file('/var/log/lockss').with_ensure('directory')
    
        should contain_file('/etc/lockss/.answers').with_ensure('present')
        should contain_file('/etc/lockss/config.dat').with_ensure('present')
        should contain_file('/etc/lockss/hostconfig').with_ensure('present')
        should contain_file('/etc/lockss/lockss-config-iptables').with_ensure('present')
        should contain_file('/etc/lockss/upgrade-lockss').with_ensure('present')
      end

    end
  end

end

