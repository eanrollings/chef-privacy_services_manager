require 'spec_helper'

describe 'privacy_services_manager::management_tools' do
  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).and_return(false)
  end

  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.10').converge(described_recipe)
  end

  it 'installs management_tools' do
    expect(chef_run).to install_dmg_package('Management Tools [1.8.1]')
  end
end
