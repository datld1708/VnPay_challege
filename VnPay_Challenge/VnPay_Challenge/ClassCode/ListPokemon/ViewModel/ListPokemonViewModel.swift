//
//  ListPokemonViewModel.swift
//  VnPay_Challenge_Pokemon
//
//  Created by Lê Đình Đạt on 05/07/2024.
//

import Foundation
import UIKit

class ListPokemonViewModel {
    let apiService = PokemonService()
    var listPokemon: [PokemonModel] = []
    
    
    func getData(type: String, completion: @escaping ([PokemonModel]) -> Void){
        self.apiService.requestDataListTypePokemon(type: type) { data in
            self.listPokemon = data
            completion(self.listPokemon)
        }
       
    }
    
    func cellSize(index: Int) -> CGSize {
        let width = (Constants.ScreenSize.SCREEN_WIDTH - 50) / 2
        let heightLabel = Common.heightOfLabel(text: self.listPokemon[index].name?.lowercased() ?? "", font: UIFont(name: Constants.FontName.kFontSFProDisplayBold, size: 14) ?? UIFont.systemFont(ofSize: 14), maxWidth: width, lines: 1)
        let height = width + 10 + heightLabel
        return CGSize(width: width, height: height)
    }
}
