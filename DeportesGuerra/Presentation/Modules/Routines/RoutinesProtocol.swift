//
//  RoutinesProtocol.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import Foundation

protocol RoutinesViewModelProtocol {
    var exercise: [Exercise] { get }
    var dataLoaded: (() -> Void)? { get set }
}

protocol RoutinesRouterProtocol {
    
}
