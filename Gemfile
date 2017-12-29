source 'https://rubygems.org'

ruby '2.5.0'
gem 'rails'
gem 'bootstrap', '~> 4.0.0.beta3'
gem 'bootstrap_form'
gem 'sass-rails'
gem 'uglifier'
gem 'popper_js'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'openssl', '>=2.0.3'
gem 'jbuilder'
gem 'sdoc', group: :doc
gem 'devise', git: 'https://github.com/plataformatec/devise'
gem 'font-awesome-rails'
gem 'gritter', :git => 'https://github.com/jason-hobbs/gritter.git'
gem 'hamlit'
gem 'bundler'
gem 'dotenv-rails'
gem 'pg'
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
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'capybara'
end
