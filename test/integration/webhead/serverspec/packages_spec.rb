require 'spec_helper'

packages = %w(
  vim
  screen
  python
  ruby1.9.3
  curl
  git
)

packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Skip this check when in Travis CI
if ENV['TRAVIS']
  puts 'Travis CI environment detected, skipping gem tests.'
else
  describe package('fog') do
    it { should be_installed.by('gem') }
  end
end
