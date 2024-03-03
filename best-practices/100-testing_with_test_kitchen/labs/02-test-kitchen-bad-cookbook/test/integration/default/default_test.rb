describe directory('/var/www/html') do
  it { should exist }
  its('owner') { should eq 'www-data' }
  its('group') { should eq 'www-data' }
  its('mode')  { should cmp '0755' }
end