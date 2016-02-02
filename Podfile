platform :ios, '9.0'
use_frameworks!


link_with 'SendToMe' , 'SendToMeShareExtension'

def test_pods
    pod 'Quick', '~> 0.8.0'
    pod 'Nimble', '~> 3.0.0'
end

target 'SendToMe' do
  pod 'IBAnimatable'
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
    pod 'SwiftMandrill', '~> 1.0.1'
end


plugin 'cocoapods-keys', {
    :project => "SendToMe",
    :target => "SendToMeShareExtension",
    :keys => [
        "mandrill_api_key",
        "from_email_address"
    ]}
