require 'spec_helper'

describe 'lockss' do
  let(:title) { 'lockss' }
#  let(:facts) {
#    {
#      :environment => 'development',
#    }
#  }

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
        should include_class('lockss')
        should include_class('lockss::params')
        should include_class('lockss::preinstall')
        should include_class('lockss::install')
        should include_class('lockss::config')
        should include_class('lockss::service')
      end

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
          should include_class('lockss::preinstall')
        }.to raise_error(Puppet::Error, /target operatingsystem is not supported/)
      end
    end
  end
end

