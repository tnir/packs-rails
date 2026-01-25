# -*- encoding: utf-8 -*-
# stub: packs 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "packs".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/rubyatscale/packs/releases", "homepage_uri" => "https://github.com/rubyatscale/packs", "source_code_uri" => "https://github.com/rubyatscale/packs" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gusto Engineers".freeze]
  s.date = "2025-01-07"
  s.description = "Provides CLI tools for working with ruby packs.".freeze
  s.email = ["dev@gusto.com".freeze]
  s.executables = ["packs".freeze]
  s.files = ["bin/packs".freeze]
  s.homepage = "https://github.com/rubyatscale/packs".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Provides CLI tools for working with ruby packs.".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<bigdecimal>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<code_ownership>.freeze, [">= 1.33.0"])
  s.add_runtime_dependency(%q<packs-specification>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<packwerk>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<parse_packwerk>.freeze, [">= 0.25.0"])
  s.add_runtime_dependency(%q<rainbow>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<sorbet-runtime>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<tty-prompt>.freeze, [">= 0"])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.2"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<sorbet>.freeze, [">= 0"])
  s.add_development_dependency(%q<sorbet-static>.freeze, [">= 0"])
  s.add_development_dependency(%q<spoom>.freeze, ["= 1.2.1"])
  s.add_development_dependency(%q<tapioca>.freeze, [">= 0"])
end
