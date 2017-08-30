//
//  DetailViewController.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/21.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetailViewController: BaseViewController, UIWebViewDelegate {

    
    var info : TopicInfoModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView()
        webView.frame = view.bounds
        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        let url = URL(string: info!.content_url!)
        let request = URLRequest(url: url! as URL)
        webView.loadRequest(request)
        webView.delegate = self
        view.addSubview(webView)

    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }

}
