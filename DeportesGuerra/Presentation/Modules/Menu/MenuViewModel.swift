//
//  MenuViewModel.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit
enum ExercisesEndpoints: String {
    case cardio = "?type=cardio"
    case olympic = "?type=olympic_weightlifting"
    case plyometrics = "?type=plyometrics"
    case powerlifting = "?type=powerlifting"
    case strength = "?type=strength"
    case strongman = "?type=strongman"
}

class MenuViewModel: MenuViewModelProtocol {
    var router: MenuRouterProtocol
    var sportUseCase: SportUseCaseProtocol

    init(router: MenuRouterProtocol, sportUseCase: SportUseCaseProtocol) {
        self.router = router
        self.sportUseCase = sportUseCase
    }
}

extension MenuViewModel : HomeDelegateProtocol {
    func goToDetailsScreen(with endpoint: String) {
        router.goToRoutinesScreen(with: endpoint)
    }
}
