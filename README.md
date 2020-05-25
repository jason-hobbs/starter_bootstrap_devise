[![Maintainability](https://api.codeclimate.com/v1/badges/d6cdf645170376983e50/maintainability)](https://codeclimate.com/github/jason-hobbs/starter_bootstrap_devise/maintainability)
[![security](https://hakiri.io/github/jason-hobbs/starter_bootstrap_devise/master.svg)](https://hakiri.io/github/jason-hobbs/starter_bootstrap_devise/master)
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

###Starter_Bootstrap

This is a starter site for Ruby on Rails apps.  
It has Bootstrap 4, toastr notifications, Postgresql, Gravatar, Devise,
and Font Awesome 5 built in.
Uses Ruby 2.7.1 and Rails 6.0.3.1.
Webpacker is also installed for integrating javascript frameworks.
Multi factor authentication is available as an option for users.
Stimulus.js is also installed.
[Demo here](http://starter-bootstrap-devise.herokuapp.com).  

Clone to a folder, then:  

```
bundle
rails db:setup
```

Look at db/seeds.rb for the default user and admin logins.

Run:
```
rspec
```
to run all tests.

Then just add your own Models, Views, and Controllers!


Password confirmation, reset, and unlock is sent using Email.  To use Gmail, Mandrill, Mailgun, etc. just
edit the config/environments/development.rb and production.rb changing the
settings in config.action_mailer.smtp_settings.
