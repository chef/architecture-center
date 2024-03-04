control 'debian_version' do
  impact 0.7
  title 'debian_version'
  desc 'debian_version check'

  describe file('/etc/debian_version') do
    it { should exist }
  end
end
