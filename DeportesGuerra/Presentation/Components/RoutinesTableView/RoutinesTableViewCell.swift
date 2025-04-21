//
//  RoutinesTableViewCell.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import UIKit

class RoutinesTableViewCell: UITableViewCell {
    @IBOutlet weak var nameTextLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(with exercise: Exercise) {
        nameTextLabel.text = exercise.name
    }
}
