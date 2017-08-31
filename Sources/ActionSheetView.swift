//
//  ActionSheetView.swift
//  CWActionSheetDemo
//
//  Created by chenwei on 2017/8/31.
//  Copyright © 2017年 cwwise. All rights reserved.
//

import UIKit

private let kScreenHeight = UIScreen.main.bounds.height
private let kScreenWidth = UIScreen.main.bounds.width

public typealias ActionSheetClickedHandler = ((ActionSheetView, Int) -> Void)
public typealias ActionSheetShowHandler = ((ActionSheetView) -> Void)

public class ActionSheetView: UIView {

    // MARK: 属性
    /// 
    var title: String?
    ///
    var cancelButtonTitle: String?
    
    var titleColor: UIColor
    
    var buttonColor: UIColor
    
    var titleFont: UIFont
    
    var buttonFont: UIFont
    
    var titleLinesNumber: Int
    
    var titleEdgeInsets: UIEdgeInsets
    
    var buttonHeight: CGFloat
    /// 动画时间
    var animationDuration: TimeInterval
    
    var separatorColor: UIColor
    // #E44545
    var destructiveButtonColor: UIColor
    
    var destructiveButtonIndex: Int?
        
    var otherButtonTitles: [String] = []
    // 点击事件
    public var clickedHandler: ActionSheetClickedHandler?
    
    public var didPresentHandler: ActionSheetShowHandler?
    
    public var willPresentHandler: ActionSheetShowHandler?
    
    public var willDismissHandler: ActionSheetShowHandler?
    
    public var didDismissHandler: ActionSheetShowHandler?
    
    fileprivate var tableView: UITableView!
    
    var titleLabel: UILabel!
    
    var containerView: UIView!
    // 背景
    var backgroundView: UIView!
    
    var divisionLayer: CALayer!
    
    var cancelButton: UIButton!

    convenience init() {
        let frame = UIScreen.main.bounds
        self.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        
        titleColor = UIColor(hex6: 0x888888)
        buttonColor = UIColor.black
        titleFont = UIFont.systemFont(ofSize: 14)
        buttonFont = UIFont.systemFont(ofSize: 17)
        separatorColor = UIColor(hex6: 0xd9d9d9)
        destructiveButtonColor = UIColor(hex6: 0xE44545)
        
        buttonHeight = 49.0
        animationDuration = 0.3
        titleLinesNumber = 0
        titleEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        super.init(frame: frame)
        
        let tintColor = UIColor(hex6: 0xf7f7f7)
        self.tintColor = tintColor
        setupUI()
    }
    
