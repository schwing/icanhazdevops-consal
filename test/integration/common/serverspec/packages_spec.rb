require 'spec_helper'

packages = %w(
  vim
  screen
  python
  ruby
  curl
  git
)

packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('fog') do
  it { should be_installed.by('gem') }
end
