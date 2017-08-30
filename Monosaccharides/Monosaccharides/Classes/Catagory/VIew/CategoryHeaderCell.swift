//
//  CategoryHeaderCell.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/23.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class CategoryHeaderCell: UITableViewCell {

    @IBOutlet weak var headerV: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var all: UIButton!
    
    @IBOutlet weak var collectionV: UICollectionView!
    
    var collections:NSMutableArray!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置collectionView的代理
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.isScrollEnabled = true
        collectionV.showsHorizontalScrollIndicator = false
        collectionV.bounces = true
        // 注册CollectionViewCell
        collectionV.register(UINib.init(nibName: "CategoryHeaderBannerCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
    }

}

extension CategoryHeaderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\n\n\(collections)\n\n")
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryHeaderBannerCell
        
        cell.connection =  collections[indexPath.item] as? CategoryModel
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
}
