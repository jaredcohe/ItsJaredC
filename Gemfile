source 'http://rubygems.org'

# do bundle install -- without production

# for scraping
gem 'nokogiri', '1.4.4'

gem 'will_paginate', '~> 3.0'

# to speed up dev environment
#gem 'rails-dev-tweaks', '~> 0.5.1'
#group :development do
#  gem 'rails-dev-boost', :git => 'git://github.com/thedarkone/rails-dev-boost.git', :require => 'rails_development_boost'
#end

gem 'rails', '3.2.0'

gem 'bcrypt-ruby'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2', ">=0.3"
#gem 'haml', ">= 3.0.0"
#gem 'haml-rails'
gem 'sass'
# made comment to upgrade to rails 3.2.0, gem 'sass-rails', "  ~> 3.2.3"
gem 'jquery-rails'
#gem 'rake', '~> 0.8.7' # rake 0.9.0 is broken

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '>= 1.0.3'
end

# Gems for Heroku
group :production do
  gem 'pg'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
