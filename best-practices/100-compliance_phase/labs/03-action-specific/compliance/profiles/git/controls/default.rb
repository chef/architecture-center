control 'git-controls' do
  impact 0.7
  title 'git'
  desc 'git check'

  describe package('git') do
    it { should be_installed }
  end
end
