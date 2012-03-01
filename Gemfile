source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
group :production do
  gem 'pg'
end


gem 'therubyracer'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'dynamic_form'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'


# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'pry', :group => :development

group :development do
 gem 'capistrano'
end

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'email_spec'
  gem 'launchy'
end

gem 'devise'
gem 'cancan'
gem 'paperclip'
gem 'searcher'
