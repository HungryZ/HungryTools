#
# Be sure to run `pod lib lint HungryTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HungryTools'
  s.version          = '1.2.6'
  s.summary          = 'Some tools often used.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Some tools often used, personal.
                       DESC

  s.homepage         = 'https://github.com/HungryZ/HungryTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zhanghaichuan' => '924320752@qq.com' }
  s.source           = { :git => 'https://github.com/HungryZ/HungryTools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

#  s.source_files = 'HungryTools/Classes/**/*'
#  s.public_header_files = 'HungryTools/Classes/HungryTools.h'
  
  # s.resource_bundles = {
  #   'HungryTools' => ['HungryTools/Assets/*.png']
  # }

  s.frameworks = 'UIKit'
  s.dependency 'Masonry', '~> 1.1.0'

  #二级目录
  s.subspec 'Macro' do |ss|
    ss.source_files = 'HungryTools/Classes/Macro/**/*'
  end
  s.subspec 'Category' do |ss|
    ss.source_files = 'HungryTools/Classes/Category/**/*'
  end
  s.subspec 'ZHCTextField' do |ss|
    ss.source_files = 'HungryTools/Classes/ZHCTextField/**/*'
    ss.dependency 'HungryTools/Category'
    ss.dependency 'HungryTools/Macro'
    ss.resource_bundles = {
      'Resource' => ['HungryTools/Assets/Resource/*.png']
    }
  end
end
