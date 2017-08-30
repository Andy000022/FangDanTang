//
//  CategoryCollectionViewCell.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/23.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var titleL: UILabel!
    

    var collection : CategoryGroup? {
    
        didSet {
            
            let url = collection?.icon_url
            icon.kf.setImage(with: URL(string: url!), placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
            }

            titleL.text = collection?.name
            
        }
    
    }
    

}
