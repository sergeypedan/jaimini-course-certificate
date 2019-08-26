# require "bundler/gem_tasks"
# require "rspec/core/rake_task"

# RSpec::Core::RakeTask.new(:spec)

# task :default => :spec

require "rake"

# Rake.add_rakelib "./rakelib"   # `rakelib` is the default Rake tasks directory
Rake.add_rakelib "./rakelib/**"  # subfolders are not loaded by default, so

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/jaimini/course_certificates"
