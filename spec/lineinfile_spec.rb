require_relative 'spec_helper'

describe 'test::lineinfile' do
  #  @buffer = StringIO.new()
  let(:chef_run) do
    allow(File).to receive(:read).and_call_original
    allow(File).to receive(:read).with('/test1').and_return('myorigin = who knows what')
    allow(File).to receive(:read).with('/test2').and_return('  myorigin = who knows what')

    #    allow(File).to receive(:open).with('/test1', 'w').and_yield( @buffer )
    ChefSpec::SoloRunner.new(step_into: ['lineinfile']).converge described_recipe
  end

#  context '/test1' do
#    it 'expect lineinfile matcher to process _myorigin = who knows what_' do
#      expect(chef_run).to run_lineinfile('/test1')
#    end
#  end

#  context '/test2' do
#    it 'expect lineinfile matcher to process leading skip _     myorigin = who knows what_' do
#      expect(chef_run).not_to run_lineinfile('/test2')
#    end
#  end
end
