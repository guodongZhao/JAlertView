Pod::Spec.new do |s|
   s.name         = "JAlertView"
   s.version      = "0.1.0"
   s.summary      = "JAlertView is an Swift library for iOS developers."
   s.homepage     = "https://github.com/jinxiansen/JAlertView"
   s.license      = 'MIT (LICENSE)'
   s.author       = { "jinxiansen" => "hi@jinxiansen.com" }
   s.source       = { :git => "https://github.com/jinxiansen/JAlertView/JAlertView", :tag => "0.1.0" }
   s.platform     = :ios, '8.0'

   s.source_files = 'CYHelper', 'CYHelper/**/*.{h,m}'
   s.exclude_files = 'CYHelperDemo'

   s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
   s.requires_arc = true

 end