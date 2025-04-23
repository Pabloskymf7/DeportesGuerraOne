//
//  ProfileRouter.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import Foundation

class ProfileRouter: ProfileRouterProtocol{
    var viewController: ProfileViewController
    
    init(viewController: ProfileViewController) {
        self.viewController = viewController
    }
}
