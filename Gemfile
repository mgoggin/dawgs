source "https://rubygems.org"

# Drivers
gem "pg", "~> 1.1"

# Framework
gem "rails", "~> 7.2.1"

# Framework Extensions
gem "bootsnap", require: false

# Auth
gem "authentication-zero"
gem "bcrypt", "~> 3.1.7"

# Asset Management
gem "importmap-rails"
gem "propshaft"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

# Utilities
gem "good_migrations"

# Application Server
gem "puma", ">= 5.0"

# Platform Support
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "brakeman", require: false
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
end

group :development do
  gem "annotate"
  gem "erb_lint", require: false
  gem "rubocop-rake"
  gem "rubocop-rspec"
  gem "rubocop-thread_safety"
  gem "standard"
  gem "standard-rails"
  gem "web-console"
end

group :test do
  gem "capybara", require: false
  gem "selenium-webdriver", require: false
  gem "shoulda-matchers"
end
