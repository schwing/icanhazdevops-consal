require 'spec_helper'

describe user('schwing') do
  it { should exist }
  it { should have_home_directory '/home/schwing' }
  it { should have_login_shell '/bin/bash' }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCj0zUmkRM3XTTPP44b6+XqfCs60CJJHv6ZsNCmvqO6k1wvebbTXa9vnT9WYmeImm686q0yEMJMzlrurmrawa8bl3/siTFyzPw/mQFOcyQVdvkxvgjKUaESpnxIouZ0oCymJqxXnKaLAO8/xFIza52YImfuEOce+GHg4faXN6ukRZsHCP6g9y8qy3K8stGWWrvq6bxISpVDsfl1QcL0ug4G8pjZLHnDhZMRri2Q4tkmzH3oywEOYtoz7tmmbdVlmvQQd+1mYQ1lsSyAHeFoWbqlIiLPTLi5nYAuIaBh+Rzcm9vUqwcnpME1cD/mLkXutO3jRgOYEGNuga22cbrWMP1F' }
end

describe file('/etc/sudoers.d/schwing') do
  it { should be_file }
  it { should be_mode 440 }
  its(:content) { should match /schwing\s+ALL=\(ALL\)\s+NOPASSWD:\s+ALL/ }
end
