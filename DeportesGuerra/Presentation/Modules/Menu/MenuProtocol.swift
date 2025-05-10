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
    
}

protocol HomeDelegateProtocol {
    func goToDetailsScreen(with endpoint: String)
}
