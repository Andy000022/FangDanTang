//
//  LMJNetworkTools.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class LMJNetworkTools: NSObject {

    /// 创建单例
    static let tools = LMJNetworkTools()
    
    /// 获取首页数据
    func loadHomeTopicInfo(id: Int, finished:@escaping (_ topicInfo: [TopicInfoModel]) -> ()) {
        
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender": 1, "generation": 1,"limit": 20, "offset": 0]
        
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                let data = dict["data"].dictionary
                //  字典转成模型
                if let items = data!["items"]?.arrayObject {
                    var topicInfo = [TopicInfoModel]()
                    for item in items {
                        let topic = TopicInfoModel(dict: item as! [String: AnyObject])
                        topicInfo.append(topic)
                    }
                    finished(topicInfo)
                }
            }
        }
        
    }
    
    /// 获取首页顶部选择数据
    func loadHomeTopData(finished:@escaping (_ homeChannels: [HomeChannelModel]) -> ()) {
        
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                let data = dict["data"].dictionary
                if let channels = data!["channels"]?.arrayObject {
                    var homeChannels = [HomeChannelModel]()
                    for channel in channels {
                        let homeChannel = HomeChannelModel(dict: channel as! [String: AnyObject])
                        homeChannels.append(homeChannel)
                    }
                    finished(homeChannels)
                }
            }
        }
    }
    
    /// 搜索界面数据
    func loadHotWords(finished:@escaping (_ words: [String]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/search/hot_words"
        Alamofire
            .request(url)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let hot_words = data["hot_words"]?.arrayObject {
                        finished(hot_words as! [String])
                    }
                }
            }
        }
    }

    /// 根据搜索条件进行搜索
    func loadSearchResult(keyword: String, sort: String, finished:@escaping (_ results: [HomeSearchModel]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = "http://api.dantangapp.com/v1/search/item"
        
        let params = ["keyword": keyword,
                      "limit": 20,
                      "offset": 0,
                      "sort": sort] as [String : Any]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                let data = dict["data"].dictionary
                if let items = data!["items"]?.arrayObject {
                    var results = [HomeSearchModel]()
                    for item in items {
                        let result = HomeSearchModel(dict: item as! [String: AnyObject])
                        results.append(result)
                    }
                    finished(results)
                }
            }
        }
    }

    /// 获取单品数据
    func loadProductData(finished:@escaping (_ products: [ProductModel]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v2/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let items = data["items"]?.arrayObject {
                        var products = [ProductModel]()
                        for item in items {
                            let itemDict = item as! [String : AnyObject]
                            if let itemData = itemDict["data"] {
                                let product = ProductModel(dict: itemData as! [String: AnyObject])
                                products.append(product)
                            }
                        }
                        finished(products)
                    }
                }
            }
        }
    }

    /// 获取单品详情数据
    func loadProductDetailData(id: Int, finished:@escaping (_ productDetail: ProductDetail) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v2/items/\(id)"
        Alamofire
            .request(url)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionaryObject {
                    let productDetail = ProductDetail(dict: data as [String : AnyObject])
                    finished(productDetail)
                }
            }
        }
    }

    /// 商品详情 评论
    func loadProductDetailComments(id: Int, finished:@escaping (_ comments: [ProductComment]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v2/items/\(id)/comments"
        let params = ["limit": 20,
                      "offset": 0]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let commentsData = data["comments"]?.arrayObject {
                        var comments = [ProductComment]()
                        for item in commentsData {
                            let comment = ProductComment(dict: item as! [String: AnyObject])
                            comments.append(comment)
                        }
                        finished(comments)
                    }
                }
            }
        }
    }

    /// 分类界面 顶部 专题合集
    func loadCategoryCollection(limit: Int, finished:@escaping (_ collections: [CategoryModel]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/collections"
        let params = ["limit": limit,
                      "offset": 0]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let collectionsData = data["collections"]?.arrayObject {
                        var collections = [CategoryModel]()
                        for item in collectionsData {
                            let collection = CategoryModel(dict: item as! [String: AnyObject])
                            collections.append(collection)
                        }
                        finished(collections)
                    }
                }
            }
        }
    }

    /// 顶部 专题合集 -> 专题列表
    func loadCollectionPosts(id: Int, finished:@escaping (_ posts: [CategoryPostModel]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/collections/\(id)/posts"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.show(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.show(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let postsData = data["posts"]?.arrayObject {
                        var posts = [CategoryPostModel]()
                        for item in postsData {
                            let post = CategoryPostModel(dict: item as! [String: AnyObject])
                            posts.append(post)
                        }
                        finished(posts)
                    }
                }
            }
        }
    }

    /// 分类界面 风格,品类
    func loadCategoryGroup(finished:@escaping (_ outGroups: [AnyObject]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/channel_groups/all"
        Alamofire
            .request(url)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.show(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.show(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let channel_groups = data["channel_groups"]?.arrayObject {
                        // outGroups 存储两个 inGroups 数组，inGroups 存储 YMGroup 对象
                        // outGroups 是一个二维数组
                        var outGroups = [AnyObject]()
                        for channel_group in channel_groups {
                            var inGroups = [CategoryGroup]()
                            let channel_group_dict = channel_group as! [String: AnyObject]
                            let channels = channel_group_dict["channels"] as! [AnyObject]
                            for channel in channels {
                                let group = CategoryGroup(dict: channel as! [String: AnyObject])
                                inGroups.append(group)
                            }
                            outGroups.append(inGroups as AnyObject)
                        }
                        finished(outGroups)
                    }
                }
            }
        }
    }

    /// 底部 风格品类 -> 列表
    func loadStylesOrCategoryInfo(id: Int, finished:@escaping (_ items: [CategoryPostModel]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["limit": 20,
                      "offset": 0]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.show(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.show(withStatus: message)
                    return
                }
                
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let itemsData = data["items"]?.arrayObject {
                        var items = [CategoryPostModel]()
                        for item in itemsData {
                            let post = CategoryPostModel(dict: item as! [String: AnyObject])
                            items.append(post)
                        }
                        
                        finished(items)
                        
                    }
                    
                }
                
            }
                
        }
        
    }

    
}




