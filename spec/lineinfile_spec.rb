require_relative 'spec_helper'

describe 'test::lineinfile' do
  let(:chef_run) do
    allow(File).to receive(:read).and_call_original
    ChefSpec::SoloRunner.new(step_into: ['lineinfile']).converge described_recipe
  end

end
