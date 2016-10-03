Gem::Specification.new do |gem|
  gem.name        = 'repeat_test'
  gem.version     = '0.0.1'
  gem.date        = '2016-09-30'
  gem.summary     = "Run rspec many times and report back"
  gem.description = "Run rspec many times and report back"
  gem.authors     = ["James Coles-Nash"]
  gem.email       = 'james.coles-nash@clio.com'

  gem.files       = Dir["lib/**/*", "bin/*"]
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.homepage    = 'http://rubygems.org/gems/repeat_test'
  gem.license       = 'MIT'
end
