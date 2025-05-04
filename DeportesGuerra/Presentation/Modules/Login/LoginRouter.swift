//
//  LoginRouter.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    let viewController: LoginViewController
   
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    func goToHomeScreen() {
    }
}
