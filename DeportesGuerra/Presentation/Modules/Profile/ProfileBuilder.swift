//
//  ProfileBuilder.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import UIKit

class ProfileBuilder {
    func build() -> ProfileViewController {
        let viewController = UIStoryboard(name: "ProfileViewController", bundle: nil).instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        let router = ProfileRouter(viewController: viewController)
        let sportDataSource = SportDataSource()
        let sportRepository = SportRepository(sportDataSource: sportDataSource)
        let sportUseCase = SportUseCause(repositoy: sportRepository)
        viewController.viewModel = ProfileViewModel(router: router, sportUseCase: sportUseCase)
        return viewController
    }
}
