//
//  ActionSheetConfig.swift
//  CWActionSheet
//
//  Created by chenwei on 2017/8/31.
//  Copyright © 2017年 cwwise. All rights reserved.
//


import UIKit

/// ActionSheetView配置
public class ActionSheetConfig {
    
    public static let `default` = ActionSheetConfig()
    // MARK: 属性
    /// 取消按钮title
    public var cancelButtonTitle: String?
    public var cancelButtonFont:UIFont
    /// 标题颜色 默认0x888888
    public var titleColor: UIColor
    /// 按钮文字颜色
    public var buttonColor: UIColor
    /// 标题字体 默认 `[UIFont systemFontOfSize:14.0f]`
    public var titleFont: UIFont
    /// 按钮字体 默认 `[UIFont systemFontOfSize:17.0f]`
    public var buttonFont: UIFont
    /// 标题行数 默认为0，即不限制
    public var titleLinesNumber: Int
    /// 标题Insets
    public var titleEdgeInsets: UIEdgeInsets
    /// 按钮高度
    public var buttonHeight: CGFloat
    /// 动画时间
    public var animationDuration: TimeInterval
    /// 分割线颜色
    public var separatorColor: UIColor
    /// 按钮高亮颜色
    public var buttonHighlightdColor: UIColor
    /// 是否可以滚动
    public var isScrollEnabled: Bool
    /// destructive按钮颜色
    public var destructiveButtonColor: UIColor
    /// 是否可以点击其他区域
    public var canTouchToDismiss: Bool
    
    public var backgroundViewColor: UIColor
    
    public var bigBgColor: UIColor
    
    public var divisionHeight: CGFloat
    
    public var showCellline: Bool
    
    public var divisionColor: UIColor
    
    public var divisionMargin: CGFloat
    
    public var popviewCorner: CGFloat
    
    public var cancelButtonTitleColor : UIColor
    
    private init() {
        
        titleColor = UIColor(hex6: 0x888888)
        buttonColor = UIColor.black
        titleFont = UIFont.systemFont(ofSize: 14)
        buttonFont = UIFont.systemFont(ofSize: 17)
        separatorColor = UIColor(hex6: 0xeaeaea)
        destructiveButtonColor = UIColor(hex6: 0xE44545)
        
        cancelButtonFont = UIFont.systemFont(ofSize: 14)
        
        buttonHeight = 50.0
        animationDuration = 0.3
        titleLinesNumber = 0
        titleEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        canTouchToDismiss = true
        buttonHighlightdColor = UIColor(hex6: 0xf7f7f7)
        
        backgroundViewColor = .white
        
        bigBgColor = UIColor(hex6: 0x808080)
        
        isScrollEnabled = false
        
        divisionHeight = 5.0
        
        showCellline = true
        
        divisionColor =  UIColor(hex6: 0xf8f8f8)
        
        divisionMargin = 0
        
        popviewCorner = 12.0
        
        cancelButtonTitleColor = UIColor(hex6: 0x666666)
    }
    
    public func reset(){
        titleColor = UIColor(hex6: 0x888888)
        buttonColor = UIColor.black
        titleFont = UIFont.systemFont(ofSize: 14)
        buttonFont = UIFont.systemFont(ofSize: 17)
        separatorColor = UIColor(hex6: 0xeaeaea)
        destructiveButtonColor = UIColor(hex6: 0xE44545)
        
        
        buttonHeight = 50.0
        animationDuration = 0.3
        titleLinesNumber = 0
        titleEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        canTouchToDismiss = true
        buttonHighlightdColor = UIColor(hex6: 0xf7f7f7)
        
        backgroundViewColor = .white
        
        bigBgColor = UIColor(hex6: 0x808080)
        
        isScrollEnabled = false
        
        divisionHeight = 5.0
        
        showCellline = true
        
        divisionColor =  UIColor(hex6: 0xf8f8f8)
        
        divisionMargin = 0
        
        popviewCorner = 12.0
        
        cancelButtonTitleColor = UIColor(hex6: 0x666666)

    }
}
