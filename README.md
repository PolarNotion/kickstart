# Kickstart

This is a Rails 6 app.

## Prerequisites

* Ruby 2.7.0
* Postgres
* ImageMagick

## Preinstalled Gems
```
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
```

## Getting Started

* clone this repo
* run `rails webpacker:install`
* run `bundle`
* run `rails db:create`
* run `rails db:migrate`
* run `rails server`
* visit `//localhost:3000` in your browser
