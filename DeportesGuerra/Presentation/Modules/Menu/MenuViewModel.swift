//
//  MenuViewModel.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit
enum ExercisesEndpoints: String {
    case cardio = "?muscle=biceps"
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

    func goToCardioScreen() {
        router.goToCardioScreen(with: ExercisesEndpoints.cardio.rawValue)
    }
}
