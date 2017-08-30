//
//  ProfileHeaderView.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/29.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bgV : UIImageView = {
    
        let bgV = UIImageView()
        bgV.contentMode = .scaleAspectFill
        bgV.image = UIImage(named:"Me_ProfileBackground")
        
        return bgV
        
    }()
    
    lazy var msgBtn: UIButton = {
    
        let  msgBtn = UIButton()
        msgBtn.setImage(UIImage(named:"Me_message_20x20_"), for: .normal)
        
        return msgBtn
    
    }()
    
    lazy var settingBtn: UIButton = {
    
        let settingBtn = UIButton()
        settingBtn.setImage(UIImage(named:"Me_settings_20x20_"), for: .normal)
        
        return settingBtn
    
    }()
    
    lazy var icon: UIButton = {
    
        let iconBtn = UIButton()
        iconBtn.setBackgroundImage(UIImage(named:"Me_AvatarPlaceholder_75x75_"), for: .normal)
        iconBtn.layer.cornerRadius = iconBtn.width * 0.5
        iconBtn.layer.masksToBounds = true
        
        return iconBtn
        
    }()
    
    lazy var nameL: UILabel = {
    
        let nameL = UILabel()
        nameL.textColor = UIColor.white
        nameL.font = UIFont.systemFont(ofSize: 15)
        nameL.textAlignment = .center
        nameL.text = "anything"
        
        return nameL
        
    }()
    
    private func initUI() {
    
        addSubview(bgV)
        addSubview(msgBtn)
        addSubview(settingBtn)
        addSubview(icon)
        addSubview(nameL)
        
        bgV.snp.makeConstraints { (maker) in
            
            maker.left.bottom.right.equalTo(self)
            maker.top.equalTo(-20)
            
        }
        
        msgBtn.snp.makeConstraints { (maker) in
            
            maker.size.equalTo(CGSize.init(width: 44, height: 44))
            maker.left.equalTo(self)
            maker.top.equalTo(0)
            
        }
        
        settingBtn.snp.makeConstraints { (maker) in
            
            maker.size.equalTo(msgBtn)
            maker.right.equalTo(self)
            maker.top.equalTo(msgBtn.snp.top)
            
        }
        
        nameL.snp.makeConstraints { (maker) in
            
            maker.bottom.equalTo(-3*kMargin)
            maker.left.right.equalTo(self)
            maker.height.equalTo(20)
            
        }
        
        icon.snp.makeConstraints { (maker) in
            
            maker.size.equalTo(CGSize.init(width: 80, height: 80))
            maker.centerX.equalTo(self)
            maker.bottom.equalTo(nameL.snp.top).offset(-kMargin)
            
        }
    
    }

}
