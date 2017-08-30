//
//  HomeViewController.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    fileprivate lazy var segment = UISegmentedControl()
    var channels = [HomeChannelModel]()
    var titleArr = NSMutableArray()
    var typeArr = NSMutableArray()

    var type = Int()
    var info = [TopicInfoModel]()
    fileprivate lazy var page = UIView()
    
    fileprivate lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        
        self.view.addSubview(segment)
        
        weak var weakSelf = self
        // 获取首页顶部选择数据
        LMJNetworkTools.tools.loadHomeTopData { (homeChannels) in
            for channel in homeChannels {
                
                weakSelf?.titleArr.add(channel.name!)
                weakSelf?.typeArr.add(channel.id!)
                
            }
            
            weakSelf?.setupTagsView(arr: (weakSelf?.titleArr)!)
            // 获取首页数据
            weakSelf?.type = weakSelf?.typeArr[0] as! Int
            LMJNetworkTools.tools.loadHomeTopicInfo(id: (weakSelf?.type)!, finished: { (topicInfos) in
                
                weakSelf!.info = topicInfos
                weakSelf!.tableView.reloadData()
                
            })
            
        }
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64+tagsH, width: KWidth, height: KHeight - (64+tagsH) - 50), style: .plain)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 160
        tableView.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        

    }
    
    func setupTagsView(arr: NSMutableArray) {
    
        segment = UISegmentedControl.init(items: arr as? [Any])
        segment.backgroundColor = UIColor.init(hexString: "f8f8f8")
        segment.frame = CGRect.init(x: 0, y: 64, width: KWidth, height: tagsH)
        segment.tintColor = UIColor.clear
        
        // 设置一个字体的字典，内容为没点击的字体大小和颜色
        let unselectedTextAttributes: NSDictionary = [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.black];
        
        segment.setTitleTextAttributes(unselectedTextAttributes as [NSObject : AnyObject], for: .normal)
        
        // 点击之后的字体大小和颜色
        let selectedTextAttributes: NSDictionary = [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.init(hexString: "f75353")]
        
        segment.setTitleTextAttributes(selectedTextAttributes as [NSObject : AnyObject], for: .selected)
        
        segment.selectedSegmentIndex = 0
        
        segment.addTarget(self, action: #selector(self.segmentChange(segmented:)), for: .valueChanged)
        
        segment.addSubview(page)
        page.x = 10
        page.y = 33
        page.width = tagsW - 20
        page.height = 2
        page.backgroundColor = UIColor.init(hexString: "f75353")
        
        self.view.addSubview(segment)
        
    }
    
    func segmentChange(segmented: UISegmentedControl) {
        
        UIView.animate(withDuration: kAnimationDuration) {
            
            self.page.x = 10+CGFloat(segmented.selectedSegmentIndex)*tagsW

        }
        //获得选项的索引
        type = typeArr[segment.selectedSegmentIndex] as! Int
        
        weak var weakSelf = self
        LMJNetworkTools.tools.loadHomeTopicInfo(id: type, finished: { (topicInfos) in
            
            weakSelf!.info = topicInfos
            weakSelf!.tableView.reloadData()
            
        })
    }
    
    
}

extension HomeViewController {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1.创建cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.topicInfos = info[indexPath.row]
        
        return cell;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        detailVC.info = info[indexPath.row]
        detailVC.title = "攻略详情"
        navigationController?.pushViewController(detailVC, animated: true)
        
    }

}
