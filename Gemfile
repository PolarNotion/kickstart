source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'coffee-script', '~> 2.4.0'
gem 'jquery-rails'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'nokogiri', '~> 1.10.4'

gem 'haml-rails', '~> 2.0'                # Templating Language
gem 'jbuilder', '~> 2.7'                  # JSON Generator
gem 'turbolinks', '~> 5'                  # Faster Navigation
gem 'devise', '~> 4.7.1'                  # User Authentication
gem 'simple_form'                         # Form Builder
gem 'friendly_id', '~> 5.2.4'             # Pretty Urls (slugs)
gem 'jquery-minicolors-rails'             # Colorpicker
gem 'bootstrap', '~> 4.3.1'               # Frontend Toolkit
gem 'material-sass', '4.1.1'              # Google Material Design UI
gem 'material_icons'                      # Google Material Icons
gem 'kaminari'                            # Paginate Indexes
gem 'paper_trail'                         # Track changes to models, for audits and versioning.
gem 'meta-tags'                           # Optimize for Search Engines
gem 'rails-settings-cached', '~> 2.0'     # Admin App Settings
gem 'ahoy_matey'                          # Page Impressions
gem 'loaf'                                # Breadcrumbs
gem 'sparkpost_rails'                     # Transaction Emails
gem 'image_processing', '~> 1.2'          # Image Processing
gem 'faker', '2.0'                        # Dummy Data
gem 'aws-sdk-s3', require: false          # Image Storage on AWS

gem 'omniauth-facebook'
gem 'omniauth-linkedin-oauth2'
gem 'omniauth-twitter'
gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'

group :development, :test do
  gem 'byebug'
  gem 'letter_opener'                     # Open Mailers in Browser
  gem 'dotenv-rails'                      # ENV Variables (.env)
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'guard-rspec', require: false
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'rails-controller-testing', require: false
  gem 'webmock'
  gem 'simplecov', require: false
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
