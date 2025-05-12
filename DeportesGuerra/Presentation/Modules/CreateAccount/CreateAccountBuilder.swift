//
//  CreateAccountBuilder.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 12/5/25.
//

import UIKit

class CreateAccountBuilder {
    func build() -> CreateAccountViewController {
        let viewController = UIStoryboard(name: "CreateAccountViewController", bundle: nil).instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
        let router = CreateAccountRouter(viewController: viewController)
        viewController.viewModel = CreateAccountViewModel(router: router)
        return viewController
    }
}
