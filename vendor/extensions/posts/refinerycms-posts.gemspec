# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-posts'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Posts extension for Refinery CMS'
  s.date              = '2017-05-05'
  s.summary           = 'Posts extension for Refinery CMS'
  s.authors           = 't-kondo'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 3.0.5'
  s.add_dependency             'acts_as_indexed',     '~> 0.8.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.5'
end
