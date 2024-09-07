control 'redhat-release' do
  impact 0.7
  title 'redhat-release'
  desc 'redhat-release check'

  describe file('/etc/redhat-release') do
    it { should exist }
  end
end
