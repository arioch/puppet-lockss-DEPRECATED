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

      it do
        should include_class('lockss::params')
        should contain_class('lockss::install')
        should contain_package('lockss-daemon').with_ensure('present')
        should contain_package('java-1.6.0-openjdk').with_ensure('present')
        should contain_package('trousers').with_ensure('present')
        should contain_package('fipscheck').with_ensure('present')
      end
    end
  end
end

