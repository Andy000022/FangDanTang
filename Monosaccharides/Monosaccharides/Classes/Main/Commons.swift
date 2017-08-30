//
//  Commons.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

enum TopicType: Int {
    /// 精选
    case Selection = 4
    /// 美食
    case Food = 14
    /// 家居
    case Household = 16
    /// 数码
    case Digital = 17
    /// 美物
    case GoodThing = 13
    /// 杂货
    case Grocery = 22
}

enum ShareButtonType: Int {
    /// 微信朋友圈
    case WeChatTimeline = 0
    /// 微信好友
    case WeChatSession = 1
    /// 微博
    case Weibo = 2
    /// QQ 空间
    case QZone = 3
    /// QQ 好友
    case QQFriends = 4
    /// 复制链接
    case CopyLink = 5
}

enum OtherLoginButtonType: Int {
    /// 微博
    case weiboLogin = 100
    /// 微信
    case weChatLogin = 101
    /// QQ
    case QQLogin = 102
}

/// 服务器地址
let BASE_URL = "http://api.dantangapp.com/"

/// 第一次启动
let FirstLaunch = "firstLaunch"
/// 是否登录
let isLogin = "isLogin"

/// code 码 200 操作成功
let RETURN_OK = 200
/// 间距
let kMargin: CGFloat = 10.0
/// 圆角
let kCornerRadius: CGFloat = 5.0
/// 线宽
let klineWidth: CGFloat = 1.0
/// 首页顶部标签指示条的高度
let kIndicatorViewH: CGFloat = 2.0
/// 新特性界面图片数量
let kNewFeatureCount = 4
/// 顶部标题的高度
let kTitlesViewH: CGFloat = 35
/// 顶部标题的y
let kTitlesViewY: CGFloat = 64
/// 动画时长
let kAnimationDuration = 0.25
/// 屏幕的宽
let KWidth = UIScreen.main.bounds.size.width
/// 屏幕的高
let KHeight = UIScreen.main.bounds.size.height
/// 分类界面 顶部 item 的高
let kitemH: CGFloat = 100
/// 分类界面 顶部 item 的宽
let kitemW: CGFloat = 150
/// 我的界面头部图像的高度
let kMineHeaderImageHeight: CGFloat = 200
// 分享按钮背景高度
let kTopViewH: CGFloat = 230

// 首页自定义标签高度
let tagsH:CGFloat = 35

// 自定义标签宽度
let tagsW = KWidth / 6

// 底部横线高度
let bottomLineH: CGFloat = 2

/// RGBA的颜色设置
func CColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

/// 背景灰色
func GlobalColor() -> UIColor {
    return CColor(r: 240, g: 240, b: 240, a: 1)
}

/// 白色
func GlobalBarColor() -> UIColor {
    return UIColor.init(hexString: "f75353")
}

/// iPhone 5
let isIPhone5 = KHeight == 568 ? true : false
/// iPhone 6
let isIPhone6 = KHeight == 667 ? true : false
/// iPhone 6P
let isIPhone6P = KHeight == 736 ? true : false





