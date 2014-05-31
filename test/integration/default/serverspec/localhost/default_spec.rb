require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe command('java -version') do
  it { should return_stdout /.*1.7/}
end

describe package('jenkins') do
    it { should be_installed }
end

describe service('jenkins') do
  it { should be_enabled }
  it { should be_running }
end
