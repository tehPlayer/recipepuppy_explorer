# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Core
gem 'coffee-rails', '~> 4.2'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# Assets
gem 'bootstrap', '~> 4.1.3'
gem 'jquery-rails'

# Libs
gem 'faraday'

group :development, :test do
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rubocop', '~> 0.58.2', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
end
