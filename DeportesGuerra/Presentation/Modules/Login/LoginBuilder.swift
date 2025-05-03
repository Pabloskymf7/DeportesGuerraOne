//
//  LoginBuilder.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import UIKit

class LoginBuilder {
    func build() -> LoginViewController {
        let viewController = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let router = LoginRouter(viewController: viewController)
        viewController.viewModel = LoginViewModel(router: router)
        return viewController
    }
}
