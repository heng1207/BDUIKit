#
# Be sure to run `pod lib lint BDUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BDUIKit'
  s.version          = '1.0.7'
  #总结
  s.summary          = 'iOSUI基础控件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    TODO: iOSUI基础控件,方便使用。
                       DESC

  s.homepage         = 'https://github.com/heng1207/BDUIKit.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your zhangheng' => '1356770740.com' }
  s.source           = { :git => 'https://github.com/heng1207/BDUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

#  s.source_files = 'BDUIKit/Classes/**/*'
  s.source_files = 'BDUIKit/Classes/*.{h,m}'
  #二级目录
  s.subspec 'UIButton' do |ss|
    ss.source_files = 'BDUIKit/Classes/UIButton/*.{h,m}'
    #二级目录
  end
  s.subspec 'UIImage' do |ss|
    ss.source_files = 'BDUIKit/Classes/UIImage/*.{h,m}'
    #二级目录
  end
  s.subspec 'UIView' do |ss|
    ss.source_files = 'BDUIKit/Classes/UIView/*.{h,m}'
    #二级目录
  end
  
  #静态库文件的依赖
  s.vendored_frameworks = 'BDUIKit/Classes/SimpleSDK.framework'
  
  # s.resource_bundles = {
  #   'BDUIKit' => ['BDUIKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # 尝试引入第三方依赖库
  s.dependency 'AFNetworking'
end
