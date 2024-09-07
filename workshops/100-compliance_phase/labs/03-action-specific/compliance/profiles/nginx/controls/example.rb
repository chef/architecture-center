control 'nginx-controls' do
  impact 0.7
  title 'nginx'
  desc 'nginx check'


  describe package('nginx') do
    it { should be_installed }
  end
end
