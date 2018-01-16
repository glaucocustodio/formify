# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'formify/version'

Gem::Specification.new do |spec|
  spec.name          = "formify"
  spec.version       = Formify::VERSION
  spec.authors       = ["Glauco Custódio"]
  spec.email         = ["glauco.custodio@gmail.com"]
  spec.summary       = %q{Form objects made easy.}
  spec.description   = %q{A small gem that helps you creating form objects on ActiveRecord.}
  spec.homepage      = "https://github.com/glaucocustodio/formify"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord', ">= 4.0"
  spec.add_dependency 'activemodel', ">= 4.0"
  spec.add_dependency 'activesupport', ">= 4.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rails", ">= 4.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"
end
