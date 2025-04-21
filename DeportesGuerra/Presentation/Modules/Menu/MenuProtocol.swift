//
//  MenuProtocol.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit

protocol MenuRouterProtocol {
    func goToCardioScreen(with endpoint: String)
}

protocol MenuViewModelProtocol {
    func goToCardioScreen()
}
