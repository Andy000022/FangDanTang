//
//  CategoryTableViewCell.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/23.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var topVIew: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var collect: UICollectionView!
    
    var group = NSMutableArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置collectionView的代理
        collect.delegate = self
        collect.dataSource = self
        collect.isScrollEnabled = false
        // 注册CollectionViewCell
        collect.register(UINib(nibName:"CategoryCollectionViewCell", bundle:nil),
                                      forCellWithReuseIdentifier: "Cell")
    }
    
    
}


extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return group.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.collection = group[indexPath.item] as? CategoryGroup
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 70, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake((KWidth - 70 * 4)/5 , (KWidth - 70 * 4)/5, (KWidth - 70 * 4)/5, (KWidth - 70 * 4)/5)
    }
    
    
}
