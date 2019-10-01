# -*- encoding: utf-8 -*-
# stub: cancancan 3.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "cancancan".freeze
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alessandro Rodi (Renuo AG)".freeze, "Bryan Rite".freeze, "Ryan Bates".freeze, "Richard Wilson".freeze]
  s.date = "2019-04-16"
  s.description = "Simple authorization solution for Rails. All permissions are stored in a single location.".freeze
  s.email = "alessandro.rodi@renuo.ch".freeze
  s.homepage = "https://github.com/CanCanCommunity/cancancan".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Simple authorization solution for Rails.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.0", ">= 2.0.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.1", ">= 10.1.1"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2", ">= 3.2.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.63.1"])
    else
      s.add_dependency(%q<appraisal>.freeze, ["~> 2.0", ">= 2.0.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.1", ">= 10.1.1"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.2", ">= 3.2.0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.63.1"])
    end
  else
    s.add_dependency(%q<appraisal>.freeze, ["~> 2.0", ">= 2.0.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.1", ">= 10.1.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2", ">= 3.2.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.63.1"])
  end
end
