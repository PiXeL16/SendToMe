platform :ios, '8.0'
use_frameworks!

pod 'LogKit', '~> 2.1'
pod 'SwiftMandrill', '~> 1.0.1'

target 'SendToMe' do
end

target 'SendToMeTests' do
    pod 'Quick', '~> 0.8.0'
    pod 'Nimble', '~> 3.0.0'
end

#target 'SendToMeUITests' do

#end

plugin 'cocoapods-keys', {
    :project => "SendToMe",
    :keys => [
      "mandrill_api_key"
]}

