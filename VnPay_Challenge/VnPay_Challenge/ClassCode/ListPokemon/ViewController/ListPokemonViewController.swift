//
//  ListPokemonViewController.swift
//  VnPay_Challenge_Pokemon
//
//  Created by Lê Đình Đạt on 05/07/2024.
//

import UIKit

class ListPokemonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var typePokemon: String?
    var listPokemon: [PokemonModel] = []
    private let viewModel = ListPokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.getApi()
        self.initTableView()
        // Do any additional setup after loading the view.
    }
    
    func initTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCellByNib(NamePokemonTableViewCell.self)
    }
    
    func getApi(){
        self.viewModel.getData(type: self.typePokemon ?? "", completion: { [weak self] listPokemon in
            self?.listPokemon = listPokemon
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
    }

    @IBAction func didTapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension ListPokemonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(NamePokemonTableViewCell.self, forIndexPath: indexPath)
        cell.configCell(data: self.listPokemon[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PokemonViewController()
        vc.namePokemon = self.listPokemon[indexPath.row].name ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
