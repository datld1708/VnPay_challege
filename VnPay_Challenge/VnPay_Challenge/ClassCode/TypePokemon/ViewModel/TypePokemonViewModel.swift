//
//  TypePokemonViewModel.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 5/7/24.
//

import Foundation
import UIKit

class TypePokemonViewModel {
    
    var listTypePokemon: [PokemonModel] = []
    
    func setData(compeltion: @escaping ([PokemonModel]) -> Void ){
        self.listTypePokemon.append(contentsOf: [PokemonModel(name: "fire"),
                                                 PokemonModel(name: "normal"),
                                                 PokemonModel(name: "grass"),
                                                 PokemonModel(name: "electric"),
                                                 PokemonModel(name: "psychic"),
                                                 PokemonModel(name: "ice"),
                                                 PokemonModel(name: "dragon")])
        compeltion(self.listTypePokemon)
    }
    
    func cellSize(index: Int) -> CGSize {
        let width = Common.calculateTextWidth(self.listTypePokemon[index].name?.uppercased() ?? "", font: UIFont(name: Constants.FontName.kFontSFProDisplayBold, size: 14) ?? .systemFont(ofSize: 17) , height: 50)

        return CGSize(width: width + 100, height: 50)
    }
    
    func pushListPokemon(index: Int){
        
    }
    
}
