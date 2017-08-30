//
//  CategoryHeaderBannerCell.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/28.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class CategoryHeaderBannerCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var banner: UIImageView!
    
    var connection : CategoryModel? {
    
        didSet{
        
            let url = connection?.banner_image_url
            banner.kf.setImage(with: URL(string: url!), placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                
            }

            
        }
    
    }
    

}
