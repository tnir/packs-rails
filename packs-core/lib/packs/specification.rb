# frozen_string_literal: true

require_relative 'specification/configuration'

module Packs
  module Specification
    class << self
      def root
        Pathname.pwd
      end

      def config
        @config ||= Configuration.fetch
      end

      def bust_cache!
        @packs_by_name = nil
        @for_file = nil
        @config = nil
      end

      def all
        packs_by_name.values
      end

      def find(name)
        packs_by_name[name]
      end

      def for_file(file_path)
        path_string = file_path.to_s
        @for_file ||= {}
        @for_file[path_string] ||= all.find { |package| path_string.start_with?("#{package.name}/") || path_string == package.name }
      end

      private

      def packs_by_name
        @packs_by_name ||= begin
          all_packs = package_glob_patterns.map do |path|
            Pack.from(path)
          end

          # We want to match more specific paths first so for_file works correctly.
          sorted_packages = all_packs.sort_by { |package| -package.name.length }
          sorted_packages.to_h { |p| [p.name, p] }
        end
      end

      def package_glob_patterns
        absolute_root = Specification.root
        Specification.config.pack_paths.flat_map do |pack_path|
          Pathname.glob(absolute_root.join(pack_path).join(Pack::PACKAGE_FILE))
        end
      end
    end
  end
end
