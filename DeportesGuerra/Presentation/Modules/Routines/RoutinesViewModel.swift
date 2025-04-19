//
//  RoutinesViewModel.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import UIKit

class RoutinesViewModel: RoutinesViewModelProtocol {
    var router: RoutinesRouterProtocol
    var exercise: [Exercise]
    var sportUseCase: SportUseCaseProtocol
    var dataLoaded: (() -> Void)?
    
    init(router: RoutinesRouterProtocol, exercise: [Exercise], sportUseCase: SportUseCaseProtocol) {
        self.router = router
        self.exercise = exercise
        self.sportUseCase = sportUseCase
    }

}
