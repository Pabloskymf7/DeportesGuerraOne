//
//  MenuBuilder.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit
class MenuBuilder {
    func build() -> MenuViewController {
        let viewController = UIStoryboard(name: "MenuViewController", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let router = MenuRouter(viewController: viewController)
        let sportDataSource = SportDataSource()
        let sportRepository = SportRepository(sportDataSource: sportDataSource)
        let sportUseCase = SportUseCause(repositoy: sportRepository)
        viewController.viewModel = MenuViewModel(router: router, sportUseCase: sportUseCase)
        return viewController
    }
}

