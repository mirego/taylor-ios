#
#  Be sure to run `pod spec lint Taylor.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "MRGTaylor"
  s.version      = "1.4.2"
  s.summary      = "A short description of Taylor."
  s.homepage     = "https://github.com/mirego/taylor-ios"
  s.license      = "MIT"

  spec.ios.deployment_target  = '8.0'  
  spec.tvos.deployment_target = '9.0'

  s.source       = { :git => "https://github.com/mirego/taylor-ios.git", :tag => "#{s.version}" }
  s.source_files  = "Taylor/**/*.swift"
  # s.public_header_files = "Taylor/*.h"
end
