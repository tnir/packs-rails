# -*- encoding: utf-8 -*-
# stub: code_ownership 2.1.0 x86_64-linux lib

Gem::Specification.new do |s|
  s.name = "code_ownership".freeze
  s.version = "2.1.0"
  s.platform = "x86_64-linux".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "cargo_crate_name" => "code_ownership", "changelog_uri" => "https://github.com/rubyatscale/code_ownership/releases", "homepage_uri" => "https://github.com/rubyatscale/code_ownership", "source_code_uri" => "https://github.com/rubyatscale/code_ownership" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gusto Engineers".freeze]
  s.date = "2025-11-13"
  s.description = "A gem to help engineering teams declare ownership of code".freeze
  s.email = ["dev@gusto.com".freeze]
  s.executables = ["codeownership".freeze]
  s.files = ["bin/codeownership".freeze]
  s.homepage = "https://github.com/rubyatscale/code_ownership".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 3.2".freeze, "< 3.5.dev".freeze])
  s.rubygems_version = "3.4.20".freeze
  s.summary = "A gem to help engineering teams declare ownership of code".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<code_teams>.freeze, ["~> 1.0"])
  s.add_runtime_dependency(%q<packs-specification>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<sorbet-runtime>.freeze, [">= 0.5.11249"])
  s.add_development_dependency(%q<debug>.freeze, [">= 0"])
  s.add_development_dependency(%q<packwerk>.freeze, [">= 0"])
  s.add_development_dependency(%q<railties>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<sorbet>.freeze, [">= 0"])
  s.add_development_dependency(%q<tapioca>.freeze, [">= 0"])
end
