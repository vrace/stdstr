Pod::Spec.new do |s|
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "stdstr"
  s.summary = "C++ 98 std::string port to Swift"
  s.requires_arc = true
  s.version = "0.1.1"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "LIU YANG" => "vrace_studios@hotmail.com" }
  s.homepage = "https://github.com/vrace/stdstr"
  s.source = { :git => "https://github.com/vrace/stdstr.git", :tag => "#{s.version}"}
  s.framework = "Foundation"
  s.source_files = "stdstr/**/*.{swift}"
end