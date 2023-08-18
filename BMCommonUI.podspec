
Pod::Spec.new do |spec|

  spec.name         = "BMCommonUI"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of BMCommonUI.podspec."
  spec.description  = <<-DESC
  BMCommonUI components
                   DESC

  spec.homepage     = "http://github/BMCommonUI"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "liuyuanyuan" => "1085798092@qq.com" }
  spec.ios.deployment_target = '13.0'

  spec.source       = { :git => "git@git.bongmi.cn:bongmi/BMCommonUI.podspec.git", :tag => "#{spec.version}" }

  spec.source_files  = "#{spec.name}/Classes/**/*"
  spec.requires_arc = true
  spec.resource  = "#{spec.name}/Assets/**/*"
  # spec.resources = "Resources/*.png"

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # 

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
