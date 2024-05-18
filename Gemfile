source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.8", ">= 7.0.8.1"
gem "propshaft"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem 'vite_rails'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'seed-fu'
gem 'draper'
gem 'paranoia'
gem 'whenever'
gem 'rails-i18n'
gem 'enum_help'
gem 'letter_opener_web'
gem 'foreman'
gem 'devise'
gem 'ransack'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'pry-rails'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
