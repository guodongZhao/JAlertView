Pod::Spec.new do |s|
   s.name         = "JAlertView"
   s.version      = "0.2.1"
   s.summary      = "JAlertView is an Swift library for iOS developers."
   s.homepage     = "https://github.com/jinxiansen/JAlertView" 
   s.license      = 'MIT (LICENSE)'
   s.author       = { "jinxiansen" => "hi@jinxiansen.com" }
   s.source       = { :git => "https://github.com/jinxiansen/JAlertView.git", :tag => s.version }
   s.platform     = :ios, '8.0'
   s.source_files = 'lib/**/*.{swift}'
   s.requires_arc = true
 end
