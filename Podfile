platform :ios, '9.0'
use_frameworks!

link_with 'SendToMe' , 'SendToMeShareExtension'

def test_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'SendToMe' do
  pod 'IBAnimatable'
  pod 'SwiftDelayer'
  pod 'LogKit'
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
