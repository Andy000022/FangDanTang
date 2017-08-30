//
//  ProductViewController.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {

    var products = [ProductModel]()
    fileprivate lazy var collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weak var weakSelf = self
        LMJNetworkTools.tools.loadProductData { (products) in
            weakSelf!.products = products
            weakSelf!.collectionView.reloadData()
        }
    
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: KWidth, height: KHeight), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.init(hexString: "eeeeee")
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)

    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        cell.layer.cornerRadius = kCornerRadius
        cell.layer.masksToBounds = true
        cell.product = products[indexPath.item]
        cell.delegate = self as? CollectionViewCellDelegate
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (KWidth - 20) / 2
        let height: CGFloat = 260
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
}
