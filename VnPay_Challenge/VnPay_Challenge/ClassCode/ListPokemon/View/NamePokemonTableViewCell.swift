//
//  NamePokemonTableViewCell.swift
//  VnPay_Challenge_Pokemon
//
//  Created by Lê Đình Đạt on 06/07/2024.
//

import UIKit

class NamePokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(data: PokemonModel){
        self.nameLabel.text = data.name
    }
    
}
