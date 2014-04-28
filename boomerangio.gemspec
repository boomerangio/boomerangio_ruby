Gem::Specification.new do |s|
  s.name 		= "boomerangio"
  s.version     = '0.0.1'
  s.summary     = "A client for Boomerang.io"
  s.description = "A ruby client for chucking boomerangs with Boomerang.io "
  s.authors     = ["Christopher Li"]
  s.email       = 'christopher@boomerang.io'
  #s.files       = ["lib/example.rb"]
  s.files 		= Dir.glob("lib/**/*")
  s.platform    = Gem::Platform::RUBY
  s.homepage    = 'https://github.com/boomerangio/boomerangio_ruby'
  
  s.add_dependency('rest-client', '~> 1.4')
  s.add_dependency('json', '~> 1.8.1')

  s.require_paths = ["lib"]
end