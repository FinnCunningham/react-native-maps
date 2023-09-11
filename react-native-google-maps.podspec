require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

folly_version = '2021.06.28.00-v2'
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'


Pod::Spec.new do |s|
  s.name         = "react-native-google-maps"
  s.version      = package['version']
  s.summary      = package["description"]
  s.authors      = package["author"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.platform     = :ios, "12.0"

  s.source       = { :git => "https://github.com/react-native-maps/react-native-maps.git", :tag=> "v#{s.version}" }
  s.source_files  = "ios/AirGoogleMaps/**/*.{h,m,mm}"
  s.compiler_flags = '-DHAVE_GOOGLE_MAPS=1', '-DHAVE_GOOGLE_MAPS_UTILS=1', '-fno-modules'

  s.dependency 'React-Core'
  s.dependency 'GoogleMaps', '7.3.0'
  s.dependency 'Google-Maps-iOS-Utils', '4.1.0'

  s.compiler_flags  = folly_compiler_flags

  s.pod_target_xcconfig    = {
    "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
  }

  install_modules_dependencies(s)
end
