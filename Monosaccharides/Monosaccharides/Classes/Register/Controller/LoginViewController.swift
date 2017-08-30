//
//  LoginViewController.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/30.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var QQLoginBtn: UIButton!
    
    @IBOutlet weak var WeChatLogin: UIButton!
    
    @IBOutlet weak var WBLogin: UIButton!
    
    @IBOutlet weak var acountV: UIView!
    
    @IBOutlet weak var pwdV: UIView!
    
    @IBOutlet weak var forgetPWD: UIButton!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var acountL: UILabel!
    
    @IBOutlet weak var acountF: UITextField!
    
    @IBOutlet weak var pwdL: UILabel!
    
    @IBOutlet weak var pwdTextF: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerBtn.tag = 10
        
        forgetPWD.tag = 11
        
        QQLoginBtn.tag = 12
        
        WeChatLogin.tag = 13
        
        WBLogin.tag = 14
        
        loginBtn.tag = 15
        
        setupBarButtonItem()

        self.title = "登录"
        
    }
    
    // MARK: - 设置导航栏按钮
    private func setupBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelButtonClick))
    }
    
    /// 取消按钮点击
    func cancelButtonClick() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func thirdLogin(_ sender: UIButton) {
        
        switch sender.tag {
        case 12:
            
            
            
            break
        case 13:
            
            
            
            break
        case 14:
            
            
            
            break
        default:
            break
        }

        
    }
    
    @IBAction func registerAndForgetPWD(_ sender: UIButton) {
        
        switch sender.tag {
        case 10:
            
            let registerVC = RegisterViewController()
            registerVC.title = "注册"
            navigationController?.pushViewController(registerVC, animated: true)
            
            break
        case 11:
            
            
            
            break
        default:
            break
        }
        
        
    }
    
    
    @IBAction func loginClick(_ sender: UIButton) {
        
        
        
    }
    
    

}












