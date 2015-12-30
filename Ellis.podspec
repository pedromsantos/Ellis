Pod::Spec.new do |s|
  s.name         = "Ellis"
  s.version      = "0.0.1"
  s.summary      = "Swift music library"
  s.homepage     = "https://github.com/pedromsantos/Ellis"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author        = { "Pedro Santos" => "github@mariodelrio.com" }
  s.social_media_url  = "http://twitter.com/pedromsantos"
  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/pedromsantos/Ellis.git", :tag => "0.0.1" }
  s.source_files  = "Ellis/*"
  s.requires_arc = true
end
