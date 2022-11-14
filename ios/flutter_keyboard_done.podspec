#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_keyboard_done.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_keyboard_done'
  s.version          = '0.0.1'
  s.summary          = 'There is a DONE button above input keyboard when you inputing somethings.'
  s.description      = <<-DESC
There is a DONE button above input keyboard when you inputing something.
                       DESC
  s.homepage         = 'https://github.com/limxing/flutter_keyboard_done'
  s.license          = { :file => '../LICENSE' }
  s.author           = { '北京葡萄智学科技有限公司' => 'lilifeng@putao-inc.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
