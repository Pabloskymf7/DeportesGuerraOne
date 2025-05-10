//
//  BodyTableViewCell.swift
//  DeportesGuerra
//
//  Created by Pablo Miguel Ferrer on 7/5/25.
//

import UIKit

class BodyTableViewCell: UITableViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    var delegate: HomeDelegateProtocol?
    var isProfessional = false
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    //MARK: - Functions
    
    
    //MARK: - Private Functions
    func setupNoProfessional() {
        titleLabel.text = "Es hora de entrenar!"
        descriptionLabel.text = "Descubre la manera de entrenar de forma efectiva"
        isProfessional = false
        collectionView.reloadData()
    }
    
    func setupProfessional() {
        titleLabel.text = "Prepara tus entrenamientos de más alto nivel"
        descriptionLabel.text = "¿Preparado para llevar tu exigencia al máximo?"
        isProfessional = true
        collectionView.reloadData()
    }
}

extension BodyTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isProfessional ? 3 : 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCollectionViewCell", for: indexPath) as! SportCollectionViewCell
        if isProfessional {
                    switch indexPath.row {
                    case 0:
                        cell.setupOlympic()
                    case 1:
                        cell.setupPowerlifting()
                    case 2:
                        cell.setupStrongman()
                    default:
                        break
                    }
                } else {
                    switch indexPath.row {
                    case 0:
                        cell.setupCardio()
                    case 1:
                        cell.setupStrength()
                    case 2:
                        cell.setupPlyometrics()
                    default:
                        break
                    }
                }
                
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.delegate?.goToDetailsScreen(with: ExercisesEndpoints.RawValue)
//    }
    
    func configureCollectionView() {
        let nib = UINib(nibName: "SportCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SportCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        self.selectionStyle = .none
    }
    
    
}
