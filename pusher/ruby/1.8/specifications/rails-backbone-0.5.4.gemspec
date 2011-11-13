# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails-backbone}
  s.version = "0.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Fitzgerald", "Code Brew Studios"]
  s.date = %q{2011-09-03}
  s.description = %q{Quickly setup backbone.js for use with rails 3.1. Generators are provided to quickly get started.}
  s.email = ["ryan@codebrewstudios.com"]
  s.files = ["lib/backbone-rails.rb", "lib/generators/backbone/install/install_generator.rb", "lib/generators/backbone/install/templates/app.coffee", "lib/generators/backbone/model/model_generator.rb", "lib/generators/backbone/model/templates/model.coffee", "lib/generators/backbone/resource_helpers.rb", "lib/generators/backbone/router/router_generator.rb", "lib/generators/backbone/router/templates/router.coffee", "lib/generators/backbone/router/templates/template.jst", "lib/generators/backbone/router/templates/view.coffee", "lib/generators/backbone/scaffold/scaffold_generator.rb", "lib/generators/backbone/scaffold/templates/model.coffee", "lib/generators/backbone/scaffold/templates/router.coffee", "lib/generators/backbone/scaffold/templates/templates/edit.jst", "lib/generators/backbone/scaffold/templates/templates/index.jst", "lib/generators/backbone/scaffold/templates/templates/model.jst", "lib/generators/backbone/scaffold/templates/templates/new.jst", "lib/generators/backbone/scaffold/templates/templates/show.jst", "lib/generators/backbone/scaffold/templates/views/edit_view.coffee", "lib/generators/backbone/scaffold/templates/views/index_view.coffee", "lib/generators/backbone/scaffold/templates/views/model_view.coffee", "lib/generators/backbone/scaffold/templates/views/new_view.coffee", "lib/generators/backbone/scaffold/templates/views/show_view.coffee", "lib/rails-backbone.rb", "lib/tasks/backbone-rails_tasks.rake", "vendor/assets/javascripts/backbone.js", "vendor/assets/javascripts/backbone_datalink.js", "vendor/assets/javascripts/backbone_rails_sync.js", "vendor/assets/javascripts/underscore.js", "MIT-LICENSE", "Rakefile", "README.md"]
  s.homepage = %q{http://github.com/codebrew/backbone-rails}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Use backbone.js with rails 3.1}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
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
