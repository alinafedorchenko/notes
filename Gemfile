source "https://rubygems.org"

ruby "3.3.1"

gem "rails", "~> 7.1"
gem "mysql2", "~> 0.5"
gem "puma", ">= 5.0"
gem "bootsnap", require: false
gem "simple-interactors", "0.0.2"
gem "active_model_serializers"
gem "searchkick"
gem "opensearch-ruby"
gem "redis"
gem "resque"
gem "resque-scheduler"
gem "activerecord-import"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "rspec-rails"
  gem "factory_bot_rails"
end

group :development do
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end
