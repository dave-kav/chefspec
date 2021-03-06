require 'chefspec'

describe 'yum_package::remove' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611')
                          .converge(described_recipe)
  end

  it 'removes a yum_package with an explicit action' do
    expect(chef_run).to remove_yum_package('explicit_action')
    expect(chef_run).to_not remove_yum_package('not_explicit_action')
  end

  it 'removes a yum_package with attributes' do
    expect(chef_run).to remove_yum_package('with_attributes').with(version: '1.0.0')
    expect(chef_run).to_not remove_yum_package('with_attributes').with(version: '1.2.3')
  end

  it 'removes a yum_package when specifying the identity attribute' do
    expect(chef_run).to remove_yum_package('identity_attribute')
  end
end
