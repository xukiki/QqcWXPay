Pod::Spec.new do |s|

  s.license      = "MIT"
  s.author       = { "qqc" => "20599378@qq.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc  = true

  s.name         = "QqcWXPay"
  s.version      = "1.0.22"
  s.summary      = "QqcWXPay"
  s.homepage     = "https://github.com/xukiki/QqcWXPay"
  s.source       = { :git => "https://github.com/xukiki/QqcWXPay.git", :tag => "#{s.version}" }
  
  s.source_files = 'QqcWXPay/*.{h,m}'

  s.dependency 'QqcSingletonTemplate'
  s.dependency 'QqcLog'
  s.dependency 'QqcWXPaySDK'
  #s.dependency 'ShareSDK3/ShareSDKPlatforms/WeChat'
end
