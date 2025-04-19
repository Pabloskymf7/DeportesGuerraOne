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
    var exercise = [Exercise]()
    private var isLoading = false

    init(router: MenuRouterProtocol, sportUseCase: SportUseCaseProtocol) {
        self.router = router
        self.sportUseCase = sportUseCase
    }

    private func getAllExercises(with endpoint: String/*, completion: @escaping () -> Void*/) {
//        guard !isLoading else { return }
//        isLoading = true
        Task {
            do {
                exercise = try await sportUseCase.getExercises( with: endpoint)
            } catch {
                print("Error \(error)")
            }
//            isLoading = false
//            completion()
        }
    }

    func goToCardioScreen() {
        getAllExercises(with: ExercisesEndpoints.cardio.rawValue) 
        router.goToCardioScreen(with: exercise)
//            // Solo navegar cuando los datos estén listos
//            self.router.goToCardioScreen(with: self.exercise)
//        }    
    }
}
