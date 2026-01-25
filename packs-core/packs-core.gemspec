# frozen_string_literal: true

require_relative 'lib/packs/core/version'

Gem::Specification.new do |spec|
  spec.name          = 'packs-core'
  spec.version       = Packs::Core::VERSION
  spec.authors       = ['Ngan Pham']
  spec.email         = ['gusto-opensource-buildkite@gusto.com']

  spec.summary       = 'Core pack reading functionality without heavy dependencies'
  spec.description   = 'packs-core provides the minimal pack functionality needed by packs-rails without sorbet-runtime or other heavy dependencies'
  spec.homepage      = 'https://github.com/rubyatscale/packs-rails'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/rubyatscale/packs-rails'
  spec.metadata['changelog_uri'] = 'https://github.com/rubyatscale/packs-rails/releases'

  spec.files         = Dir['lib/**/*']
  spec.require_paths = ['lib']

  # No runtime dependencies - that's the whole point!
end