    public convenience init(title: String? = nil, 
                            cancelButtonTitle: String? = nil,
                            otherButtonTitles: [String] = [],
                            clickedHandler: ActionSheetClickedHandler? = nil) {
        self.init()
        self.title = title
        self.otherButtonTitles = otherButtonTitles
        self.cancelButtonTitle = cancelButtonTitle
        self.clickedHandler = clickedHandler
    }

    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundView = UIView(frame: self.bounds)
        backgroundView.backgroundColor = UIColor(hex6: 0x808080)
        backgroundView.alpha = 0
        self.addSubview(backgroundView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundViewClicked))
        backgroundView.addGestureRecognizer(tapGesture)
        
        containerView = UIView()
        containerView.backgroundColor = UIColor.white
        self.addSubview(containerView)
        
        titleLabel = UILabel()
        titleLabel.font = titleFont
        titleLabel.textColor = titleColor
        titleLabel.textAlignment = .center
        containerView.addSubview(titleLabel)

        tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.rowHeight = buttonHeight
        tableView.isScrollEnabled = false
        tableView.register(ActionSheetCell.self, forCellReuseIdentifier: "cell")
        containerView.addSubview(tableView)
        // 分割
        divisionLayer = CALayer()
        divisionLayer.backgroundColor = UIColor(hex6: 0xECECED).cgColor
        containerView.layer.addSublayer(divisionLayer)
        
        // 
        cancelButton = UIButton(type: .custom)
        cancelButton.titleLabel?.font = buttonFont
        cancelButton.setTitleColor(buttonColor, for: .normal)
        cancelButton.setBackgroundImage(UIImage(color: self.tintColor), for: .highlighted)
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        containerView.addSubview(cancelButton)
    }
    
    func setupView() {
        
        // 依次计算
        titleLabel.numberOfLines = titleLinesNumber
        titleLabel.text = title
        
        let titleWidth = kScreenWidth - titleEdgeInsets.left - titleEdgeInsets.right
        let size = CGSize(width: titleWidth,
                          height: CGFloat.greatestFiniteMagnitude)
        var titleSize = titleLabel.sizeThatFits(size)
        titleSize = CGSize(width: titleWidth, height: ceil(titleSize.height)+1)
        
        titleLabel.frame = CGRect(x: titleEdgeInsets.left, y: titleEdgeInsets.top, 
                                  width: titleSize.width, height: titleSize.height)
        
        // layout tableView
        let tableViewHeight = CGFloat(otherButtonTitles.count) * buttonHeight
        tableView.frame = CGRect(x: 0, y: titleLabel.frame.maxY+titleEdgeInsets.bottom,
                                 width: kScreenWidth, height: tableViewHeight)
        
        // 
        let divisionViewHeight: CGFloat = (cancelButtonTitle != nil) ? 5.0 : 0.0
        divisionLayer.frame = CGRect(x: 0, y: tableView.frame.maxY,
                                     width: kScreenWidth, height: divisionViewHeight)
        
        cancelButton.setTitle(cancelButtonTitle, for: .normal)
        cancelButton.frame = CGRect(x: 0, y: divisionLayer.frame.maxY, 
                                    width: kScreenWidth, height: buttonHeight)
        
        containerView.frame = CGRect(x: 0, y: kScreenHeight - cancelButton.frame.maxY,
                                     width: kScreenWidth, height: cancelButton.frame.maxY)
    }
    
    
    // MARK: 
    func append(_ buttonTitle: String, at index: Int = -1) {
       
        // 默认值 添加到最后面
        if index == -1 {
            
        } else {
            
            
            
        }
        
    }
    
    func append(buttonTitles: [String], at index: Int) {
        setupView()
        tableView.reloadData()
    }
    
    func backgroundViewClicked() {
        cancelButtonClicked()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension ActionSheetView: UITableViewDelegate, UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return otherButtonTitles.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActionSheetCell
        cell.titleLabel.font = buttonFont
        cell.lineLayer.backgroundColor = separatorColor.cgColor
        cell.titleLabel.text = otherButtonTitles[indexPath.row]
        cell.selectedBackgroundView?.backgroundColor = self.tintColor  

        if indexPath.row == destructiveButtonIndex {
            cell.titleLabel.textColor = destructiveButtonColor
        } else {
            cell.titleLabel.textColor = buttonColor
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.clickedHandler?(self, indexPath.row)
        cancelButtonClicked()
    }
    
}

extension ActionSheetView {
    
    public func show() {
        // 添加到window上
        let keyWindow = UIApplication.shared.keyWindow!
        keyWindow.addSubview(self)
        
        setupView()
        containerView.frame = containerView.frame.offsetBy(dx: 0, dy: containerView.frame.height)
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseOut, animations: { 
            
            let frame = self.containerView.frame
            self.containerView.frame = frame.offsetBy(dx: 0, dy: -frame.height)
            self.backgroundView.alpha = 0.3
            
        }, completion: {(finished) in 
            
        })
    }
    
    func cancelButtonClicked() {
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseOut, animations: { 
            
            let frame = self.containerView.frame
            self.containerView.frame = frame.offsetBy(dx: 0, dy: frame.height)
            self.backgroundView.alpha = 0.0
            
        }, completion: {(finished) in 
            
            self.removeFromSuperview()
            
        })
    }
}


extension UIColor {
     convenience init(hex6: UInt32, alpha: Float = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >> 8) / divisor
        let blue    = CGFloat((hex6 & 0x0000FF) >> 0) / divisor
        self.init(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
}

extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 10, height: 10)) {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        self.init(cgImage:(UIGraphicsGetImageFromCurrentImageContext()?.cgImage!)!)
        UIGraphicsEndImageContext()
    }

}