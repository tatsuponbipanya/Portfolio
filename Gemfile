ruby '3.2.10'
# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bcrypt', '3.1.12'
gem 'bootstrap-sass',          '3.4.1'
gem 'sassc', '~> 2.4.0'
gem 'bootstrap-will_paginate', '1.0.0'
gem "bundler", "~> 2.4"
gem 'logger'
gem 'will_paginate', '>= 3.3.0'
gem 'carrierwave', '1.2.2'
gem 'coffee-rails', '4.2.2'
gem 'counter_culture', '~> 1.8'
gem 'gravtastic'
gem 'jbuilder', '2.7.0'
gem 'jquery-rails', '4.3.1'
gem 'jquery-turbolinks'
gem 'mini_magick', '4.7.0'
gem 'puma', '~> 5.0'
gem 'rails', '6.1.0'
gem 'rails-i18n'
gem 'rakuten_web_service'
gem 'ransack'
gem 'sassc-rails', '~> 2.1.2'
gem 'turbolinks', '~> 5'
gem 'uglifier', '3.2.0'

group :development, :test do
  gem 'sqlite3', '~> 1.4' # 重複してる分は消して一つにする！
  gem 'byebug', '11.1.3', platform: :mri
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '3.7'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console',           '3.5.1'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'faker', '~> 2.21' 
  gem 'guard', '2.13.0'
  gem 'guard-minitest', '2.4.4'
  gem 'launchy', '~> 2.3.0'
  gem 'minitest', '5.10.3'
  gem 'minitest-reporters', '1.1.14'
  gem 'rails-controller-testing', '1.0.5'
  gem 'selenium-webdriver', '~>2.45.0'
end

group :production, :staging do
  gem 'pg', '~> 1.1'
  gem 'unicorn'
  gem 'fog-aws'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
