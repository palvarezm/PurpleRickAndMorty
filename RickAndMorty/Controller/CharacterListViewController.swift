//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import UIKit
import Alamofire

class CharacterListViewController: UIViewController {

    @IBOutlet weak var charactersTableView: UITableView!
    var characterList: [CharacterResponse]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacters()
        setupView()
    }
    
    func setupView(){
        charactersTableView.register(UINib(nibName: "CharacterListCell", bundle: nil), forCellReuseIdentifier: CharacterListCell.cellIdentifier)
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
    }

    func loadCharacters(){
        AF.request("https://rickandmortyapi.com/api/character", method: .get).responseDecodable(of: CharacterListResponse.self) { [weak self] response in
            if let error = response.error {
                debugPrint(error)
            }
            else if let value = response.value {
                self?.characterList = value.characterList
                self?.charactersTableView.reloadData()
                debugPrint(value)
            }
        }
    }
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListCell.cellIdentifier) as! CharacterListCell
        cell.character = characterList?[indexPath.row]
        return cell
    }
}
