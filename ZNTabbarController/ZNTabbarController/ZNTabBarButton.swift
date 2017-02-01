//
//  ZNTabBarButton.swift
//  ZNTabbarController
//
//  Created by Sniper on 17/2/1.
//  Copyright © 2017年 SniperStudy. All rights reserved.
//

import UIKit

class ZNTabBarButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        //设置文字偏移：向下偏移图片高度＋向左偏移图片宽度 （偏移量是根据［图片］大小来的，这点是关键）<br>
        self.titleEdgeInsets = UIEdgeInsets(top: self.imageView!.frame.size.height, left: -self.imageView!.frame.size.width, bottom: 0, right: 0)
        
        //设置图片偏移：向上偏移文字高度＋向右偏移文字宽度 （偏移量是根据［文字］大小来的，这点是关键）
        self.imageEdgeInsets = UIEdgeInsets(top: -self.titleLabel!.bounds.size.height, left: 0, bottom: 0, right: -self.titleLabel!.bounds.size.width)
        
    }
}
