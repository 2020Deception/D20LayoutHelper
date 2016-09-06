#
# Be sure to run `pod lib lint D2LayoutHelperPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'D2LayoutHelperPod'
  s.version          = '0.1.0'
  s.summary          = 'This gives you some simple methods to accomplish simple common tasks with NSLayoutConstraints.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/2020deception/D2LayoutHelperPod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brian Bowman' => 'brian.bowman@carrotcreative.com' }
  s.source           = { :git => 'https://github.com/2020deception/D2LayoutHelperPod.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/2020deception'

  s.ios.deployment_target = '9.0'

  s.source_files = 'D2LayoutHelperPod/Classes/**/*'
  
  # s.resource_bundles = {
  #   'D2LayoutHelperPod' => ['D2LayoutHelperPod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
