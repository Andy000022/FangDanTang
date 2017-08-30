//
//  LMJTabBarController.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit
import ColorExtension

class LMJTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChildrenViewControllers()
        
        self.view.backgroundColor = UIColor.white
        
        UITabBar.appearance().tintColor = UIColor.init(hexString: "f75353")
        
    }
    
    func addChildrenViewControllers() {
    
        addChildViewController(HomeViewController(), title: "首页", imageName: "TabBar_home_23x23_", index: 1)
        addChildViewController(ProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_", index: 2)
        addChildViewController(CategoriesViewController(), title: "分类", imageName: "TabBar_category_23x23_", index: 3)
        addChildViewController(ProfileViewController(), title: "个人中心", imageName: "TabBar_me_boy_23x23_", index: 4)
    
    }
    
    fileprivate func addChildViewController(_ controller: UIViewController, title: String, imageName: String, index: NSInteger) {
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        controller.tabBarItem.title = title
        controller.title = title;
        let nav = LMJNavController(rootViewController: controller)
        addChildViewController(nav)
        
    }
    
}
