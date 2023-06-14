source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.5"

gem "bootsnap", require: false
gem 'faker'
gem "jbuilder"
gem "kaminari"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]


group :development, :test do
  gem 'annotate'
  gem "rufo"
  gem 'rspec-rails', '~> 5.0.0'
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end
