//
//  MenuViewModel.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit

class MenuViewModel: MenuViewModelProtocol {
    var router: MenuRouterProtocol
    var sportUseCase: SportUseCaseProtocol
    var dataLoaded: (() -> Void)?
    var exercise = [Exercise]()

    init(router: MenuRouterProtocol, sportUseCase: SportUseCaseProtocol) {
        self.router = router
        self.sportUseCase = sportUseCase
    }

    func viewDidLoad() {
        //Hola
    }

    private func getAllExercises(with endpoint: String) {
        Task {
            do {
                exercise = try await sportUseCase.getExercises( with: endpoint)
                dataLoaded?()
            } catch {
                print("Error \(error)")
            }
        }
    }

    func goToCardioScreen() {
        getAllExercises(with: "?type=cardio")
        router.goToCardioScreen(with: exercise)
        dataLoaded = { [weak self] in
            guard let self = self else {return}
            self.router.goToCardioScreen(with: exercise)
        }
    }

}
