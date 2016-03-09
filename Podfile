platform :ios, '9.0'
use_frameworks!

link_with 'SendToMe' , 'SendToMeShareExtension'

def test_pods
    pod 'Quick', '~> 0.8.0'
    pod 'Nimble', '~> 3.0.0'
end

target 'SendToMe' do
  pod 'IBAnimatable'
  pod 'SwiftDelayer'
  pod 'LogKit', '~> 2.1'
  pod 'IQKeyboardManagerSwift'
end

target 'SendToMeTests' do
    test_pods
end

target 'SendToMeUITests' do

end

target 'SendToMeFramework' do

end

target 'SendToMeFrameworkTests' do
     test_pods
end

target 'SendToMeShareExtension' do
    pod 'SwiftMailgun'
end


plugin 'cocoapods-keys', {
    :project => "SendToMe",
    :target => "SendToMeShareExtension",
    :keys => [
        "mailgun_api",
        "from_email"
    ]}
