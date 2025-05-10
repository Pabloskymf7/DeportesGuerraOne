//
//  SportCollectionViewCell.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 7/5/25.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        configureCell()
    }
    override func prepareForReuse() {
        imageView.image = nil
        titleLabel.text = nil
    }
    func configureCell() {
        
    }
    
    func setupCardio() {
        imageView.image = UIImage(named: "cardio")
        titleLabel.text = "Cardio"
    }
    
    func setupStrength() {
        imageView.image = UIImage(named: "fuerza")
        titleLabel.text = "Strength"
    }
    
    func setupPlyometrics() {
        imageView.image = UIImage(named: "pliometricoSegundo")
        titleLabel.text = "Plyometrics"
    }
    
    func setupOlympic() {
        imageView.image = UIImage(named: "movOlimpicos")
        titleLabel.text = "Olympic"
    }
    
    func setupStrongman() {
        imageView.image = UIImage(named: "strongman")
        titleLabel.text = "Strongman"
    }
    
    func setupPowerlifting() {
        imageView.image = UIImage(named: "powerlifting")
        titleLabel.text = "Powerlifting"
    }

}
