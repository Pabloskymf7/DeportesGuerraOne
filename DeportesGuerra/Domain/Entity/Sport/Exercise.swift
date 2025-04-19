//
//  Sport.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 3/4/25.
//

import Foundation

class Exercise: Identifiable {
    var name: String
    var type: String
    var muscle: String
    var equipment: String
    var difficulty: String
    var instructions: String

    init(name: String, type: String, muscle: String, equipment: String, difficulty: String, instructions: String) {
        self.name = name
        self.type = type
        self.muscle = muscle
        self.equipment = equipment
        self.difficulty = difficulty
        self.instructions = instructions
    }
}
