# Packs Core

Core pack reading functionality without heavy dependencies.

## Overview

`packs-core` provides the minimal pack functionality needed by `packs-rails` without dependencies like `sorbet-runtime`, `code_ownership`, `packwerk`, and other tools from the full `packs` gem.

This allows Rails applications using `packs-rails` to have a much lighter dependency footprint, faster bundle install times, and simpler CI/CD pipelines.

## What it provides

`packs-core` defines:

- `Packs` module with methods:
  - `Packs.all` - returns an array of all packs
  - `Packs.find(name)` - finds a pack by name
  - `Packs.for_file(path)` - finds the pack containing a file

- `Packs::Pack` class representing a pack with:
  - `name` - the pack name (path relative to root)
  - `path` - absolute path to the pack
  - `relative_path` - path relative to the Rails root
  - `is_gem?` - whether the pack is a gem
  - `metadata` - metadata hash from package.yml
  - `last_name` - the last component of the pack name

## What it doesn't include

Unlike the full `packs` gem, `packs-core` does NOT include:

- CLI tools for managing packs
- Code ownership integration
- Packwerk integration
- Rubocop integration
- Interactive mode
- Pack moving/creation tools

If you need these features, use the full `packs` gem instead.

## Dependencies

**None!** That's the whole point. `packs-core` has zero runtime dependencies.

## Namespace collision protection

`packs-core` defines the same `Packs::` namespace as the external `packs` gem. To prevent conflicts, `packs-core` includes collision detection that will raise an error if both gems are loaded in the same application.

If you see a collision error, remove one of the gems from your Gemfile:
- Use `packs-rails` (which depends on `packs-core`) for Rails integration only
- Use `packs` gem if you need the full suite of pack management tools

## Usage

In your Gemfile:

```ruby
gem 'packs-rails'  # This automatically includes packs-core
```

In your code:

```ruby
require 'packs/core'

# List all packs
Packs.all.each do |pack|
  puts "#{pack.name} - gem: #{pack.is_gem?}"
end

# Find a specific pack
pack = Packs.find('packs/my_pack')
puts pack.metadata
```

## Development

This gem is developed inside the `packs-rails` repository as a subdirectory gem.

## License

MIT License - see LICENSE file in the parent repository.
