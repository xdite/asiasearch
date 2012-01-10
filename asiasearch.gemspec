Gem::Specification.new do |s|
  s.name        = "asiasearch"
  s.version     = "0.0.4"
  s.date        = "2011-05-05"
  s.authors     = ["Yi-Ting Cheng"]
  s.email       = ["xuite.joke@gmail.com"]
  s.homepage    = "https://github.com/xdite/asiasearch"
  s.summary     = "Yahoo Asia Search provides user an interface for automated semantic analysis and language treatment."
  s.description = "Yahoo Asia Search provides user an interface for automated semantic analysis and language treatment."


  s.add_dependency('json_pure')
  s.add_dependency('mechanize')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


end
