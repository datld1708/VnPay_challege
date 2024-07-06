//
//  PokemonModel.swift
//  VnPay_Challenge_Pokemon
//
//  Created by Lê Đình Đạt on 05/07/2024.
//

import Foundation

class ListPokemon: Codable {
    var name: String?
    var sprites: ImagePokemon?
}

class ImagePokemon: Codable{
    var front_default: String?
    var back_shiny: String?
    var back_default: String?
    var front_shiny: String?
    var back_female: String?
    var back_shiny_female: String?
    var front_shiny_female: String?
}
