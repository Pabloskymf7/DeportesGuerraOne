//
//  SportRepository.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 3/4/25.
//

import Foundation

class SportRepository: SportRepositoryProtocol {
    private let sportDataSource: SportDataSourceProtocol
    
    init(sportDataSource: SportDataSourceProtocol) {
        self.sportDataSource = sportDataSource
    }

    func getExercises(with endpoint: String) async throws -> [Exercise] {
        let exercisesDTO = try await sportDataSource.getExercises(with: endpoint)
        return exercisesDTO.map{ $0.toDomain() }
    }
}

fileprivate extension ExerciseDTO {
    func toDomain() -> Exercise {
        Exercise(name: self.name,
                 type: self.type,
                 muscle: self.muscle,
                 equipment: self.equipment,
                 difficulty: self.difficulty.capitalized,
                 instructions: self.instructions.formatedByParenthesis())
    }
}
