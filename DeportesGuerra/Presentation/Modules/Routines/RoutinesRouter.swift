//
//  RoutinesRouter.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import UIKit

class RoutinesRouter: RoutinesRouterProtocol {
    var viewController: RoutinesViewController
    
    init(viewController: RoutinesViewController) {
        self.viewController = viewController
    }
}
