#
#  Be sure to run `pod spec lint Taylor.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "MRGTaylor"
  spec.version      = "1.4.2"
  spec.summary      = "A short description of Taylor."
  spec.homepage     = "https://github.com/mirego/taylor-ios"
  spec.license      = "MIT"
  spec.author       = { 
    "Mirego" => "it@irego.com"
  }

  spec.ios.deployment_target  = '8.0'  
  spec.tvos.deployment_target = '9.0'

  spec.source       = { :git => "https://github.com/mirego/taylor-ios.git", :tag => "#{spec.version}" }
  spec.source_files  = "Taylor/**/*.swift"
  # spec.public_header_files = "Taylor/*.h"
end
