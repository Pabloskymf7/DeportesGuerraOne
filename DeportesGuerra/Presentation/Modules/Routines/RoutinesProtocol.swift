//
//  RoutinesProtocol.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import Foundation

protocol RoutinesViewModelProtocol {
    var exercise: [Exercise] { get }
    var endpoint: String { get }
    var dataLoaded: (() -> Void)? { get set }
    func viewDidLoad()
    func goToDetailsRoutine(with index: Int)
}

protocol RoutinesRouterProtocol {
    func goToDetailsRoutine(with exercise: Exercise)
}
