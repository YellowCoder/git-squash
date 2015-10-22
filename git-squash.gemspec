# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'git-squash/version'

Gem::Specification.new do |s|
  s.name        = 'git-squash'
  s.version     = GitSquash::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Adriano Tadao Sabadini Matsumoto']
  s.email       = 'drianotadao@gmail.com '
  s.homepage    = "https://github.com/adrianotadao/git-squash"
  s.summary     = "git shortcut to join all commits in just one"
  s.description = "Sometimes execute the basic git commands is very boring and repetitive so, this shortcut will make your git repository be most clean."
  s.license     = "MIT"

  s.add_runtime_dependency "colored", "~> 1.2"
  s.add_runtime_dependency "grit", "2.5.0"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.require_path = 'lib'
  s.executables  = Dir.glob("bin/*").map(&File.method(:basename))
end
