# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/dom/testing/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec-dom-testing'
  spec.version       = Rspec::Dom::Testing::VERSION
  spec.authors       = ['Michal Cichra']
  spec.email         = ['michal@cichra.cz']

  spec.summary       = 'Provide has_tag and has_tag matchers.'
  spec.description   = 'Wraps rails-dom-testing into RSpec matchers.'
  spec.homepage      = 'https://github.com/mikz/rspec-dom-testing'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'rails-dom-testing', '>= 1.0', '< 3'
  spec.add_dependency 'rspec-expectations', '~> 3.0'
end
