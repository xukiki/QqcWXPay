Pod::Spec.new do |s|

  s.license      = "MIT"
  s.author       = { "qqc" => "20599378@qq.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc  = true

  s.name         = "QqcPay"
  s.version      = "1.0.2"
  s.summary      = "QqcPay"
  s.homepage     = "https://github.com/xukiki/QqcPay"
  s.source       = { :git => "https://github.com/xukiki/QqcPay.git", :tag => "#{s.version}" }
  
  s.source_files = 'QqcPay/*.{h,m}'

  s.subspec 'WXPay1_7_1' do |sp|
    sp.source_files = 'QqcPay/WXPay1_7_1/*.{h,m}'
    sp.vendored_libraries = "QqcPay/WXPay1_7_1/libWeChatSDK.a"
    sp.libraries = 'libc++','libz','libsqlite3.0'
    sp.frameworks = 'SystemConfiguration','CoreTelephony','Security','Foundation','UIKit'
  end

  s.subspec 'AliPay15_1_3' do |sp|
    sp.source_files = 'QqcPay/AliPay15_1_3/*.{h,m}'

    sp.subspec 'openssl' do |ssp|
      ssp.source_files = 'QqcPay/AliPay15_1_3/openssl/*.h'
    end

    sp.subspec 'Util' do |ssp|
      ssp.source_files = 'QqcPay/AliPay15_1_3/Util/*.{h,m}'
    end

    sp.subspec 'sdk' do |ssp|
      ssp.vendored_libraries = "QqcPay/AliPay15_1_3/sdk/libcrypto.a"
      ssp.vendored_libraries = "QqcPay/AliPay15_1_3/sdk/libssl.a"
      ssp.vendored_frameworks = 'QqcPay/AliPay15_1_3/sdk/AlipaySDK.framework'
      ssp.resource = 'QqcPay/AliPay15_1_3/sdk/AlipaySDK.bundle'
    end

    sp.libraries = 'libc++','libz'
    sp.frameworks = 'SystemConfiguration','CoreTelephony','QuartzCore','CoreText','CoreGraphics','CFNetwork','CoreMotion','Foundation','UIKit'
    
  end

  s.dependency 'QqcSingletonTemplate'
  s.dependency 'QqcLog'
  
end
