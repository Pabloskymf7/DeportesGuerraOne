//
//  MenuProtocol.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 13/4/25.
//

import UIKit

protocol MenuRouterProtocol {
    func goToProfile(with exercise: Exercise)
}

protocol MenuViewModelProtocol {
    var exercise: [Exercise] { get }
    var dataLoaded: (() -> Void)? { get set }
    func viewDidLoad()
    func goToProfile(with index: Int)
}
