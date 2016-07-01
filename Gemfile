source 'https://rubygems.org'

ruby '2.3.1'
gem 'rails'
gem 'bootstrap-sass'
gem 'bootstrap_form', :git => 'https://github.com/bootstrap-ruby/rails-bootstrap-forms.git'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'sdoc', group: :doc
gem 'devise'
gem 'gritter', :git => 'https://github.com/jason-hobbs/gritter.git'
gem 'hamlit'
gem 'bundler'
gem 'dotenv-rails'
gem 'pg'
gem 'codeclimate-test-reporter', group: :test, require: nil
gem 'simplecov', :require => false, :group => :test
gem 'friendly_id'
gem 'whenever', :require => false
gem 'rack-attack'

group :production do
  gem 'rails_12factor'
  gem 'passenger'
end

group :development do
  gem 'brakeman'
  gem 'web-console'
  gem 'bullet'
  gem 'spring'
  gem 'puma'
  gem 'better_errors'
  gem 'binding_of_caller'
  #gem 'rack-mini-profiler'
  gem 'traceroute'
end
group :development, :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'minitest'
  gem 'byebug'
end
group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'capybara'
end
