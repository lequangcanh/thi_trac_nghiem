source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.2"
gem "mysql2"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "jquery-turbolinks"
gem "bootstrap-sass", "3.2.0.0"
gem "jbuilder", "~> 2.5"
gem "ffaker"
gem "cocoon"
gem "ckeditor"
gem "carrierwave"
gem "mini_magick"
gem "time_difference"
gem "wicked_pdf"
gem "wkhtmltopdf-binary"

source "https://rails-assets.org" do
  gem "rails-assets-growl"
end

group :development, :test do
  gem "byebug", platform: :mri
  gem "pry-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
