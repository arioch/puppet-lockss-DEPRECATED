require 'spec_helper'

describe 'lockss' do
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

      it { should include_class('lockss') }
      it { should include_class('lockss::params') }
      it { should include_class('lockss::preinstall') }
      it { should include_class('lockss::install') }
      it { should include_class('lockss::config') }
      it { should include_class('lockss::service') }
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

