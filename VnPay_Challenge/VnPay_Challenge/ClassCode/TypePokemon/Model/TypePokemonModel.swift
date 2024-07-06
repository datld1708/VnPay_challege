//
//  PokemonModel.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 5/7/24.
//

import Foundation
import UIKit

class PokemonModel: Codable {
    var name: String?
    var image: String?
    
    init(name: String){
        self.name = name
    }
    
    func setColor() -> UIColor{
        switch self.name {
        case "fire":
            return UIColor.init(hexString: "#F23707")
        case "normal":
            return UIColor.init(hexString: "#A0A0A0")
        case "grass":
            return UIColor.init(hexString: "#92BF19")
        case "electric":
            return UIColor.init(hexString: "#E4B700")
        case "psychic":
            return UIColor.init(hexString: "#DB78C6")
        case "ice":
            return UIColor.init(hexString: "#44B7EE")
        case "dragon":
            return UIColor.init(hexString: "#3C64C8")
        case .none:
            return UIColor.black
        default:
            return UIColor.black
        }
    }
    
}

class PokemonEntity: Codable {
    var pokemon: PokemonModel?
    var slot: Int?
}

class PokemonType: Codable {
    var pokemon: [PokemonEntity] = []
  
}
 
