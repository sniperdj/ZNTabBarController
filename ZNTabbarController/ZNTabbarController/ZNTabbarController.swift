//
//  ZNTabbarController.swift
//  ZNTabbarController
//
//  Created by Sniper on 17/2/1.
//  Copyright © 2017年 SniperStudy. All rights reserved.
//

import UIKit

class ZNTabbarController: UITabBarController, ZNTabbarDelegate {

    var tabbarItems = Array<UITabBarItem>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.setupTabbarController()
        self.setupTabbar()
        
        self.selectedIndex = 0
    }
    
    func setupTabbar() {
        // 把一个控件从父控件中remove掉,并不会马上销毁,而是在下一次运行循环的时候,判断这个对象有没有被强引用,如果没有,才会销毁.
        
        let tabbarFrame = self.tabBar.frame
        self.tabBar.removeFromSuperview()
        
        let tabbar = ZNTabBar()
        tabbar.delegate = self
        self.view.addSubview(tabbar)
        tabbar.frame = tabbarFrame
        tabbar.iTemArray = self.tabbarItems
        
    }
    
    func setupTabbarController() {
        let homeController = UIViewController() // 这里的UIViewController 应该是自定义的Controller
        let homeNavi = UINavigationController(rootViewController: homeController)
        homeNavi.view.backgroundColor = UIColor.orange
        homeNavi.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named: "home"), tag: 0)
        homeNavi.tabBarItem.selectedImage = UIImage.init(named: "home_selected")
        
        let secondController = UIViewController() // 这里的UIViewController 应该是自定义的Controller
        let secondNavi = UINavigationController(rootViewController: secondController)
        secondNavi.tabBarItem = UITabBarItem(title: "式神", image: UIImage(named:"sikigami"), tag: 1)
        secondNavi.view.backgroundColor = UIColor.blue
        secondNavi.tabBarItem.selectedImage = UIImage.init(named: "sikigami_selected")
        
        let thirdController = UIViewController() // 这里的UIViewController 应该是自定义的Controller
        let thirdNavi = UINavigationController(rootViewController: thirdController)
        thirdNavi.tabBarItem = UITabBarItem(title: "攻略", image: UIImage(named:"gonglue"), tag: 2)
        thirdNavi.view.backgroundColor = UIColor.green
        thirdNavi.tabBarItem.selectedImage = UIImage.init(named: "gonglue_selected")
        
        let settingController = UIViewController() // 这里的UIViewController 应该是自定义的Controller
        let settingNavi = UINavigationController(rootViewController: settingController)
        settingNavi.tabBarItem = UITabBarItem(title: "设置", image: UIImage(named:"setting"), tag: 3)
        settingNavi.view.backgroundColor = UIColor.cyan
        settingNavi.tabBarItem.selectedImage = UIImage.init(named: "setting_selected")
        
        self.viewControllers = [homeNavi, secondNavi, thirdNavi, settingNavi]
        
        self.tabbarItems.append(homeNavi.tabBarItem)
        self.tabbarItems.append(secondNavi.tabBarItem)
        self.tabbarItems.append(thirdNavi.tabBarItem)
        self.tabbarItems.append(settingNavi.tabBarItem)
        
    }
    
    func tabbarItemClicked(index: NSInteger) {
        self.selectedIndex = index
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
