control 'web_server_base' do
  impact 0.7
  title 'web_server_base'
  desc 'Base control for web_server configurations'

  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening }
    its('processes') { should include 'nginx' }
  end
end
