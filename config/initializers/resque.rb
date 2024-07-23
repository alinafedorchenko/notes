require 'resque'
require 'resque/server'

Resque.redis = Redis.new(url: 'redis://redis:6379/0')
Resque.schedule = YAML.load_file Rails.root.join('config', 'schedule.yml')
