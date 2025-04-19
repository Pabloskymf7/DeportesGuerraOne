//
//  SportUseCauses.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 3/4/25.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
}

class SportUseCause: SportUseCaseProtocol {
    let repository: SportRepositoryProtocol
    
    init(repositoy: SportRepositoryProtocol) {
        self.repository = repositoy
    }

    func getExercises(with endpoint: String) async throws -> [Exercise] {
        return try await repository.getExercises(with: endpoint)
    } 
}
