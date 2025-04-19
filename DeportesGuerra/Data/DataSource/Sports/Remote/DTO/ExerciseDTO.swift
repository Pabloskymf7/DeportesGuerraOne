//
//  SportDTO.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 3/4/25.
//

import Foundation

struct ExerciseDTO: Decodable {
    var name: String
    var type: String
    var muscle: String
    var equipment: String
    var difficulty: String
    var instructions: String
}
