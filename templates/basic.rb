# basic.rb
#

# add gems
#
#
gem "puma"

gem "compass-rails", "~> 2.0.alpha.0"
gem "foundation-rails"
gem "jquery-validation-rails"
gem "haml-rails"

gem "simple_form"

gem_group :development do
  gem "foreman"

  gem "guard"
  gem "guard-livereload", require: false
  gem "guard-bundler", require: false
  gem "guard-rspec", require: false
  gem "guard-spork", require: false
  gem "spork-rails", github: "sporkrb/spork-rails"

  gem "rb-fsevent"
  gem "rack-livereload"
end

gem_group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
end

gem_group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "faker"
  gem "launch"
  gem "mocha", require: false
  gem "shoulda-matchers"

  gem "simplecov", require: false
  gem "simplecov-rcov-text", require: false
end

gem_group :production do
  gem "rails_12factor"
  gem "newrelic_rpm"
end

environment "config.middleware.use Rack::LiveReload", env: "development" 
environment "config.action_mailer.delivery_method = :file", env: "development"
