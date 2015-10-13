Pod::Spec.new do |s|
s.name = 'Pollfish'
s.version = '4.1.0'
s.platform = :ios, '6.0'
s.license = { :type => 'Commercial', :text => 'See https://www.pollfish.com/tos' }
s.summary = 'Pollfish iOS Survey Monetization SDK'
s.description = 'Pollfish provides a new interactive monetization format to app developers that pays up to 20x more than classic ad clicks'
s.homepage = 'https://www.pollfish.com'
s.author = { 'Pollfish Inc.' => 'support@pollfish.com' }
s.social_media_url = 'https://twitter.com/pollfish'
s.requires_arc = true
s.source = {
:git => 'https://github.com/pollfish/ios-sdk-pollfish.git',
:tag => s.version.to_s
}
s.frameworks = 'CoreTelephony'
s.weak_frameworks = 'AdSupport'
s.documentation_url = 'https://www.pollfish.com/ios'
s.vendored_frameworks = 'pollfish.framework'

end
