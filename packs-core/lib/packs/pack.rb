# frozen_string_literal: true

require 'yaml'
require 'pathname'

module Packs
  # Represents a pack (package) in the system
  class Pack
    PACKAGE_FILE = 'package.yml'

    attr_reader :name, :path, :relative_path, :raw_hash

    def initialize(name:, path:, relative_path:, raw_hash:)
      @name = name
      @path = path
      @relative_path = relative_path
      @raw_hash = raw_hash
    end

    def self.from(package_yml_absolute_path)
      package_loaded_yml = if YAML.respond_to?(:safe_load_file)
                             # Ruby 3.1+
                             YAML.safe_load_file(package_yml_absolute_path, permitted_classes: [], permitted_symbols: [], aliases: true)
                           else
                             # Ruby 2.7-3.0
                             YAML.safe_load(File.read(package_yml_absolute_path), permitted_classes: [], permitted_symbols: [], aliases: true)
                           end
      path = package_yml_absolute_path.dirname
      relative_path = path.relative_path_from(Specification.root)
      package_name = relative_path.cleanpath.to_s

      new(
        name: package_name,
        path: path,
        relative_path: relative_path,
        raw_hash: package_loaded_yml || {}
      )
    end

    def yml(relative: true)
      path_to_use = relative ? relative_path : path
      path_to_use.join(PACKAGE_FILE).cleanpath
    end

    def last_name
      relative_path.basename.to_s
    end

    # rubocop:disable Naming/PredicatePrefix
    def is_gem?
      @is_gem ||= relative_path.glob('*.gemspec').any?
    end
    # rubocop:enable Naming/PredicatePrefix

    def metadata
      raw_hash['metadata'] || {}
    end
  end
end
