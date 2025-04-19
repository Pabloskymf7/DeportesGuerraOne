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
    
    func goToCardioScreen(with exercise: [Exercise]) {
//        let detailViewController = RoutinesScreen().build(with: exercise)
//        viewController.navigationController?.pushViewController(detailViewController, animated: true)
        exercise.forEach { $0 }
        print(exercise)
    }
}
