//
//  RoutinesViewModel.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import UIKit

class RoutinesViewModel: RoutinesViewModelProtocol {
    var router: RoutinesRouterProtocol
    var exercise = [Exercise]()
    var endpoint: String
    var sportUseCase: SportUseCaseProtocol
    var dataLoaded: (() -> Void)?
    
    init(router: RoutinesRouterProtocol, endpoint: String, sportUseCase: SportUseCaseProtocol) {
        self.router = router
        self.endpoint = endpoint
        self.sportUseCase = sportUseCase
    }
    
    func viewDidLoad() {
        getAllExercises(with: endpoint)
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
}
