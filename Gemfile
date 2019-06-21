source 'https://rubygems.org'

gem 'rails',        '5.1.6'
gem 'bcrypt'
gem 'sass-rails'
gem 'bootstrap'
gem 'puma',         '3.9.1'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.7.0'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook' 
gem 'devise-i18n' #devise日本語化
gem 'devise-i18n-views' #devise日本語化

group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  gem "factory_bot_rails"
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'  # デスクトップ通知を行う
  gem 'capybara',               '~> 2.13'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg', '0.20.0'
  gem 'rails_12factor'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]