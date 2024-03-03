# # encoding: utf-8
unless os.windows?
  describe user('root') do
    it { should exist }
  end
end

describe port(80) do
  it { should be_listening }
end
