require 'packs/core'
require 'active_support'
require 'rails/application'

# Make sorbet-runtime optional - only load if available
begin
  require 'sorbet-runtime'
rescue LoadError
  # Define no-op T module if sorbet-runtime is not available
  module T
    def self.unsafe(value)
      value
    end

    module Sig
    end

    def self.extended(base)
      base.define_singleton_method(:sig) { |&_block| }
    end

    def self.included(base)
      base.define_method(:sig) { |&_block| }
    end
  end
end

module Packs
  module Rails
    extend ActiveSupport::Autoload

    autoload :Integrations
    autoload :Railtie
    autoload :Stim

    class Error < StandardError; end

    class << self
      attr_reader :config

      def root
        @root ||= ::Rails::Application.find_root(Dir.pwd)
      end
    end

    @config = ActiveSupport::OrderedOptions.new
    @config.paths = %w[
      app
      app/controllers
      app/channels
      app/helpers
      app/models
      app/mailers
      app/views
      lib
      lib/tasks
      config
      config/locales
      config/initializers
      config/routes
    ]
  end

  require 'packs/rails/railtie'
end
