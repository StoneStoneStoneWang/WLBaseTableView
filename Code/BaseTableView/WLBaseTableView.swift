//
//  WLBaseTableView.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2018/11/25.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import RxSwift
import WLToolsKit
@objc (WLBaseTableView)
open class WLBaseTableView: UITableView {
    
    public let disposeBag = DisposeBag()
    
    fileprivate final let emptyView: WLTableViewEmptyView = WLTableViewEmptyView(frame: .zero)
    @objc (baseTableView)
    public static func baseTableView() -> Self { return self.init(frame: .zero,style: .plain) }
    @objc (baseTableViewWithFrame:)
    public static func baseTableView(frame: CGRect) -> Self { return self.init(frame: frame,style: .plain) }
    @objc (baseTableViewWithFrame:andStyle:)
    public static func baseTableView(frame: CGRect, style: UITableView.Style) -> Self { return self.init(frame: frame,style: style) }
    
    public required override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        commitInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WLBaseTableView {
    @objc (commitInit)
    open func commitInit() {
        
        showsVerticalScrollIndicator = false
        
        showsHorizontalScrollIndicator = false
        
        backgroundColor = .clear
        
        separatorStyle = .none
        
        keyboardDismissMode = .onDrag
    }
}

extension WLBaseTableView {
    @objc (emptyViewShowWithDataSource:)
    public func emptyViewShow(_ source: WLTableViewEmptyViewSource) {
        
        if source.canResponse { addSubview(emptyView) }
            
        else { superview?.addSubview(emptyView) }
        
        emptyView.frame = source.emptyFrame
        
        emptyView.backgroundColor = WLHEXCOLOR(hexColor: source.emptyBackgroundHex)
        
        emptyView.emptyViewShow(source)
    }
    @objc (emptyViewHidden)
    public func emptyViewHidden() {
        
        emptyView.isHidden = true
        
        emptyView.removeFromSuperview()
    }
}
