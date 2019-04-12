//
//  WLAnimationSectionModel.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2019/3/26.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import RxDataSources
import WLToolsKit

public struct MySection<ItemType: IdentifiableType & Equatable> {
    public var header: String
    public var items: [Item]
    
    public init(header: String, items: [Item]) {
        self.header = header
        self.items = items
    }
}

extension MySection : AnimatableSectionModelType {
    public typealias Item = ItemType
    
    public var identity: String {
        return header
    }
    
    public init(original: MySection, items: [Item]) {
        self = original
        self.items = items
    }
    //执行相应的命令，并返回最终的结果
    // 这个现在这里留着
//    func execute(command: WLTableEditingCommand<ItemType>) -> MySection<ItemType> {
//        switch command {
//        case let .setItems(items):
//            printLog(message: "初始化数据。")
//            return MySection(header: header, items: items)
//        case let .addItem( item):
//            printLog(message: "新增数据项。")
//            var items = self.items
//            items.append(item)
//            return MySection(header: header, items: items)
//        case let.moveItem( from, to):
//            printLog(message: "移动数据项。")
//            var items = self.items
//            items.insert(items.remove(at: from.row), at: to.row)
//            return MySection(header: header, items: items)
//        case let .deleteItem(indexPath):
//            var items = self.items
//            items.remove(at: indexPath.row)
//            printLog(message: "删除数据项。")
//            return MySection(header: header, items: items)
//        case let .reloadItem(indexPath,item):
//            var items = self.items
//            printLog(message: "刷新某一条数据")
//            items.replaceSubrange(indexPath.section..<indexPath.section+1, with: [item])
//            return MySection(header: header, items: items)
//        }
//    }
}
