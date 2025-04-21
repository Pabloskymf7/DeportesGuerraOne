//
//  RoutinesBuilder.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import UIKit

class RoutinesBuilder {
    func build(with endpoint: String) -> RoutinesViewController {
        let viewController = UIStoryboard(name: "RoutinesViewController", bundle: nil).instantiateViewController(withIdentifier: "RoutinesViewController") as! RoutinesViewController
        let router = RoutinesRouter(viewController: viewController)
        let sportRemoteDataSource = SportDataSource()
        let sportRepository = SportRepository(sportDataSource: sportRemoteDataSource)
        let sportUseCase = SportUseCause(repositoy: sportRepository)
        viewController.viewModel = RoutinesViewModel(router: router, endpoint: endpoint, sportUseCase: sportUseCase)
        return viewController
    }
}
