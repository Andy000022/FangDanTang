//
//  ProfileFooterView.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/29.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class ProfileFooterView: UIView {

    override init(frame: CGRect) {
       
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        addSubview(meBlankButton)
        
        addSubview(messageLabel)
        
        meBlankButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.center.equalTo(self)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(meBlankButton.snp.bottom).offset(kMargin)
            make.left.right.equalTo(self)
        }
    }
    
    lazy var meBlankButton: UIButton = {
        let meBlankButton = UIButton()
        meBlankButton.setTitleColor(CColor(r: 200, g: 200, b: 200, a: 1.0), for: .normal)
        meBlankButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        meBlankButton.setImage(UIImage(named: "Me_blank_50x50_"), for: .normal)
        meBlankButton.imageView?.sizeToFit()
        return meBlankButton
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "登录以享受功能"
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        messageLabel.textColor = CColor(r: 200, g: 200, b: 200, a: 1.0)
        return messageLabel
    }()
    


}
