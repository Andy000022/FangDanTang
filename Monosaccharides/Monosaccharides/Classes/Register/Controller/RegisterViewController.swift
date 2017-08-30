//
//  RegisterViewController.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/30.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var bgV: UIImageView!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var registerView: UIView!
    
    @IBOutlet weak var mobileV: UIView!
    
    @IBOutlet weak var mobileL: UILabel!
    
    @IBOutlet weak var mobileTextF: UITextField!

    @IBOutlet weak var codeV: UIView!
    
    @IBOutlet weak var codeL: UILabel!
    
    @IBOutlet weak var codeTextF: UITextField!
    
    @IBOutlet weak var codeBtn: UIButton!
    
    @IBOutlet weak var pwdV: UIView!
    
    @IBOutlet weak var pwdL: UILabel!
    
    @IBOutlet weak var pwdTextF: UITextField!
  
    @IBOutlet weak var confirmV: UIView!
    
    @IBOutlet weak var confirmL: UILabel!
    
    @IBOutlet weak var confirmTextF: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

    @IBAction func getCode(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func loginClick(_ sender: Any) {
        
        let loginVC = LoginViewController()
        loginVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    
    @IBAction func registerClick(_ sender: Any) {
        
        
        
        
    }
    
    
}
