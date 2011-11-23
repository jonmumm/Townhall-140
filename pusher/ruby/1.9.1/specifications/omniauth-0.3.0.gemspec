# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "omniauth"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Bleigh", "Erik Michaels-Ober"]
  s.date = "2011-09-21"
  s.description = "OmniAuth is an authentication framework that separates the concept of authentiation from the concept of identity, providing simple hooks for any application to have one or multiple authentication providers for a user."
  s.email = ["michael@intridea.com", "sferik@gmail.com"]
  s.homepage = "http://github.com/intridea/omniauth"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Rack middleware for standardized multi-provider authentication"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oa-basic>, ["= 0.3.0"])
      s.add_runtime_dependency(%q<oa-enterprise>, ["= 0.3.0"])
      s.add_runtime_dependency(%q<oa-core>, ["= 0.3.0"])
      s.add_runtime_dependency(%q<oa-more>, ["= 0.3.0"])
      s.add_runtime_dependency(%q<oa-oauth>, ["= 0.3.0"])
      s.add_runtime_dependency(%q<oa-openid>, ["= 0.3.0"])
    else
      s.add_dependency(%q<oa-basic>, ["= 0.3.0"])
      s.add_dependency(%q<oa-enterprise>, ["= 0.3.0"])
      s.add_dependency(%q<oa-core>, ["= 0.3.0"])
      s.add_dependency(%q<oa-more>, ["= 0.3.0"])
      s.add_dependency(%q<oa-oauth>, ["= 0.3.0"])
      s.add_dependency(%q<oa-openid>, ["= 0.3.0"])
    end
  else
    s.add_dependency(%q<oa-basic>, ["= 0.3.0"])
    s.add_dependency(%q<oa-enterprise>, ["= 0.3.0"])
    s.add_dependency(%q<oa-core>, ["= 0.3.0"])
    s.add_dependency(%q<oa-more>, ["= 0.3.0"])
    s.add_dependency(%q<oa-oauth>, ["= 0.3.0"])
    s.add_dependency(%q<oa-openid>, ["= 0.3.0"])
  end
end
