//
//  HeaderTableViewCell.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 7/5/25.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var homeLabel: UILabel!
    
    //MARK: - Functions
    func configureCell() {
        setupUI()
    }

    func setupUI() {
        homeLabel.text = """
            Comienza a
            planificar tu
            próxima aventura
            """
        homeImage.contentMode = .scaleAspectFill
        self.selectionStyle = .none
    }
}
