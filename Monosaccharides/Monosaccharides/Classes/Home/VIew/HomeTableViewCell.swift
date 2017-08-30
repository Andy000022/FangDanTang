//
//  HomeTableViewCell.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit
import Kingfisher

protocol HomeCellDelegate: NSObjectProtocol {
    func homeCellDidClickedFavoriteButton(button: UIButton)
}

class HomeTableViewCell: UITableViewCell {

    weak var delegate: HomeCellDelegate?
    
    @IBOutlet weak var icon: UIImageView!
   
    
    @IBOutlet weak var likeBnt: UIButton!
    
    
    @IBOutlet weak var title: UILabel!
    
    var topicInfos: TopicInfoModel? {
    
        didSet{
        
            let url = topicInfos!.cover_image_url
            icon.kf.setImage(with: URL(string: url!)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                
            }
            title.text = topicInfos!.title
            likeBnt.setTitle(" " + String(topicInfos!.likes_count!) + " ", for: .normal)
        
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeBnt.layer.cornerRadius = 25 * 0.5
        likeBnt.layer.masksToBounds = true
        likeBnt.layer.rasterizationScale = UIScreen.main.scale
        likeBnt.layer.shouldRasterize = true
        icon.layer.cornerRadius = kCornerRadius
        icon.layer.masksToBounds = true
        icon.layer.shouldRasterize = true
        icon.layer.rasterizationScale = UIScreen.main.scale
    }
    
    /// 点击了喜欢按钮
    @IBAction func favoriteButtonClick(sender: UIButton) {
        delegate?.homeCellDidClickedFavoriteButton(button: sender)
    }

    
}
