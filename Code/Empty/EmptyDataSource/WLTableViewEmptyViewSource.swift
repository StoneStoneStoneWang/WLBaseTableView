//
//  WLTableViewEmptyViewSource.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2019/3/6.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import UIKit
@objc (WLTableViewEmptyViewSource)
public protocol WLTableViewEmptyViewSource {
    
    var emptyAText: NSAttributedString { get }
    
    var emptyFrame: CGRect { get }
    
    var emptyIcon: String { get }
    
    var emptyIconFrame: CGRect { get }
    // 是否响应tableview的手势
    var canResponse: Bool { get }
    
    var emptyBackgroundHex: String { get }
}
