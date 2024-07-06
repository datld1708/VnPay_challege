//
//  ItemImagePokemonCollectionViewCell.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 6/7/24.
//

import UIKit

class ItemImagePokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.borderWidth = 1
        img.layer.cornerRadius = 8
        // Initialization code
    }
    
    func configCell(url: String){
        self.img.startAnimating()
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, let image = UIImage(data: data) else {
                    return
                }
                DispatchQueue.main.async {
                    self.img.image = image
                    self.img.stopAnimating()
                }
            }.resume()
        }
    }

}
