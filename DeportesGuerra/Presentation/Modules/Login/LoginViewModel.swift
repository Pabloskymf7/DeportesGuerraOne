//
//  LoginViewModel.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    private let router: LoginRouterProtocol
    
    init(router: LoginRouterProtocol) {
        self.router = router
    }
    
    func goToHomeScreen() {
        
    }
}
