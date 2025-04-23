//
//  ProfileViewModel.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import UIKit

class ProfileViewModel: ProfileViewModelProtocol {
    var router: ProfileRouterProtocol
    var sportUseCase: SportUseCaseProtocol
    
    init(router: ProfileRouterProtocol, sportUseCase: SportUseCaseProtocol) {
        self.router = router
        self.sportUseCase = sportUseCase
    }
}
