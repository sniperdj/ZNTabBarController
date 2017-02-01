//
//  ZNTabBar.swift
//  ZNTabbarController
//
//  Created by Sniper on 17/2/1.
//  Copyright © 2017年 SniperStudy. All rights reserved.
//

import UIKit

protocol ZNTabbarDelegate  {
    func tabbarItemClicked(index : NSInteger);
}

class ZNTabBar: UIView {

    var iTemArray : Array<UITabBarItem> {
        didSet {
            self.setupButton()
        }
    }
    
    // 选中的按钮
    var selectedBtn : ZNTabBarButton?
    
    // 代理
    var delegate : ZNTabbarDelegate?
    
    override init(frame: CGRect) {
        iTemArray = Array<UITabBarItem>()
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        
        var i = 0
        while i < iTemArray.count {
            let button = ZNTabBarButton(type: .custom)
            let tabbarItem : UITabBarItem = iTemArray[i]
            self.addSubview(button)
            let img = tabbarItem.image
            if i == 0 {
                self.selectedBtn = button
                button.isSelected = true
            }
            button.tag = 20000 + i
            button.setImage(img, for: .normal)
            button.setTitle(tabbarItem.title, for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setImage(tabbarItem.selectedImage, for: .selected)
            button.addTarget(self, action:#selector(tabbarBtnClick(btn:)), for: .touchUpInside)
            //            button.addTarget(self, action:#selector(tabbarItem), for: .touchUpInside)
            i = i + 1
        }
    }
    
    func tabbarBtnClick(btn: ZNTabBarButton) {
        self.selectedBtn?.isSelected = false
        btn.isSelected = true
        self.selectedBtn = btn
        
        if ((self.delegate) != nil) {
            self.delegate?.tabbarItemClicked(index: btn.tag - 20000)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var x : CGFloat = 0
        let y : CGFloat = 0
        let w : CGFloat = CGFloat(UIScreen.main.bounds.size.width) / CGFloat(iTemArray.count)
        let h : CGFloat = self.bounds.size.height
        
        var i : Int = 0
        while i < iTemArray.count {
            let button : UIButton = self.subviews[i] as! UIButton
            button.frame = CGRect(x: x, y: y, width: w, height: h)
            x = x + w
            i = i + 1
            print("button frame : %@", button.frame)
        }
        
    }

}
