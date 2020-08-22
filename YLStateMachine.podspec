Pod::Spec.new do |s|
  s.name         = "YLStateMachine"
  s.version      = "1.1.1"
  s.summary      = "A simple state machine."
  s.homepage     = "https://github.com/YuLeiFuYun/YLStateMachine"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "YuLeiFuYun" => "yuleifuyunn@gmail.com" }
  s.swift_version = "5.1"
  s.platform     = :ios, "13.0"	
  s.source       = { :git => "https://github.com/YuLeiFuYun/YLStateMachine.git", :tag => s.version }
  s.source_files = "Sources/YLStateMachine/*.swift"
end
