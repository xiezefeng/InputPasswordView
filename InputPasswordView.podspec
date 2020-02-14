#
#  Be sure to run `pod spec lint InputPasswordView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "InputPasswordView"
  spec.version      = "0.0.1"
  spec.summary      = "summary 密码输入框"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = "spec.description 密码输入框"

  spec.homepage     = "https://github.com/xiezefeng/InputPasswordView"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  #spec.license      = "MIT (example)"
   spec.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { "谢泽锋" => "xiezf" }
  # Or just: spec.author    = "谢泽锋"
  # spec.authors            = { "谢泽锋" => "xiezf" }
  # spec.social_media_url   = "https://twitter.com/谢泽锋"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
   spec.platform     = :ios, "5.0"

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/xiezefeng/InputPasswordView.git", :tag => "0.0.1" }



  spec.source_files  = "InputPassword/*.{h,m}"
 
   spec.dependency "Masonry", "~> 1.1.0"

end


# Pod::Spec.new do |s|
#   s.name             = 'InputPasswordView'
#   s.version          = '0.0.1'
#   s.summary          = 'An iOS layout framework based on Frame layout. The way using it is like Masonry. CALayer and UIView are both supported. '
#   s.description      = <<-DESC
# An iOS layout framework based on Frame layout. The way using it is like Masonry. CALayer and UIView are both supported. 
#                         DESC

#   s.homepage         = 'https://github.com/xiezefeng/InputPasswordView'
#   s.license          = { :type => 'MIT', :file => 'LICENSE' }
#   s.author           = { 'wangwanjie' => 'wangwanjie1993@gmail.com' }
#   s.source       = { :git => "https://github.com/xiezefeng/InputPasswordView.git", :tag => s.version.to_s }
#   s.ios.deployment_target = '6.0'
#   s.source_files = 'InputPasswordView/**/*.{h,m}'
#   s.source_files  = "InputPasswordView", "InputPasswordView/**/*.{h,m}"
#   s.public_header_files = 'InputPasswordView/**/*.h'
#   s.frameworks = 'UIKit', 'Foundation'
#   s.requires_arc = true
#   s.dependency "Masonry"
# end
