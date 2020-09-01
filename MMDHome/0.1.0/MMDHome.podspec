#
# Be sure to run `pod lib lint MMDHome.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MMDHome'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MMDHome.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/shopping1985/MMDHome'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shopping1985' => '285624489@qq.com' }
  s.source           = { :git => 'https://github.com/shopping1985/MMDHome.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  #s.source_files = 'MMDHome/Classes/*'
  #--类文件分层--#
  s.subspec 'rank' do |ss|
    ss.source_files = 'MMDHome/Classes/rank/*.{h,m}'
  end
  s.subspec 'home' do |ss|
    ss.dependency 'MMDHome/rank'
    ss.source_files = 'MMDHome/Classes/home/*.{h,m}'
  end
  s.subspec 'target' do |ss|
    ss.dependency 'MMDHome/home'
    ss.dependency 'MMDHome/rank'
    ss.source_files = 'MMDHome/Classes/target/*.{h,m}'
  end
  #--资源文件--#
  s.resource_bundles = {
     'MMDHome' => ['MMDHome/Assets/*','MMDHome/Classes/**/*.{storyboard,xib}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'ZDUtilComponent'
  s.dependency 'ZDUIComponent'
  
  #--预编译头内容需执行pod install后才生成到MMDHome-prefix.pch
  s.prefix_header_contents = '#import <ZDUtilComponent/ZDUtilsComponent.h>','#import <ZDUIComponent/ZDUIComponent.h>','#define MMDHome_Bundle [NSBundle wg_subBundleWithBundleName:@"MMDHome" targetClass:[self class]]'
end
