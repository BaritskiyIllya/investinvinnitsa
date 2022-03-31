# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes    master encryption key: f0fdeabb2681e18438c02e5fbccdc8b9
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# https://github.com/norman/babosa
gem 'babosa'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', require: 'dotenv/rails-now'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'html2slim'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rails_config', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# https://github.com/galetahub/ckeditor
gem 'ckeditor'
# https://github.com/carrierwaveuploader/carrierwave
gem 'carrierwave', '~> 1.0'
# https://github.com/lebedev-yury/carrierwave-base64
gem 'carrierwave-base64'
gem 'mini_magick'

gem 'kaminari'
gem 'kaminari-bootstrap'

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'activemodel-serializers-xml'
gem 'cancancan'
gem 'devise'
gem 'globalize', git: 'https://github.com/globalize/globalize'
gem 'role_model'
gem 'simple_form'
gem 'slim'
gem 'slim-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# https://github.com/globalize/globalize-accessors
gem 'aasm'
gem 'activerecord-postgis-adapter'
gem 'cocoon'
gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: '6.x'
gem 'elasticsearch-model-globalize'
gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: '6.x'
gem 'fast_jsonapi'
gem 'globalize-accessors'
gem 'inline_svg'
gem 'jquery-minicolors-rails'
gem 'require_all'
gem 'rmagick'
gem 'sanitize'
gem 'simple-spreadsheet'
gem 'unicorn'
gem 'capistrano', '~> 3.11'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-passenger', '~> 0.2.0'
gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
gem 'flex-slider-rails'