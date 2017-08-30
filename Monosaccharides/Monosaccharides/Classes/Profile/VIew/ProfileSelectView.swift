//
//  ProfileSelectView.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/29.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class ProfileSelectView: UIView {

    lazy var leftBtn: UIButton = {
    
        let leftBtn = UIButton()
        leftBtn.setTitle("喜欢的商品", for: .normal)
        leftBtn.isSelected = true
        leftBtn.setTitleColor(UIColor.init(hexString: "424242"), for: .normal)
        leftBtn.layer.borderColor = UIColor.init(hexString: "e2e2e2").cgColor
        leftBtn.layer.borderWidth = 1
        leftBtn.layer.masksToBounds = true
        leftBtn.backgroundColor = UIColor.white
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        leftBtn.addTarget(self, action: #selector(msgBtnClick(_:)), for: .touchUpInside)
        leftBtn.tag = 1

        return leftBtn
    
    }()
    
    
    lazy var rightBtn:UIButton = {
    
        let rightBtn = UIButton()
        rightBtn.setTitleColor(UIColor.init(hexString: "424242"), for: .normal)
        rightBtn.setTitle("喜欢的专题", for: .normal)
        rightBtn.layer.borderColor = UIColor.init(hexString: "e2e2e2").cgColor
        rightBtn.layer.borderWidth = 1
        rightBtn.layer.masksToBounds = true
        rightBtn.backgroundColor = UIColor.white
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightBtn.addTarget(self, action: #selector(msgBtnClick(_:)), for: .touchUpInside)
        rightBtn.tag = 2
        
        return rightBtn
    
    }()
    
    /// 底部红色条
    lazy var indicatorView: UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.init(hexString: "f44649")
        return indicatorView
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        // 左边的按钮
        addSubview(leftBtn)
        // 右边的按钮
        addSubview(rightBtn)
        // 底部红色条
        addSubview(indicatorView)
        
        leftBtn.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(rightBtn)
        }
        
        rightBtn.snp.makeConstraints { (make) in
            make.left.equalTo(leftBtn.snp.right)
            make.top.right.bottom.equalTo(self)
        }
        
        indicatorView.snp.makeConstraints { (make) in
            make.height.equalTo(kIndicatorViewH)
            make.bottom.left.equalTo(self)
            make.right.equalTo(leftBtn)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func msgBtnClick(_ sender: UIButton) {
    
        switch sender.tag {
        case 1:
            
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: kAnimationDuration, animations: {
                self.indicatorView.x = 0
            })
            
            break
            
        case 2:
            
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: kAnimationDuration, animations: {
                self.indicatorView.x = KWidth/2
            })
            
            break
            

        default:
            break
        }
    
    }

}
