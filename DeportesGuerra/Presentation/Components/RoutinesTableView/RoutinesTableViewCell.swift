//
//  RoutinesTableViewCell.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 19/4/25.
//

import UIKit

class RoutinesTableViewCell: UITableViewCell {
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var difficultTextLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(with exercise: Exercise) {
        nameTextLabel.text = exercise.name
        difficultTextLabel.text = exercise.difficulty
        setupUI()
    }
    
    func setupUI() {
        nameTextLabel.font = UIFont(name: "SourceSans3-Regular", size: 18)
        difficultTextLabel.font = UIFont(name: "SourceSans3-Regular", size: 18)
    }
}
