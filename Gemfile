source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails_12factor', group: :production

gem 'rails', '3.2.11'
# Postgres
gem 'pg'
# jQuery
gem 'jquery-rails'
# Use thin for development and test
gem 'thin'
# Use puma for production
gem 'puma'
# Password encryption
gem 'bcrypt-ruby', '~> 3.0.0'
# Use rabl JSON templates instead of Jbuilder
gem 'rabl'
# Use haml for html templates
gem 'haml'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  # Add js runtime gem here if needed
end

# Gems used only in development
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'wirb'
end

# Gems for both test and development environments
group :development, :test do
  gem 'machinist'
  gem 'faker'
end

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
