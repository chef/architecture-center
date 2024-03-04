control 'httpd-controls' do
  impact 0.7
  title 'httpd'
  desc 'httpd check'


  describe package('httpd') do
    it { should be_installed }
  end
end
