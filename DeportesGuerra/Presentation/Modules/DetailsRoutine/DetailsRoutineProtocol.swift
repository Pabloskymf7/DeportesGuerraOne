//
//  DetailsRoutineProtocol.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 26/4/25.
//

import Foundation

protocol DetailsRoutineViewModelProtocol {
    var exercise: Exercise { get }
    var dataLoaded: (() -> Void)? { get set }
}

protocol DetailsRoutineRouterProtocol{
}
