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
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        setupUI()
    }

    override func prepareForReuse() {
        imageView.image = nil
        titleLabel.text = nil
    }
    
    //MARK: - Functions
    func animateSelection() {
        print("Animation started")

        // Animación de escala y color
        UIView.animate(withDuration: 0.2,
                       animations: {
                           // Animación de escala
                           self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                           // Cambio de color de fondo para mejor visibilidad
                           self.backgroundColor = .lightGray
                       },
                       completion: { _ in
                           // Restaurar la animación de escala y color al estado original
                           UIView.animate(withDuration: 0.2) {
                               self.transform = CGAffineTransform.identity
                               self.backgroundColor = .clear
                           }
                       })
    }

    func setupUI() {
        titleLabel.font = UIFont(name: "SourceSans3-Regular", size: 14)
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
