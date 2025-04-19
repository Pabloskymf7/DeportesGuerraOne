//
//  SportDataSourceProtocol.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 3/4/25.
//

import Foundation

protocol SportDataSourceProtocol {
    func getExercises() async throws -> [ExerciseDTO]
}
