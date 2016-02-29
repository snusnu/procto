# encoding: utf-8

require File.expand_path('../lib/procto/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "procto"
  gem.version     = Procto::VERSION.dup
  gem.authors     = [ 'Martin Gamsjaeger (snusnu)' ]
  gem.email       = [ 'gamsnjaga@gmail.com' ]
  gem.description = 'Turns your object into a method object'
  gem.summary     = 'Defines Foo.call(*args) which invokes Foo.new(*args).bar '
  gem.homepage    = 'https://github.com/snusnu/procto'

  gem.require_paths    = [ 'lib' ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.md CONTRIBUTING.md]
  gem.license          = 'MIT'

  gem.add_development_dependency 'bundler', '~> 1'
end
