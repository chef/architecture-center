# Chef InSpec test for recipe web_server::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe port(80) do
  it { should be_listening }
end
