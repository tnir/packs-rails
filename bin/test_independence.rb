#!/usr/bin/env ruby
# frozen_string_literal: true

# This script demonstrates that packs-rails can work without sorbet-runtime
# by only loading packs/core (not packs)

puts "Testing packs-rails independence from sorbet-runtime..."
puts

# Load only packs-core, not the full packs gem
require_relative '../packs-core/lib/packs/core'

puts "✓ Successfully loaded packs/core"
puts "  Packs module defined: #{defined?(Packs)}"
puts "  Packs::Pack defined: #{defined?(Packs::Pack)}"
puts "  Packs::Core defined: #{defined?(Packs::Core)}"
puts

# Verify sorbet-runtime is NOT loaded as a dependency of packs-core
if defined?(Sorbet) || defined?(T)
  puts "✗ FAILED: sorbet-runtime was loaded (T or Sorbet defined)"
  exit 1
else
  puts "✓ sorbet-runtime is NOT loaded"
end
puts

# Test that basic Packs functionality works
Dir.chdir('spec/fixtures/rails-7.0') do
  packs = Packs.all
  puts "✓ Found #{packs.length} packs"
  
  if packs.any?
    pack = packs.first
    puts "  Example pack: #{pack.name}"
    puts "  - is_gem?: #{pack.is_gem?}"
    puts "  - last_name: #{pack.last_name}"
    puts "  - metadata: #{pack.metadata.inspect}"
  end
end
puts

puts "SUCCESS: packs-core works independently without sorbet-runtime!"
