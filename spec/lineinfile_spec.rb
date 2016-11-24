require_relative 'spec_helper'

describe 'test::lineinfile' do
  let(:chef_run) do
    allow(File).to receive(:read).and_call_original
    expect(File).to receive(:read).with('myorigin = who knows what').and_return('myorigin = $mydomain')
    ChefSpec::SoloRunner.new(step_into: ['lineinfile']).converge described_recipe
  end

  context '/test1' do
    it 'expect lineinfile matcher to run' do
      expect(chef_run).to run_replace_line('myorigin = who knows what')
    end
  end
end
