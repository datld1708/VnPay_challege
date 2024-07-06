//
//  PokemonService.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 5/7/24.
//

import Foundation
import UIKit

class PokemonService: NetworkClient {
    let pathType = "https://pokeapi.co/api/v2/type/"
    let pathPokemon = "https://pokeapi.co/api/v2/pokemon/"
    
    func requestDataListTypePokemon(type: String ,completionHandler: (([PokemonModel]) -> Void)?) {
        self.excuted(urlAPI: self.pathType + type, header: [:],type: PokemonType.self) { data, errors in
            var listPokemon: [PokemonModel] = []
            defer {
                completionHandler?(listPokemon)
            }

            guard let data = data else {
                return
            }
            for item in data.pokemon {
                if let dataPokemon = item.pokemon{
                    listPokemon.append(dataPokemon)
                }
            }
        }
    }

    func getPokemon(name: String ,completionHandler: ((ListPokemon) -> Void)?){
        self.excuted(urlAPI: self.pathPokemon + name, header: [:],type: ListPokemon.self) { data, errors in
            if let dataPokemon = data {
                completionHandler?(dataPokemon)
            }
        }
    }
 
}
