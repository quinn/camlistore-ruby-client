# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'camlistore/version'

Gem::Specification.new do |gem|
  gem.name          = 'camlistore'
  gem.version       = Camlistore::VERSION
  gem.author        = 'Quinn Shanahan'
  gem.email         = 'quinn@tastehoneyco.com'
  gem.description   = %q{Some access to your camlistore in ruby}
  gem.summary       = %q{Camlistore client}
  gem.homepage      = %q{https://github.com/quinn/camlistore-ruby-client}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.add_runtime_dependency 'faraday_middleware', '~> 0.9.0'
end
