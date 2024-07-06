//
//  PokemonViewModel.swift
//  VnPay_Challenge_Pokemon
//
//  Created by Lê Đình Đạt on 06/07/2024.
//

import Foundation
import UIKit

class PokemonViewModel {
    
    let apiService = PokemonService()
    var listImg: [String] = []
    
    func getApi(name: String ,completion: @escaping (String, [String]) -> Void){
        self.apiService.getPokemon(name: name, completionHandler: { data in
            self.setData(data: data,completion: { listImg in
                completion(data.name ?? "" , listImg)
            })
           
        })
    }
    
    func setData(data: ListPokemon, completion: @escaping (([String]) -> Void)){
        if let img = data.sprites?.front_default {
            self.listImg.append(img)
        }
        
        if let img = data.sprites?.back_shiny {
            self.listImg.append(img)
        }
        
        if let img = data.sprites?.back_default {
            self.listImg.append(img)
        }
        
        if let img = data.sprites?.front_shiny {
            self.listImg.append(img)
        }
        
        if let img = data.sprites?.back_female {
            self.listImg.append(img)
        }
        
        if let img = data.sprites?.back_shiny_female {
            self.listImg.append(img)
        }
        
        if let img = data.sprites?.front_shiny_female {
            self.listImg.append(img)
        }
        completion(self.listImg)
    }
    
    func cellSize() -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    
}
