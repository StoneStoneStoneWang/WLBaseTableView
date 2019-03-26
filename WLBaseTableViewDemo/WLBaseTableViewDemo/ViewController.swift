//
//  ViewController.swift
//  WLBaseTableViewDemo
//
//  Created by three stone 王 on 2018/11/25.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import RxCocoa
import RxDataSources
import RxSwift
import MJRefresh
import WLToolsKit

class ViewController: UIViewController {
    
    var tableView:UITableView!
    
    typealias Section = MySection<String>
    
    var dataSource: RxTableViewSectionedAnimatedDataSource<Section>!
    
    let disposeBag = DisposeBag()
    
    let tableData: Variable<[String]> = Variable<[String]>(["1","2","3","4"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建表格视图
        self.tableView = WLBaseTableView.baseTableView(frame: view.bounds)
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(self.tableView)
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<Section>(
            animationConfiguration: AnimationConfiguration(insertAnimation: .top,
                                                           reloadAnimation: .fade,
                                                           deleteAnimation: .left),
            configureCell: { ds, tv, ip, item in
                
                let cell = tv.dequeueReusableCell(withIdentifier: "Cell")
                
                cell?.textLabel?.text = item
                
                return cell!
        },titleForHeaderInSection: { data,ip in
            
            return data[ip].header
        },canEditRowAtIndexPath: {_,_ in
            
            return true
        })
        
        self.dataSource = dataSource
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

extension ViewController : UITableViewDelegate  {
    
    //设置单元格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
        -> CGFloat {
            
            return 60
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "删除") { (a, ip) in
            
            self.tableData.value.remove(at: ip.section)
        }
        
        return [delete]
    }
}
