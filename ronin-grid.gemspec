# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ronin-grid/version"

Gem::Specification.new do |s|
  s.name        = "ronin-grid"
  s.version     = RoninGrid::VERSION
  s.authors     = ["Jonathan Clem"]
  s.email       = ["j@jclem.net"]
  s.homepage    = "https://github.com/jclem/ronin-grid"
  s.summary     = %q{Slice and dice content into a flexible, responsive grid with media queries.}
  s.description = <<-DESCRIPTION
The objective of Ronin is to provide a framework for developing flexible, responsive web designs that are compatible back to IE7. Ronin aims to be somewhat of a "framework framework", meaning that it is column-count- and width-agnostic. It makes no assumptions about the preferred maximum width of a design or the number of columns.
  DESCRIPTION

  s.rubyforge_project = "ronin-grid"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('sass', '= 3.2.0.alpha.64')
end
