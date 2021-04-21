//
//  CharacterListTableViewExtension.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import UIKit

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListCell.cellIdentifier) as! CharacterListCell
        cell.character = characterList?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
