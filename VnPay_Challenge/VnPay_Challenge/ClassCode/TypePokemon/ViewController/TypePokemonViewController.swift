//
//  TypePokemonViewController.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 5/7/24.
//

import UIKit

class TypePokemonViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = TypePokemonViewModel()
    
    var listTypePokemon: [PokemonModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initCollectionView()
        self.getData()
    }
    
    func initCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.registerCellByNib(ItemTypePokemonCollectionViewCell.self)
    }
    
    func getData() {
        self.viewModel.setData(compeltion: { [weak self] listData in
            self?.listTypePokemon = listData
            self?.collectionView.reloadData()
        })

    }

}

extension TypePokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listTypePokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(ItemTypePokemonCollectionViewCell.self, forIndexPath: indexPath)        
        cell.configCell(data: self.listTypePokemon[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.viewModel.cellSize(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ListPokemonViewController()
        vc.typePokemon = self.listTypePokemon[indexPath.row].name ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
