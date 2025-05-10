//
//  DetailsRoutineRouter.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 26/4/25.
//

import Foundation

class DetailsRoutineRouter: DetailsRoutineRouterProtocol {
    var viewController: DetailsRoutineViewController
    
    init(viewController: DetailsRoutineViewController) {
        self.viewController = viewController
    }
}

