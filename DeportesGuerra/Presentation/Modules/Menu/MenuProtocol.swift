//
//  MenuProtocol.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit

protocol MenuRouterProtocol {
    func goToRoutinesScreen(with endpoint: String)
}

protocol MenuViewModelProtocol {
    func goToCardioScreen()
    func goToOlympicScreen()
    func goToPliometricsScreen()
    func goToPowerliftingScreen()
    func goToStrengthScreen()
    func goToStrongmanScreen()
}
