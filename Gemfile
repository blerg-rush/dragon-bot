# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.7.1'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord', '~> 5.2'
gem 'creek', '~> 2.5'
gem 'discordrb', '~> 3.3'
gem 'pg', '~> 1.2'
gem 'standalone_migrations', '~> 5.2'

group :development do
  gem 'rubocop', '~> 0.82.0'
end

group :test, :development do
  gem 'dotenv', '~> 2.7'
end
