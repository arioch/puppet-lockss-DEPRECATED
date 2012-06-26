require 'spec_helper'

describe 'lockss::install' do
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
      it { should contain_class('lockss::install') }
    
      it { should contain_package('lockss-daemon').with_ensure('present') }
      it { should contain_package('java-1.6.0-openjdk').with_ensure('present') }
      it { should contain_package('trousers').with_ensure('present') }
      it { should contain_package('fipscheck').with_ensure('present') }
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
          should include_class('lockss::install')
        }.to raise_error(Puppet::Error, /target operatingsystem is not supported/)
      end
    end
  end
end

