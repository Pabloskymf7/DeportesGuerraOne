//
//  SportUseCaseProtocol.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 3/4/25.
//

import Foundation

protocol SportUseCaseProtocol {
    func getExercises(with endpoint: String) async throws -> [Exercise]
}
