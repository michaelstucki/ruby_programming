Gem::Specification.new do |s|
  s.name         = "studio_game_orangeurn"
  s.version      = "1.0.0"
  s.author       = "Michael L Stucki"
  s.email        = "orange.urn@gmail.com"
  s.homepage     = "https://github.com/michaelstucki"
  s.summary      = "A game of players, health scores, and treasures"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end