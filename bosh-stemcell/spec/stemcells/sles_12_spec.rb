require 'spec_helper'

describe 'SLES 12 stemcell', stemcell_image: true do

  it_behaves_like 'All Stemcells'
  it_behaves_like 'a SLES stemcell'

  context 'installed by system_parameters' do
    describe file('/var/vcap/bosh/etc/operating_system') do
      its(:content) { should match('sles') }
    end
  end

  describe 'mounted file systems: /etc/fstab should mount nfs with nodev (stig: V-38654)(stig: V-38652)' do
    describe file('/etc/fstab') do
      it { should be_file }
      its(:content) { should_not match /nfs/ }
    end
  end
end
