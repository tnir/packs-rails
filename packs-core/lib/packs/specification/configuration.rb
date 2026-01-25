# frozen_string_literal: true

module Packs
  module Specification
    class Configuration
      CONFIGURATION_PATHNAME = Pathname.new('packs.yml')

      DEFAULT_PACK_PATHS = [
        'packs/*',
        'packs/*/*'
      ].freeze

      attr_reader :pack_paths

      def initialize(pack_paths:)
        @pack_paths = pack_paths
      end

      def self.fetch
        config_hash = CONFIGURATION_PATHNAME.exist? ? YAML.load_file(CONFIGURATION_PATHNAME) : {}

        new(
          pack_paths: pack_paths(config_hash)
        )
      end

      def self.pack_paths(config_hash)
        specified_pack_paths = config_hash['pack_paths']
        if specified_pack_paths.nil?
          DEFAULT_PACK_PATHS.dup
        else
          Array(specified_pack_paths)
        end
      end
    end
  end
end
