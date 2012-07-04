require 'spec_helper'

describe 'lockss::service' do
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
        should contain_service('lockss').with(
          'ensure'    => 'running',
          'enable'    => 'true',
          'hasstatus' => 'false'
        )
      end
    end
  end
end

