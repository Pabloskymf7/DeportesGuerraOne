//
//  LoginProtocol.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 5/4/25.
//

import Foundation

protocol LoginViewModelProtocol {
    func goToHomeScreen()
    func goToCreateAccount()
}

protocol LoginRouterProtocol {
    func goToHomeScreen()
    func goToCreateAccount()
}
