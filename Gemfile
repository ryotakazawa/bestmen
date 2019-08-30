# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bcrypt'
gem 'bootstrap'
gem 'bootstrap-social-rails'
gem 'coffee-rails', '4.2.2'
gem 'devise'
gem 'devise-i18n' # devise日本語化

gem 'cancancan'
gem 'rails_admin'
gem 'jbuilder',     '2.7.0'
gem 'jquery-rails', '4.3.1'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem 'puma', '3.9.1'
gem 'rails', '5.1.6'
gem 'turbolinks',   '5.0.1' 
gem 'uglifier',     '3.2.0'
gem 'dotenv-rails'
gem 'simple_form'
gem 'paperclip'
gem 'font-awesome-sass', '~> 5.8.1'
gem 'acts_as_votable'
gem 'acts-as-taggable-on'
gem 'ransack'
gem 'geocoder'
gem 'gmaps4rails'
gem 'kaminari'

group :development, :test do
  gem 'byebug', '9.0.6', platform: :mri
  gem 'factory_bot_rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'sqlite3', '1.3.13'
  gem 'bullet'
  gem "omniauth-rails_csrf_protection"
end

group :development do
  gem 'listen', '3.1.5'
  gem 'rubocop', require: false
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console',           '3.5.1'
  gem 'rails-erd'
end

group :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard' # デスクトップ通知を行う
end

group :production do
  gem 'pg', '0.20.0'
  gem 'rails_12factor'  #RailsアプリケーションをHerokuで動作をさせることを目的としているGem
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
