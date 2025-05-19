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
        setupFonts()
    }
    
    //MARK: - Functions
    func setupFonts() {
        titleLabel.font = UIFont(name: "SourceSans3-Bold", size: 20)
        descriptionLabel.font = UIFont(name: "SourceSans3-Regular", size: 16)
    }
    
    func setupNoProfessional() {
        titleLabel.text = "It's time to train!"
        descriptionLabel.text = "Discover how to train effectively"
        isProfessional = false
        collectionView.reloadData()
    }
    
    func setupProfessional() {
        titleLabel.text = "Prepare training at the highest level"
        descriptionLabel.text = "Ready to take your training to the next level?"
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SportCollectionViewCell
            cell?.animateSelection()
        
        var endpoint: String?
        
        if isProfessional {
            switch indexPath.row {
            case 0:
                endpoint = ExercisesEndpoints.olympic.rawValue
            case 1:
                endpoint = ExercisesEndpoints.powerlifting.rawValue
            case 2:
                endpoint = ExercisesEndpoints.strongman.rawValue
            default:
                break
            }
        } else {
            switch indexPath.row {
            case 0:
                endpoint = ExercisesEndpoints.cardio.rawValue
            case 1:
                endpoint = ExercisesEndpoints.strength.rawValue
            case 2:
                endpoint = ExercisesEndpoints.plyometrics.rawValue
            default:
                break
            }
        }
        
        if let endpoint = endpoint {
            delegate?.goToDetailsScreen(with: endpoint)
        }
    }
    
    func configureCollectionView() {
        let nib = UINib(nibName: "SportCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SportCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        self.selectionStyle = .none
    }
    
    
}
