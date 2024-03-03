describe package('/var/www/html') do
  it { should exist }
  its('owner') { should eq 'www-data' }
  its('group')  { should cmp '0755' }
end