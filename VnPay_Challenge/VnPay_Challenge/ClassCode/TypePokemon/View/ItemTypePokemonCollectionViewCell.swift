//
//  ItemTypePokemonCollectionViewCell.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 5/7/24.
//

import UIKit

class ItemTypePokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellView.layer.borderWidth = 1
        self.cellView.layer.cornerRadius = 8
    }

    func configCell(data: PokemonModel){
        self.nameLabel.text = data.name?.uppercased() ?? ""
        self.cellView.layer.borderColor = data.setColor().cgColor
        self.nameLabel.textColor = data.setColor()
    }
    
}
