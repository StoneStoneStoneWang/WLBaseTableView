//
//  WLBaseTableViewCell.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2018/11/25.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import WLToolsKit
@objc (WLBaseTableViewCell)
open class WLBaseTableViewCell: UITableViewCell {
    
    var indexPath: IndexPath!
    
    @objc (iconImageView)
    open var iconImageView: UIImageView = UIImageView().then {
        
        $0.contentMode = .scaleAspectFill
        
        $0.tag = 2001
    }
    @objc (titleLabel)
    open var titleLabel: UILabel = UILabel().then {
        
        $0.tag = 2002
        
        $0.font = UIFont.systemFont(ofSize: 15)
        
        $0.textAlignment = .left
        
        $0.textColor = WLHEXCOLOR(hexColor: "#333333")
    }
    
    fileprivate final let bottomLine: UIImageView = UIImageView().then {
        
        $0.tag = 2003
    }
    @objc (lineType)
    open var lineType: WLBottomLineType = .lightgray {
        
        willSet { bottomLine.backgroundColor = WLHEXCOLOR(hexColor: newValue.colorHex) }
    }
    @objc (baseTableViewCellWithLineType: andReuseIdentifier:)
    public static func baseTableViewCell(_ lineType: WLBottomLineType ,_ reuseIdentifier: String) -> Self {
        
        return self.init(lineType,style: .default ,reuseIdentifier: reuseIdentifier)
    }
    
    required public convenience init(_ lineType: WLBottomLineType ,style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        self.lineType = lineType
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commitInit()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WLBaseTableViewCell {
    @objc (commitInit)
    open func commitInit() {
        
        selectionStyle = .none
        
        contentView.addSubview(iconImageView)
        
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(bottomLine)
        
        lineType = .lightgray
        
        backgroundColor = .white
    }
}

extension WLBaseTableViewCell {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        bottomLine.frame = CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: 1)
    }
}

extension WLBaseTableViewCell {
    
    @objc (WLBottomLineType)
    public enum WLBottomLineType: Int {
        case none
        
        case white
        
        case lightgray
        
        case black
        
        var colorHex: String {
            
            switch self {
            case .none: return ""
            case .lightgray: return "#eeeeee"
            case .black: return "#000000"
            case .white: return "#ffffff"
            }
        }
    }
}
