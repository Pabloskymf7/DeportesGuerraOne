//
//  CreateAccountRouter.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 12/5/25.
//

import Foundation

class CreateAccountRouter: CreateAccountRouterProtocol {
    let viewController: LoginViewController
   
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    func goToHomeScreen() {
    }
}
