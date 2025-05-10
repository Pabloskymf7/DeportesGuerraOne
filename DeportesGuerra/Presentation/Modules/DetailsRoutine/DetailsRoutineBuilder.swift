//
//  DetailsRoutineBuilder.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 26/4/25.
//

import UIKit

class DetailsRoutineBuilder {
    static func build(with exercise: Exercise) -> DetailsRoutineViewController {
        let viewController = UIStoryboard(name: "DetailsRoutineViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailsRoutineViewController") as! DetailsRoutineViewController
        let router = DetailsRoutineRouter(viewController: viewController)
        let sportDataSource = SportDataSource()
        let sportRepository = SportRepository(sportDataSource: sportDataSource)
        let sportUseCase = SportUseCause(repositoy: sportRepository)
        viewController.viewModel = DetailsRoutineViewModel(router: router, sportUseCase: sportUseCase, exercise: exercise)
        return viewController
    }
}
