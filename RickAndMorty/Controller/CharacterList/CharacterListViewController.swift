//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import UIKit

class CharacterListViewController: UIViewController {

    @IBOutlet weak var charactersTableView: UITableView!
    lazy var emptyTableView =  EmptyTableView(image: UIImage(named: "emptyTable"), message: "No hay datos")
    var characterList: [CharacterResponse]?
    let apiClient = APIClient()
    
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
        LoadingIndicatorView.show(self.view, loadingText: "Cargando")
        apiClient.call(stringURL: NetworkConstants.CHARACTERS_LIST_URL, httpMethod: .get, type: CharacterListResponse.self){ [weak self] (value, error) in
            if let characters = value?.characterList {
                self?.characterList = characters
                self?.showTable()
                LoadingIndicatorView.hide()
            }
            else if error != nil {
                LoadingIndicatorView.hide()
                self?.showInfoAlert(message: "generic_error".localized)
            }
        }
    }
    
    func showTable(){
        if let characterList = self.characterList,  characterList.isEmpty {
            emptyTableView.backgroundColor = .white
            charactersTableView.backgroundView = emptyTableView
            charactersTableView.fillSuperview()
        }else{
            emptyTableView.removeFromSuperview()
        }
        self.charactersTableView.reloadData()
    }
    
}
