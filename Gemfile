source 'https://rubygems.org'

# Specify your gem's dependencies in formify.gemspec
gemspec

rails_version = ENV["RAILS_VERSION"] || "default"

rails = case rails_version
when "master"
  {github: "rails/rails"}
when "default"
  "~> 5.0.1"
else
  "~> #{rails_version}"
end

gem "rails", rails
