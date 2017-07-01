#
#  Be sure to run `pod spec lint BLSmartLayoutEngine.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "BLSmartLayoutEngine"
  s.version      = "1.0.2"
  s.summary      = "A lightweight layout engine for iOS"
  s.homepage     = "https://github.com/arlins/BLSmartLayoutEngine"
  s.license      = "MIT"
  s.author       = { "Arlin" => "420776870@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { 
    :git => "https://github.com/arlins/BLSmartLayoutEngine.git", 
    :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = "BLSmartLayoutEngine"
  s.public_header_files = "BLSmartLayoutEngine/BLSmartLayout.h",
                          "BLSmartLayoutEngine/UIView+BLSmartLayoutEngine.h",
                          "BLSmartLayoutEngine/BLSmartVBoxLayout.h"
  s.framework   = "Foundation", "CoreGraphics", "UIKit"
end
