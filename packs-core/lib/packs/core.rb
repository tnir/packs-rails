# frozen_string_literal: true

# Collision detection: Check if Packs is already defined by another gem
if defined?(::Packs) && !defined?(::Packs::Core)
  # Check if this is from the external 'packs' gem
  # We detect this by checking if certain files are already loaded
  external_packs_loaded = $LOADED_FEATURES.any? do |feature|
    feature.include?('/packs-') || # packs-specification
    (feature.end_with?('/packs.rb') && !feature.include?('/packs-core/'))
  end

  if external_packs_loaded
    raise <<~ERROR
      
      ╔═══════════════════════════════════════════════════════════════════════════════╗
      ║                          PACKS NAMESPACE COLLISION                            ║
      ╚═══════════════════════════════════════════════════════════════════════════════╝
      
      The 'Packs' module is already defined by another gem (likely 'packs' or 
      'packs-specification'), but packs-core is trying to define it as well.
      
      You cannot use both 'packs' and 'packs-core' gems in the same application.
      
      ┌─────────────────────────────────────────────────────────────────────────────┐
      │ RESOLUTION STEPS:                                                           │
      ├─────────────────────────────────────────────────────────────────────────────┤
      │                                                                             │
      │ 1. Remove the 'packs' gem from your Gemfile:                               │
      │    - Delete the line: gem 'packs'                                           │
      │                                                                             │
      │ 2. Keep only 'packs-rails' (which depends on 'packs-core'):                │
      │    gem 'packs-rails'                                                        │
      │                                                                             │
      │ 3. Run: bundle install                                                      │
      │                                                                             │
      │ 4. If you need the additional functionality from the 'packs' gem,          │
      │    please open an issue at:                                                 │
      │    https://github.com/rubyatscale/packs-rails/issues                        │
      │                                                                             │
      └─────────────────────────────────────────────────────────────────────────────┘
      
    ERROR
  end
end

require 'yaml'
require 'pathname'
require_relative 'core/version'
require_relative 'pack'
require_relative 'specification'

# Define the Packs module and delegate to Specification
module Packs
  PACKAGE_FILE = 'package.yml'

  class << self
    def all
      Specification.all
    end

    def find(name)
      Specification.find(name)
    end

    def for_file(file_path)
      Specification.for_file(file_path)
    end

    def bust_cache!
      Specification.bust_cache!
    end
  end
end
