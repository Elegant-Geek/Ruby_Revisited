Gem::Specification.new do |s|
    s.name         = "songfile"
    s.version      = "1.0.3"
    s.author       = "Jamie Clark"
    s.email        = "clarkcjamie@gmail.com"
    s.homepage     = "http://pragmaticstudio.com" 

    s.summary      = "Text based game for ranking music playlists featuring multiple rounds, a panel of reviewers from Pink Floyd, and output of the newly ranked playlist."

    s.description  = File.read(File.join(File.dirname(__FILE__), 'README.txt'))
    s.licenses     = ['MIT']
  
    s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE.txt README.txt) #altered line
    s.test_files    = Dir["spec/**/*"]
    s.executables   = [ 'songfile' ] #altered line to  just say 'game.rb' #REMOVED "DIR" AND IT WORKED
  
    s.required_ruby_version = '>=1.9'
    s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
  end