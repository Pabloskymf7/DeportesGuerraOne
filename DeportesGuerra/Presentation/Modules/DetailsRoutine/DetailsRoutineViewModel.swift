//
//  DetailsRoutineViewModel.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 26/4/25.
//

import Foundation

class DetailsRoutineViewModel: DetailsRoutineViewModelProtocol {
    var router: DetailsRoutineRouterProtocol
    var sportUseCase: SportUseCaseProtocol
    var exercise: Exercise
    var dataLoaded: (() -> Void)?

    init(router: DetailsRoutineRouterProtocol, sportUseCase: SportUseCaseProtocol, exercise: Exercise) {
        self.router = router
        self.sportUseCase = sportUseCase
        self.exercise = exercise
    }
}
