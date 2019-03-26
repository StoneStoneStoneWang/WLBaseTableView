//
//  WLTableViewEmptyViewSource.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2019/3/6.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import UIKit

public protocol WLTableViewEmptyViewSource {
    
    var emptyText: NSAttributedString { get }
    
    var emptyTextFrame: CGRect { get }
    
    var emptyFrame: CGRect { get }
    // 是否响应tableview的手势
    var canResponse: Bool { get }
    
    var emptyBackgroundHex: String { get }
}
