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
    
    func goToRoutinesScreen(with endpoint: String) {
        let detailViewController = RoutinesBuilder().build(with: endpoint)
        viewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
