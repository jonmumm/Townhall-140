# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{opentok}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Karmen Blake"]
  s.date = %q{2011-04-20}
  s.description = %q{OpenTok is a free set of APIs from TokBox that enables websites to weave live group video communication into their online experience. With OpenTok you have the freedom and flexibility to create the most engaging web experience for your users. OpenTok is currently available as a JavaScript and ActionScript 3.0 library. This gem allows you to connect to the API from within Ruby (and Rails)}
  s.email = ["karmenblake@gmail.com"]
  s.files = [".gitignore", "CHANGES", "Gemfile", "LICENCE", "README.textile", "Rakefile", "doc/CHANGES.html", "doc/Gemfile.html", "doc/Hash.html", "doc/LICENCE.html", "doc/Net.html", "doc/Net/HTTP.html", "doc/OpenTok.html", "doc/OpenTok/OpenTokException.html", "doc/OpenTok/OpenTokSDK.html", "doc/OpenTok/RoleConstants.html", "doc/OpenTok/Session.html", "doc/OpenTok/SessionPropertyConstants.html", "doc/Rakefile.html", "doc/created.rid", "doc/images/brick.png", "doc/images/brick_link.png", "doc/images/bug.png", "doc/images/bullet_black.png", "doc/images/bullet_toggle_minus.png", "doc/images/bullet_toggle_plus.png", "doc/images/date.png", "doc/images/find.png", "doc/images/loadingAnimation.gif", "doc/images/macFFBgHack.png", "doc/images/package.png", "doc/images/page_green.png", "doc/images/page_white_text.png", "doc/images/page_white_width.png", "doc/images/plugin.png", "doc/images/ruby.png", "doc/images/tag_green.png", "doc/images/wrench.png", "doc/images/wrench_orange.png", "doc/images/zoom.png", "doc/index.html", "doc/js/darkfish.js", "doc/js/jquery.js", "doc/js/quicksearch.js", "doc/js/thickbox-compressed.js", "doc/lib/monkey_patches_rb.html", "doc/lib/open_tok/exceptions_rb.html", "doc/lib/open_tok/open_tok_sdk_rb.html", "doc/lib/open_tok/session_rb.html", "doc/lib/open_tok/version_rb.html", "doc/lib/opentok_rb.html", "doc/rdoc.css", "doc/spec/opentok_spec_rb.html", "doc/spec/spec_helper_rb.html", "lib/monkey_patches.rb", "lib/open_tok/exceptions.rb", "lib/open_tok/open_tok_sdk.rb", "lib/open_tok/session.rb", "lib/open_tok/version.rb", "lib/opentok.rb", "opentok.gemspec", "spec/opentok_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{opentok}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{OpenTok gem}
  s.test_files = ["spec/opentok_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
