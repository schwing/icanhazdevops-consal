require 'rake'
require 'rspec/core/rake_task'
require 'kitchen'

# Integration tests - kitchen.ci
desc 'Run Test Kitchen'
namespace :integration do
  Kitchen.logger = Kitchen.default_file_logger

  desc 'Run kitchen test with Vagrant'
  task :vagrant do
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end

  %w(verify destroy).each do |t|
    desc "Run kitchen #{t} with cloud plugins"
    namespace :cloud do
      task t do
        @loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.ci.yml')
        config = Kitchen::Config.new(loader: @loader)
        concurrency = config.instances.size
        queue = Queue.new
        config.instances.each { |i| queue << i }
        concurrency.times { queue << nil }
        threads = []
        concurrency.times do
          threads << Thread.new do
            while instance = queue.pop
              instance.send(t)
            end
          end
        end
        threads.map(&:join)
      end
    end
  end

  task cloud: ['cloud:verify', 'cloud:destroy']
end

desc 'Run all tests on CI Platform'
task ci: ['integration:cloud']

# Default
task default: ['integration:vagrant']
