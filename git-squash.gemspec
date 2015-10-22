# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'git-squash/version'

Gem::Specification.new do |s|
  s.name        = 'git-squash'
  s.version     = GitSquash::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Adriano Tadao']
  s.email       = ['adrianotadao@gmail.com']
  s.homepage    = "https://github.com/adrianotadao/git-squash"
  s.summary     = "git shortcut to join all commits in just one"
  s.license     = "MIT"

  s.add_dependency "colored", ">= 1.2"
  s.add_dependency "grit"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.require_path = 'lib'
  s.executables  = Dir.glob("bin/*").map(&File.method(:basename))
end
