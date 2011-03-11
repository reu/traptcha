# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "traptcha/version"

Gem::Specification.new do |s|
  s.name        = "traptcha"
  s.version     = Traptcha::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rodrigo Navarro"]
  s.email       = ["reu@rnavarro.com.br"]
  s.homepage    = "http://github.com/reu/traptcha"
  s.summary     = "Simple captcha for rails"
  s.description = "Captcha generator for rails"

  s.rubyforge_project = "traptcha"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rmagick"

  s.add_development_dependency "rspec", "~> 2.5.0"
end
