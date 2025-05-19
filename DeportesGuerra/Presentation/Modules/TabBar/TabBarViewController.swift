//
//  TabBarViewController.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 23/4/25.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarView()
    }

    static func build() -> TabBarViewController {
        return TabBarViewController()
    }

    func configureTabBarView() {
        let menuViewController = MenuBuilder().build()
        let profileViewController = ProfileBuilder().build()

        let viewControllersList = [menuViewController, profileViewController] 
        self.setViewControllers(viewControllersList, animated: true)
        
        let topBorder = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1))
        topBorder.backgroundColor = UIColor.lightGray
        tabBar.addSubview(topBorder)
        guard let items = self.tabBar.items else {return}
        items[0].title = "Menu"
        items[0].image = UIImage(systemName: "house")
        items[1].title = "Profile"
        items[1].image = UIImage(systemName: "person")
    }
}
