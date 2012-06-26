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

      it { should include_class('lockss::params') }
      it { should contain_class('lockss::config') }
    
      it { should contain_file('/etc/lockss').with_ensure('directory') }
      it { should contain_file('/var/lockss').with_ensure('directory') }
      it { should contain_file('/var/lockss/tmp').with_ensure('directory') }
      it { should contain_file('/var/log/lockss').with_ensure('directory') }
    
      it { should contain_file('/etc/lockss/.answers').with_ensure('present') }
      it { should contain_file('/etc/lockss/config.dat').with_ensure('present') }
      it { should contain_file('/etc/lockss/hostconfig').with_ensure('present') }
      it { should contain_file('/etc/lockss/lockss-config-iptables').with_ensure('present') }
      it { should contain_file('/etc/lockss/upgrade-lockss').with_ensure('present') }

    end
  end

  deb_distros.each do |os|
    describe "on #{os}" do
      let(:facts) do
        {
          'operatingsystem' => os
        }
      end

      it do
        expect {
          should include_class('lockss')
          should include_class('lockss::config')
        }.to raise_error(Puppet::Error, /target operatingsystem is not supported/)
      end
    end
  end
end

