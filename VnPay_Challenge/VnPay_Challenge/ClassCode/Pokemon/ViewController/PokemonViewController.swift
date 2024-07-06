//
//  PokemonViewController.swift
//  VnPay_Challenge_Pokemon
//
//  Created by Lê Đình Đạt on 06/07/2024.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = PokemonViewModel()
    var namePokemon: String?
    var listImg: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.getData()
        self.initCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func initCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.registerCellByNib(ItemImagePokemonCollectionViewCell.self)
    }
    
    func getData(){
        self.viewModel.getApi(name: self.namePokemon ?? "", completion: {[weak self] name, data in
            DispatchQueue.main.async {
                self?.nameLabel.text = name
                self?.listImg = data
                self?.loadingView.isHidden = true
                self?.collectionView.reloadData()
            }
           
        })
    }

    @IBAction func didTapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension PokemonViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(ItemImagePokemonCollectionViewCell.self, forIndexPath: indexPath)
        cell.configCell(url: self.listImg[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.viewModel.cellSize()
    }
    
    
}
