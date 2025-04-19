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
        getAllExercises()
    }

    private func getAllExercises() {
//        Task {
//            do {
//                exercise = try await sportUseCase.getExercises()
//                dataLoaded?()
//            } catch {
//                print("Error \(error)")
//            }
//        }
    }

    func goToProfile(with index: Int) {
        router.goToProfile(with: exercise[index])
    }

}
