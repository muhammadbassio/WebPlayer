Pod::Spec.new do |s|
  s.name             = 'WebPlayer'
  s.version          = '1.0'
  s.summary          = 'A Wrapper around WKWebView to embed videos into your iOS app.'
 
  s.description      = <<-DESC
A Wrapper around WKWebView to embed videos into your iOS app (YouTube, Vimeo, Dailymotion, Facebook, ...etc).
                       DESC
 
  s.homepage         = 'https://github.com/muhammadbassio/WebPlayer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Muhammad Bassio' => 'muhammadbassio@gmail.com' }
  s.source           = { :git => 'https://github.com/muhammadbassio/WebPlayer.git', :tag => s.version.to_s }
 
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.ios.deployment_target = '9.0'
  s.source_files = 'source/*.swift'
 
end