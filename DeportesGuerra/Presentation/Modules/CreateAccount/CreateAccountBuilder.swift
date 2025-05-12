//
//  CreateAccountBuilder.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 12/5/25.
//

import UIKit

func build() -> CreateAccountViewController {
    let viewController = UIStoryboard(name: "CreateAccountViewController", bundle: nil).instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
    let router = LoginRouter(viewController: viewController)
    viewController.viewModel = LoginViewModel(router: router)
    return viewController
}
