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
}

protocol RoutinesRouterProtocol {
    
}
