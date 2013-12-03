# basic.rb
#
#
puts "Updating Gemfile"

gsub_file 'Gemfile', /gem 'sqlite3'\n/, ''
gem 'pg'

gem "puma"
gem "activeadmin", github: "gregbell/active_admin"

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

run "bundle install"

remove_file "app/assets/views/layout/application.html.erb"
generate :"foundation:install", "--haml", "-f"

environment "config.middleware.use Rack::LiveReload", env: "development" 
environment "config.action_mailer.delivery_method = :file", env: "development"

remove_file "config/database.yml"

copy_file File.expand_path("../config/Guardfile", File.dirname(__FILE__)), "Guardfile"
copy_file File.expand_path("../config/Procfile.dev", File.dirname(__FILE__)), "Procfile.dev"
copy_file File.expand_path("../config/database.yml", File.dirname(__FILE__)), "config/database.yml"
# todo: create template files for rspec, database.yml and haml

create_file ".env.sample" do
  <<-CODE
  basic_config=goes_here
  CODE
end

