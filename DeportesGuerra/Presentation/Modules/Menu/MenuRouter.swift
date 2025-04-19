//
//  MenuRouter.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit

class MenuRouter: MenuRouterProtocol {
    var viewController: MenuViewController
    
    init(viewController: MenuViewController) {
        self.viewController = viewController
    }
    
    func goToProfile(with exercise: Exercise) {
//        let detailViewController = ProfileBuilder().build(with: exercise)
//        viewController.navigationController?.pushViewController(detailViewController, animated: true)
        print("Hola")
    }
}
