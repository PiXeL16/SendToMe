platform :ios, '9.0'
use_frameworks!

link_with 'SendToMe' , 'SendToMeShareExtension'

def test_pods
    pod 'Quick'
    pod 'Nimble'
end

def crash_pods
    pod 'Fabric'
    pod 'Crashlytics'
end

def development_pods
    pod 'IBAnimatable'
    pod 'SwiftDelayer'
    pod 'LogKit'
    pod 'IQKeyboardManagerSwift'
end

def email_pods
    pod 'SwiftMailgun'
end

target 'SendToMe' do
    development_pods
    email_pods
    crash_pods
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
    email_pods
end


plugin 'cocoapods-keys', {
    :project => "SendToMe",
    :target => "SendToMe",
    :keys => [
        "mailgun_api",
        "from_email"
    ]}
