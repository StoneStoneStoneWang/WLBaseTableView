

Pod::Spec.new do |spec|
  
  spec.name         = "WLBaseTableView"
  spec.version      = "1.3.5"
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
  
  spec.subspec 'Empty' do |empty|
    
    empty.subspec 'EmptyDataSource' do |source|
      
      source.source_files = "Code/Empty/EmptyDataSource/*.{swift}"
    end
    empty.subspec 'EmptyView' do |view|
      
      view.source_files = "Code/Empty/EmptyView/*.{swift}"
      view.dependency 'WLBaseTableView/Empty/EmptyDataSource'
    end
  end
  
  spec.subspec 'BTVC' do |cell|
    
    cell.source_files = "Code/BaseTableViewCell/*.{swift}"
    cell.dependency 'WLToolsKit/Then'
    cell.dependency 'WLToolsKit/Color'
  end
  spec.subspec 'BTV' do |view|
    
    view.source_files = "Code/BaseTableView/*.{swift}"
    view.dependency 'WLToolsKit/Then'
    view.dependency 'WLToolsKit/Color'
    view.dependency 'RxSwift'
    view.dependency 'WLBaseTableView/Empty/EmptyView'
  end
  spec.subspec 'RTV' do |view|
    
    view.source_files = "Code/RefreshTableView/*.{swift}"
    view.dependency 'RxCocoa'
    view.dependency 'MJRefresh'
    view.dependency 'WLBaseTableView/BTV'
  end
  
  spec.subspec 'SM' do |model|
    
    model.source_files = "Code/SectionModel/*.{swift}"
    model.dependency 'RxDataSources'
  end
  spec.subspec 'ASM' do |model|
    
    model.source_files = "Code/AnimationSectionModel/*.{swift}"
    model.dependency 'RxDataSources'
    model.dependency 'WLToolsKit/Common'
  end
  
end




