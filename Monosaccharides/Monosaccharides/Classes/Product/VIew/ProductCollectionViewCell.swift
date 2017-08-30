//
//  ProductCollectionViewCell.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/21.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit
import Kingfisher

protocol CollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCellDidClickedLikeButton(button: UIButton)
}

class ProductCollectionViewCell: UICollectionViewCell {

    weak var delegate: CollectionViewCellDelegate?
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    
    @IBAction func likeClick(_ sender: UIButton) {
        
        delegate?.collectionViewCellDidClickedLikeButton(button: sender)
        
    }
    
    var result: HomeSearchModel? {
        didSet {
            let url = result!.cover_image_url!
            icon.kf.setImage(with: URL(string: url)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                
            }
            likeBtn.setTitle(" " + String(result!.favorites_count!) + " ", for: .normal)
            title.text = result!.name
            price.text = "￥" + String(result!.price!)
        }
    }
    
    
    var product: ProductModel? {
        didSet {
            let url = product!.cover_image_url!
            icon.kf.setImage(with: URL(string: url)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                
            }
            likeBtn.setTitle(" " + String(product!.favorites_count!) + " ", for: .normal)
            title.text = product!.name
            price.text = "￥" + String(product!.price!)
        }
    }

}
