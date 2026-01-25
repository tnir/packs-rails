# Migration Guide: packs-rails 0.1.0

## Overview

Starting with version 0.1.0, `packs-rails` no longer depends on the `packs` gem. Instead, it uses a new lightweight `packs-core` gem with zero runtime dependencies.

## What Changed

### Before (< 0.1.0)
```ruby
# Gemfile
gem 'packs-rails'

# This brought in:
# - packs
# - packs-specification  
# - sorbet-runtime
# - code_ownership
# - code_teams
# - packwerk
# - parse_packwerk
# And many more transitive dependencies
```

### After (>= 0.1.0)
```ruby
# Gemfile
gem 'packs-rails'

# This brings in only:
# - packs-core (zero dependencies!)
# - activesupport
# - railties
```

## Benefits

1. **Lighter Dependencies**: ~15 fewer gems in production
2. **Faster Bundle Install**: Fewer gems to download and compile
3. **Faster CI/CD**: Quicker dependency installation
4. **Optional Sorbet**: sorbet-runtime is now optional, not required
5. **Backward Compatible**: Same API, no code changes needed

## Migration Steps

### For Most Users (No Action Required)

If you only use `packs-rails` for Rails integration:

1. Update `packs-rails` in your Gemfile:
   ```ruby
   gem 'packs-rails', '~> 0.1.0'
   ```

2. Run `bundle update packs-rails`

3. Done! Everything works the same.

### If You Use the `packs` CLI

If you use `packs` CLI commands like `packs create_pack!`, `packs move_to_pack!`, etc.:

1. Add the `packs` gem explicitly to your Gemfile:
   ```ruby
   gem 'packs-rails', '~> 0.1.0'
   gem 'packs'  # Add this for CLI functionality
   ```

2. Run `bundle update`

**Note:** You cannot have both `packs` and `packs-core` loaded at the same time. If you try, you'll get a clear error message with instructions.

### If You Don't Use Sorbet

If you don't use Sorbet in your application:

1. You can now remove `sorbet-runtime` from your Gemfile (if it was there)
2. `packs-rails` will work without it

## API Compatibility

All APIs remain the same:
- `Packs.all` - returns all packs
- `Packs.find(name)` - finds a pack by name
- `Packs.for_file(path)` - finds pack containing a file
- `Packs::Pack` class with all methods

## What's in packs-core?

`packs-core` provides:
- Pack discovery and loading
- `Packs::Pack` data structure
- Configuration support (`packs.yml`)
- Zero dependencies

It does NOT include:
- CLI tools for pack management
- Code ownership integration
- Packwerk integration
- Rubocop integration

## Troubleshooting

### Error: "PACKS NAMESPACE COLLISION"

This means both `packs` and `packs-core` are being loaded. Solution:

1. Check your Gemfile - you should have only `packs-rails`, not both `packs` and `packs-rails`
2. Run `bundle list | grep packs` to see what's installed
3. Remove the conflicting gem from your Gemfile
4. Run `bundle install`

### Tests Failing After Upgrade

If tests fail:
1. Make sure you've removed any direct `require 'packs'` statements
2. Update to `require 'packs/core'` if you're loading packs directly
3. Check for dependencies on `packs` CLI functionality in tests

### Missing Methods

If you get "undefined method" errors:
1. Check if you're using `packs` CLI methods (create_pack!, move_to_pack!, etc.)
2. If so, add `gem 'packs'` to your Gemfile

## Questions?

Open an issue at: https://github.com/rubyatscale/packs-rails/issues
