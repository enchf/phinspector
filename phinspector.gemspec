# Append the contents of the lib directory into the Ruby Load Path.
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'phinspector/version'

Gem::Specification.new do |spec|
  spec.name          = 'phinspector'
  spec.version       = Phinspector::VERSION
  spec.authors       = ['enchf']

  spec.summary       = 'Phabricator diffusion repositories inspector'
  spec.description   = 'Provides search, status and Git administration capabilities in batch for all repositories'
  spec.homepage      = 'https://github.com/enchf/phinspector'
  spec.licenses      = 'MIT'

  # Files to be included in the gem. I suggest this way to get files from Git repository.
  spec.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  spec.bindir      = 'bin'
  spec.executables << 'phinspector'
  spec.require_paths = %w[lib]

  ##
  # Development dependencies
  spec.add_development_dependency 'bundler', '~> 1.16', '>= 1.16.3'
  spec.add_development_dependency 'faker', '~> 1.9', '>= 1.9.1'
  spec.add_development_dependency 'minitest', '~> 5.11', '>= 5.11.3'
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.1'

  ##
  # Runtime dependencies
  spec.add_runtime_dependency 'escort', '~> 0.4.0'
  spec.add_runtime_dependency 'phabricator', '~> 0.0.7'
end
