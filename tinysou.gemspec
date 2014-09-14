# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tinysou/version'

Gem::Specification.new do |spec|
  spec.name          = 'tinysou'
  spec.version       = Tinysou::VERSION
  spec.authors       = ['Hemslo Wang']
  spec.email         = ['hemslo.wang@gmail.com']
  spec.summary       = %q(Tinysou Ruby client)
  spec.description   = %q(Tinysou Ruby client)
  spec.homepage      = 'https://github.com/tinysou/tinysou-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']


  spec.add_dependency "multi_json"
  spec.add_dependency "faraday"

  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0'
  spec.add_development_dependency 'webmock'
end
