//
//  MenuRouter.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit

class MenuRouter: MenuRouterProtocol {
    //MARK: - Properties
    var viewController: MenuViewController
    
    //MARK: - Init
    init(viewController: MenuViewController) {
        self.viewController = viewController
    }
    
    //MARK: - Functions
    func goToRoutinesScreen(with endpoint: String) {
        let detailViewController = RoutinesBuilder().build(with: endpoint)
        viewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
