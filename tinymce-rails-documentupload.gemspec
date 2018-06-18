# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "tinymce-rails-documentupload/version"

Gem::Specification.new do |s|
  s.name        = "tinymce-rails-documentupload"
  s.version     = Tinymce::Rails::Documentupload::VERSION
  s.authors     = ["Florent Morin"]
  s.email       = ["morinflorent@gmail.com"]
  s.homepage    = "https://github.com/florentmorin/tinymce-rails-documentupload"
  s.summary     = %q{TinyMCE plugin for taking documents uploads in Rails >= 3.2}
  s.description = %q{TinyMCE plugin for taking documents uploads in Rails >= 3.2}

  s.files         = [Dir["app/assets/javascripts/tinymce/plugins/uploaddocument/**/*.js"],
                       Dir["lib/**/*.rb"],
                       "lib/tasks/tinymce-uploaddocument-assets.rake",
                       "CHANGELOG.md",
                       "LICENSE",
                       "README.md",
                      ].flatten
  s.test_files    = []
  s.require_paths = ["lib"]

  s.add_runtime_dependency     "railties",      ">= 3.2", "< 6"
  s.add_runtime_dependency     "tinymce-rails", "~> 4.0"
  s.add_development_dependency "bundler",       "~> 1.0"
  s.add_development_dependency "rails",         ">= 3.1"
end
