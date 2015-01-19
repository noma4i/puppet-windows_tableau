require 'spec_helper'
describe 'windows_tableau' do

  context 'with defaults for all parameters' do
    it { should contain_class('windows_tableau') }
  end
end
