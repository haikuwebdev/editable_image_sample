Gem::Specification.new do |s|
  s.name = "editable-image"
  s.version = "0.24"
  s.date = "2008-07-28"
  s.summary = "Simplified interface to web-based image editors."
  s.email = "tj@haikuwebdev.com"
  s.homepage = ""
  s.description = "Simplified interface to web-based image editors."
  s.has_rdoc = false
  s.authors = ["TJ Stankus"]
  s.files = ["editable-image.gemspec", "README", "todo.txt", "lib/multipart.rb", "lib/editable-image.rb", "lib/editable-image/exceptions.rb", "lib/picnik/picnik.rb"]
  s.test_files = ["test/picnik_test.rb", "test/files/logo.gif", "test/files/test.txt"]
  s.add_dependency("mime-types", [">= 1.15"])
  s.add_dependency("Shoulda", [">= 1.1.1"])
end
