//
//  WLTableViewEmptyView.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2019/3/6.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import UIKit

// 不加 open 或者public关键字 
class WLTableViewEmptyView: UIView {
    
    var iconImageView: UIImageView = UIImageView()
    
    var titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commitInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func emptyViewShow(_ source: WLTableViewEmptyViewSource) {
        
        iconImageView.image = UIImage(named: source.icon)
        
        iconImageView.frame = source.iconFrame
        
        titleLabel.attributedText = source.emptyText
        
        titleLabel.frame = source.emptyTextFrame
    }
}
extension WLTableViewEmptyView {
    
    func commitInit() {
        
        addSubview(iconImageView)
        
        addSubview(titleLabel)
    }
}
