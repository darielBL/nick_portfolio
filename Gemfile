source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.1.0'
gem 'mysql2', '~> 0.5.5', require: false
gem 'puma', '~> 6.4'
gem 'bcrypt', '~> 3.1.7'

# Active Storage para subida de archivos
gem 'active_storage_validations'

# Para producción en Koyeb (almacenamiento persistente)
gem 'aws-sdk-s3', require: false  # Para S3 (recomendado)
# O usa esto para almacenamiento local en Koyeb:
# gem 'image_processing', '>= 1.2'

# Asset pipeline
gem 'sprockets-rails'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[ mri windows ]
end

group :development do
  gem 'web-console'
end
