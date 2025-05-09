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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
