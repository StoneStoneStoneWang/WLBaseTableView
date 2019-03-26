//
//  WLTableViewEmptyView.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2019/3/6.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import UIKit

// 不加 open 或者public关键字 
@objc final public class WLTableViewEmptyView: UIView {
    
    final let titleLabel: UILabel = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commitInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func emptyViewShow(_ source: WLTableViewEmptyViewSource) {
        
        titleLabel.attributedText = source.emptyText
        
        titleLabel.frame = source.emptyTextFrame
    }
}
extension WLTableViewEmptyView {
    
    public func commitInit() {
        
        addSubview(titleLabel)
    }
}
