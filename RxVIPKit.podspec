Pod::Spec.new do |s|
    s.name          = 'RxVIPKit'
    s.version       = '0.1.2'
    s.summary       = 'Vip Architecture with RxSwift helper tools'
    s.homepage      = 'https://github.com/jiwonsis/RxVipKit'
    s.summary       = 'Vip Architecture with RxSwift helper tools'  
    s.author        = { 'Scott Moon' => 'interactord@gmail.com' }
    s.source        = { :git => 'https://github.com/jiwonsis/RxVipKit.git',
                        :tag => s.version.to_s }
    s.license       = { :type => "MIT", :file => "LICENSE" }
    s.source_files  = 'RxVipKit/Foundation/**/*'
    s.frameworks    = 'UIKit', 'Foundation'
    s.requires_arc  = true
  
    s.dependency 'RxSwift', '>= 4.4.0'
    s.dependency 'RxCocoa', '>= 4.4.0'
    s.dependency 'SwiftyBeaver'
    s.dependency 'Swinject'
  
    s.ios.deployment_target = '11.0'
  
    s.pod_target_xcconfig = {
      'SWIFT_VERSION' => '4.2'
    }
  end
