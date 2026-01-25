# -*- encoding: utf-8 -*-
# stub: code_teams 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "code_teams".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/rubyatscale/code_teams/releases", "homepage_uri" => "https://github.com/rubyatscale/code_teams", "source_code_uri" => "https://github.com/rubyatscale/code_teams" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gusto Engineers".freeze]
  s.date = "1980-01-02"
  s.description = "A low-dependency gem for declaring and querying engineering teams".freeze
  s.email = ["dev@gusto.com".freeze]
  s.homepage = "https://github.com/rubyatscale/code_teams".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.2".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "A low-dependency gem for declaring and querying engineering teams".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<sorbet-runtime>.freeze, [">= 0"])
end
