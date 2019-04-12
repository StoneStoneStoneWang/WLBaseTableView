

Pod::Spec.new do |spec|
  
  spec.name         = "WLBaseTableView"
  spec.version      = "1.3.1"
  spec.summary      = "A Lib For tableview."
  spec.description  = <<-DESC
  A Lib For tableView with MJRefresh and rxswift .
  DESC
  
  spec.homepage     = "https://github.com/StoneStoneStoneWang/WLBaseTableView"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = "9.0"
  
  spec.swift_version = '5.0'
  
  spec.frameworks = 'UIKit', 'Foundation'
  
  spec.source = { :git => "https://github.com/StoneStoneStoneWang/WLBaseTableView.git", :tag => "#{spec.version}" }
  
  spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  
  spec.static_framework = true
  
  spec.subspec 'WLEmpty' do |empty|
    
    empty.subspec 'WLEmptyDataSource' do |source|
      
      source.source_files = "Code/Empty/EmptyDataSource/*.{swift}"
    end
    empty.subspec 'WLEmptyView' do |view|
      
      view.source_files = "Code/Empty/EmptyView/*.{swift}"
      view.dependency 'WLBaseTableView/WLEmpty/WLEmptyDataSource'
    end
    
  end
  spec.subspec 'WLBaseTableViewCell' do |cell|
    
    cell.source_files = "Code/BaseTableViewCell/*.{swift}"
    cell.dependency 'WLToolsKit/WLThen'
    cell.dependency 'WLToolsKit/WLColor'
  end
  spec.subspec 'WLBTV' do |view|
    
    view.source_files = "Code/BaseTableView/*.{swift}"
    view.dependency 'WLToolsKit/WLThen'
    view.dependency 'WLToolsKit/WLColor'
    view.dependency 'RxSwift'
    view.dependency 'WLBaseTableView/WLEmpty/WLEmptyView'
  end
  spec.subspec 'WLRTV' do |view|
    
    view.source_files = "Code/RefreshTableView/*.{swift}"
    view.dependency 'RxCocoa'
    view.dependency 'MJRefresh'
    view.dependency 'WLBaseTableView/WLBTV'
  end
  spec.subspec 'WLSectionModel' do |model|
    
    model.source_files = "Code/SectionModel/*.{swift}"
    model.dependency 'RxDataSources'
  end
  spec.subspec 'WLAnimationSectionModel' do |model|
    
    model.source_files = "Code/AnimationSectionModel/*.{swift}"
    model.dependency 'RxDataSources'
    model.dependency 'WLToolsKit/WLCommon'
  end
  
end




