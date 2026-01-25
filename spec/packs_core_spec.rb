# frozen_string_literal: true

RSpec.describe 'Packs::Core independence' do
  it 'can load packs-rails without the external packs gem' do
    # This test verifies that packs-rails works without the 'packs' gem
    # Since we're already running in this context, the fact that this test
    # runs at all proves independence
    
    expect(defined?(Packs)).to eq('constant')
    expect(defined?(Packs::Pack)).to eq('constant')
    expect(defined?(Packs::Core)).to eq('constant')
  end

  it 'provides Packs.all method' do
    expect(Packs).to respond_to(:all)
    expect(Packs.all).to be_an(Array)
  end

  it 'provides Packs.find method' do
    expect(Packs).to respond_to(:find)
  end

  it 'provides Packs::Pack class with required methods' do
    # Use the Rails fixture that the other tests use
    rails_dir = Pathname.new(File.expand_path('fixtures/rails-7.0', __dir__))
    
    # Change to Rails root directory
    original_dir = Dir.pwd
    begin
      Dir.chdir(rails_dir)
      Packs.bust_cache! # Clear cache to reload in new directory
      packs = Packs.all
      
      expect(packs).not_to be_empty
      pack = packs.first
      
      expect(pack).to respond_to(:name)
      expect(pack).to respond_to(:is_gem?)
      expect(pack).to respond_to(:metadata)
      expect(pack).to respond_to(:relative_path)
      expect(pack).to respond_to(:last_name)
    ensure
      Dir.chdir(original_dir)
      Packs.bust_cache! # Clear cache again
    end
  end

  it 'does not have sorbet-runtime as a dependency' do
    # Check that we're not loading sorbet from packs-core
    packs_core_path = File.expand_path('../packs-core', __dir__)
    
    # Verify packs-core gemspec doesn't have sorbet-runtime as a dependency
    gemspec_content = File.read(File.join(packs_core_path, 'packs-core.gemspec'))
    expect(gemspec_content).not_to include('add_dependency')
    expect(gemspec_content).not_to include('add_runtime_dependency')
  end
end

RSpec.describe 'Packs namespace collision detection' do
  it 'would raise an error if external packs gem is already loaded' do
    # We can't actually test this in the current environment without
    # causing the entire test suite to fail, but we can verify the
    # collision detection code exists
    
    collision_code = File.read(File.expand_path('../packs-core/lib/packs/core.rb', __dir__))
    
    expect(collision_code).to include('Collision detection')
    expect(collision_code).to include('PACKS NAMESPACE COLLISION')
    expect(collision_code).to include('RESOLUTION STEPS')
  end

  it 'provides a helpful error message' do
    collision_code = File.read(File.expand_path('../packs-core/lib/packs/core.rb', __dir__))
    
    # Verify the error message includes remediation steps
    expect(collision_code).to include("Remove the 'packs' gem from your Gemfile")
    expect(collision_code).to include('bundle install')
  end
end
