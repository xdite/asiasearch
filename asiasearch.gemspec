Gem::Specification.new do |s|
  s.name        = "asiasearch"
  s.version     = "0.0.1"
  s.date        = "2009-02-06"
  s.authors     = ["Yi-Ting Cheng"]
  s.email       = ["xuite.joke@gmail.com"]
  s.homepage    = "https://github.com/xdite/asiasearch"
  s.summary     = "Yahoo Asia Search provides user an interface for automated semantic analysis and language treatment."
  s.description = "Yahoo Asia Search provides user an interface for automated semantic analysis and language treatment."

  s.add_dependency('hpricot')
  s.add_dependency('json_pure')
  s.add_dependency('mechanize')

  s.files = Dir.glob("{lib}/**/*") + %w(README.mkdn) # 只有列在這裡的檔案會打包到 Gem package 裡面。
  
end