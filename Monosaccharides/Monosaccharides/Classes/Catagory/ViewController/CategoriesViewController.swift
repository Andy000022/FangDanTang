//
//  CategoriesViewController.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    fileprivate lazy var table = UITableView()
    
    var outGroups = [AnyObject]()
    var titleArr = NSArray()
    var styleArr = NSMutableArray()
    var categoryArr = NSMutableArray()
    var collections = [AnyObject]()
    var bannerArr = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: KWidth, height: KHeight), style: .grouped)
        self.view.addSubview(table)
        table.separatorStyle = .none
        table.dataSource = self
        table.delegate = self
        table.register(UINib.init(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        table.register(UINib.init(nibName: "CategoryHeaderCell", bundle: nil), forCellReuseIdentifier: "cell2")
        
        /// 分类界面 风格,品类
        weak var weakSelf = self
        LMJNetworkTools.tools.loadCategoryGroup { (outGroups) in
            weakSelf!.outGroups = outGroups
            weakSelf?.categoryArr.addObjects(from: outGroups[1] as! [AnyObject])
            weakSelf?.styleArr.addObjects(from: outGroups[0] as! [AnyObject])
            weakSelf?.table.reloadData()
        }
        
        titleArr = ["专题合集","风格","品类"]
        
        // banner图
        LMJNetworkTools.tools.loadCategoryCollection(limit: 6) { (collections) in
            weakSelf?.collections = collections
            weakSelf?.bannerArr.addObjects(from: collections)
            weakSelf?.table.reloadData()
        }
        
    }

}

extension CategoriesViewController {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! CategoryHeaderCell
            cell.selectionStyle = .none
            cell.title.text = titleArr[indexPath.section] as? String
            cell.collections = bannerArr
            cell.collectionV.reloadData()
            
            return cell
        }

        // 1.创建cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if indexPath.section == 1 {
           
            cell.group = styleArr
            cell.collect.reloadData()
            
        } else if indexPath.section == 2 {
        
            cell.group = categoryArr
            cell.collect.reloadData()
        }
        
        cell.title.text = titleArr[indexPath.section] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 160
        
        } else if indexPath.section == 1 {
        
            return 40+(KWidth - 70 * 4)*2/5+100
        
        }
        
        return 40+(KWidth - 70 * 4)*3/5+200
        
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 0.01
    }
    
}
