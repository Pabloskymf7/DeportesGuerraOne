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

    func build() -> TabBarViewController {
        self
    }

    func configureTabBarView() {
        let menuViewController = MenuBuilder().build()
        let profileViewController = ProfileBuilder().build()

        let viewControllersList = [menuViewController, profileViewController] 
        self.setViewControllers(viewControllersList, animated: true)

        guard let items = self.tabBar.items else {return}
        items[0].title = "Menu"
        items[0].image = UIImage(systemName: "house")
        items[1].title = "Profile"
        items[1].image = UIImage(systemName: "person")
    }
}
