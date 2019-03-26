//
//  WLTableViewEditCommand.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2019/3/26.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import RxDataSources
// 先预留。没想好怎么用
public enum WLTableEditingCommand<ItemType: IdentifiableType & Equatable>{
    case setItems(items: [ItemType])  //设置表格数据
    case addItem(item: ItemType)  //新增数据
    case moveItem(from: IndexPath, to: IndexPath) //移动数据
    case deleteItem(IndexPath) //删除数据
    case reloadItem(IndexPath,ItemType) // 刷新某一条数据
}
