source 'https://rubygems.org'
ruby "2.7.2"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'will_paginate', '~> 3.1.0'
gem 'bootstrap_form'
gem 'carrierwave', '~> 1.3.2'
gem 'mini_magick', '~> 4.3'
gem "fog"
gem 'figaro'
gem "devise"
gem 'social-share-button', github: "huacnlee/social-share-button"
gem 'sendgrid-ruby'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
group :development do
  gem 'web-console', '>= 3.3.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
	gem 'sqlite3'
end

group :production do
	gem 'pg', '~> 0.20'
	gem 'rails_12factor'
	gem 'heroku-deflater'
end