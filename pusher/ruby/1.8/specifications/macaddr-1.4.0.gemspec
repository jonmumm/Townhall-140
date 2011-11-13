# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{macaddr}
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ara T. Howard"]
  s.date = %q{2011-08-15}
  s.description = %q{description: macaddr kicks the ass}
  s.email = %q{ara.t.howard@gmail.com}
  s.files = ["LICENSE", "README", "Rakefile", "lib/macaddr.rb", "macaddr.gemspec", "test/data/osx", "test/mac_test.rb", "test/testing.rb"]
  s.homepage = %q{https://github.com/ahoward/macaddr}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{codeforpeople}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{macaddr}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<systemu>, ["~> 2.2.0"])
    else
      s.add_dependency(%q<systemu>, ["~> 2.2.0"])
    end
  else
    s.add_dependency(%q<systemu>, ["~> 2.2.0"])
  end
end
