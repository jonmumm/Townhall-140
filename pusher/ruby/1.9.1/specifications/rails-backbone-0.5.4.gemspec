# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rails-backbone"
  s.version = "0.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Fitzgerald", "Code Brew Studios"]
  s.date = "2011-09-03"
  s.description = "Quickly setup backbone.js for use with rails 3.1. Generators are provided to quickly get started."
  s.email = ["ryan@codebrewstudios.com"]
  s.homepage = "http://github.com/codebrew/backbone-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Use backbone.js with rails 3.1"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.1.0"])
      s.add_runtime_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_runtime_dependency(%q<ejs>, ["~> 1.0.0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.1.0"])
      s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_dependency(%q<ejs>, ["~> 1.0.0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.1.0"])
    s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
    s.add_dependency(%q<ejs>, ["~> 1.0.0"])
  end
end
