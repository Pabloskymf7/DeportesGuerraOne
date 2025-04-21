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

    func goToCardioScreen() {
        router.goToRoutinesScreen(with: ExercisesEndpoints.cardio.rawValue)
    }
    
    func goToOlympicScreen() {
        router.goToRoutinesScreen(with: ExercisesEndpoints.olympic.rawValue)
    }
    
    func goToPliometricsScreen() {
        router.goToRoutinesScreen(with: ExercisesEndpoints.plyometrics.rawValue)
    }
    
    func goToPowerliftingScreen() {
        router.goToRoutinesScreen(with: ExercisesEndpoints.powerlifting.rawValue)
    }
    
    func goToStrengthScreen() {
        router.goToRoutinesScreen(with: ExercisesEndpoints.strength.rawValue)
    }
    
    func goToStrongmanScreen() {
        router.goToRoutinesScreen(with: ExercisesEndpoints.strongman.rawValue)
    }
}
