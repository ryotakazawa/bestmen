# frozen_string_literal: true

source 'https://rubygems.org'

gem 'acts-as-taggable-on'
gem 'acts_as_votable'
gem 'aws-sdk', '~> 3'
gem 'bcrypt'
gem 'bootstrap'
gem 'bootstrap-social-rails'
gem 'cancancan'
gem 'coffee-rails', '4.2.2'
gem 'devise', '>= 4.7.1'
gem 'devise-i18n' # devise日本語化
gem 'dotenv-rails'
gem 'font-awesome-sass', '~> 5.8.1'
gem 'geocoder'
gem 'gmaps4rails'
gem 'jbuilder',     '2.7.0'
gem 'jquery-rails', '4.3.1'
gem 'kaminari'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-twitter'
gem 'paperclip'
gem 'pg'
gem 'puma', '3.9.1'
gem 'rails'
gem 'rails_admin'
gem 'ransack'
gem 'simple_form'
gem 'turbolinks',   '5.0.1'
gem 'uglifier',     '3.2.0'

group :development, :test do
  gem 'bullet'
  gem 'byebug', '9.0.6', platform: :mri
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'omniauth-rails_csrf_protection'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'spring-commands-rspec'
  gem 'webdrivers'
end

group :development do
  gem 'listen', '3.1.5'
  gem 'rails-erd'
  gem 'rubocop', require: false
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console', '3.5.1'
end

group :test do
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard' # デスクトップ通知を行う
end

group :production do
  gem 'rails_12factor' # RailsアプリケーションをHerokuで動作をさせることを目的としているGem
  gem 'mini_racer', platforms: :ruby

end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
