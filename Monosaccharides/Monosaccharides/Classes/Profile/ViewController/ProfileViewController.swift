//
//  ProfileViewController.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController , UITableViewDelegate, UITableViewDataSource{

    var cellCount = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    fileprivate lazy var headerView: ProfileHeaderView = {
    
        let headerView = ProfileHeaderView()
        
        headerView.frame = CGRect.init(x: 0, y: 0, width: KWidth, height: 200)
        
        headerView.msgBtn.addTarget(self, action: #selector(msgBtnClick(_:)), for: .touchUpInside)
        headerView.msgBtn.tag = 10
        
        headerView.settingBtn.addTarget(self, action: #selector(msgBtnClick(_:)), for: .touchUpInside)
        headerView.settingBtn.tag = 11
        
        headerView.icon.addTarget(self, action: #selector(msgBtnClick(_:)), for: .touchUpInside)
        headerView.icon.tag = 12
        
        return headerView
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
    }
    
    private func setupTableView(){
    
        let table = UITableView()
        table.frame = view.bounds
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 44
        self.view.addSubview(table)
        table.tableHeaderView = headerView
        table.tableFooterView = footerView
        table.sectionHeaderHeight = 44
    
    }
    
    fileprivate lazy var footerView:ProfileFooterView = {
    
        let footerView = ProfileFooterView()
        footerView.frame = CGRect.init(x: 0, y: 0, width: KWidth, height: 200)
        footerView.meBlankButton.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        
        return footerView
    
    }()
    
}

//MARK:- 按钮点击事件
extension ProfileViewController {
    
    @objc func msgBtnClick(_ sender: UIButton) {
        
        print("--------\(sender.tag)------------")
    
        switch sender.tag {
        case 10:
            
            
            
            break
            
        case 11:
            
            
            
            break
            
        case 12:
            
            
            
            break
            
        default:
            break
        }
        
    }
    
    @objc func loginClick() {
    
        let nav = LMJNavController(rootViewController: LoginViewController())
        UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: nil)
    }
    
}


extension ProfileViewController {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let selectView = ProfileSelectView()
        
        return selectView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            var tempFrame = headerView.bgV.frame
            tempFrame.origin.y = offsetY
            tempFrame.size.height = 200 - offsetY
            headerView.bgV.frame = tempFrame
        }
    }
    
}

