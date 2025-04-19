//
//  RoutinesTableViewCell.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import UIKit

class RoutinesTableViewCell: UITableViewCell {
    @IBOutlet weak var nameTextLabel: UILabel!
    
    func configureCell(with exercise: Exercise) {
        nameTextLabel.text = exercise.name
    }
}
