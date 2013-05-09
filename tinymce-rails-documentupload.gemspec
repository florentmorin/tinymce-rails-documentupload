# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "tinymce-rails-documentupload/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tinymce-rails-documentupload"
  s.version     = Tinymce::Rails::Documentupload::VERSION
  s.authors     = ["Florent Morin"]
  s.email       = ["morinflorent@gmail.com"]
  s.homepage    = "https://github.com/florentmorin/tinymce-rails-documentupload"
  s.summary     = %q{TinyMCE plugin for taking documents uploads in Rails >= 3.1}
  s.description = %q{TinyMCE plugin for taking documents uploads in Rails >= 3.1}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency     "railties",      ">= 3.1"
  s.add_runtime_dependency     "tinymce-rails", "~> 3.5.8.1"
  s.add_development_dependency "bundler",       "~> 1.0"
  s.add_development_dependency "rails",         ">= 3.1"
end
