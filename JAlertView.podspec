Pod::Spec.new do |s|
   s.name         = "JAlertView"
   s.version      = "0.1.0"
   s.summary      = "JAlertView is an Swift library for iOS developers."
   s.homepage     = "https://github.com/jinxiansen/JAlertView" #主页,这里要填写可以访问到的地址，不然验证不通过
   s.license      = 'MIT (LICENSE)'
   s.author       = { "jinxiansen" => "hi@jinxiansen.com" }
   s.source       = { :git => "https://github.com/jinxiansen/JAlertView.git", :tag => s.version }
   s.platform     = :ios, '8.0'

   s.source_files = 'JAlertView/lib'     #代码源文件地址，**/*表示Classes目录及其子目录下所有文件，如果有多个目录下则 #用逗号分开，如果需要在项目中分组显示，这里也要做相应的设置
   s.requires_arc = true  #是否使用ARC，如果指定具体文件，则具体的问题使用ARC
 end