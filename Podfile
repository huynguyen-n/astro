#
#   Created by : Huy Nguyen
#
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
workspace 'AstroWorkspace.xcworkspace'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

# Pods
def important_pods

    # Core
    pod 'Alamofire', '4.5'
    pod 'Unbox', '2.5'
    pod 'Wrap', '2.1.1'
    pod 'RxSwift',    '3.6.1'
    pod 'RxCocoa',    '3.6.1'
    pod 'SwiftLint', '0.21.0'
    pod 'OAuthSwift', '1.1.2'
    pod 'SwiftyBeaver', '1.4.0'
end

# AstroApp
target "AstroApp" do
  project 'AstroApp/AstroApp.xcodeproj'
  important_pods
end

# AstroCore
target "AstroCore" do
  project 'AstroCore/AstroCore.xcodeproj'
  important_pods
end
