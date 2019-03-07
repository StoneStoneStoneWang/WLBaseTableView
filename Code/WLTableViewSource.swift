//
//  WLTableViewSource.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2019/3/6.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import UIKit

public protocol WLTableViewSource {
    
    var title: String { get }
    
    var icon: String { get }
    
    var subYitle: String { get }
    
    var cellHeight: CGFloat { get }
}
