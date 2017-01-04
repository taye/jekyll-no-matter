# coding: utf-8

require 'jekyll-no-matter'

Gem::Specification.new do |s|
  s.name    = "jekyll-no-matter"
  s.version = JekyllNoMatter::VERSION
  s.authors = ["Taye Adeyemi"]
  s.email   = "dev@taye.me"

  s.summary     = "a jekyll plugin for writing less front matter"
  s.description = <<-EOF
    this plugin patches Jekyll::Reader so that it pretends that files with
    endings specified in the `site.no_matter` array always have front matter
    in them so that they may be converted or processed in some other way
  EOF

  s.files         = [".gitignore", "README.md", "jekyll-no-matter.gemspec",
                     "lib/jekyll-no-matter.rb"]
  s.homepage      = "https://github.com/taye/jekyll-no-matter"
  s.license       = "WTFPL"
  s.require_paths = ["lib"]

  s.add_dependency "jekyll", "~> 3.3"

  s.post_install_message = <<-EOF
    you may need to set `site.sass.load_paths` if you're using sass
    `@includes`"
  EOF
end
