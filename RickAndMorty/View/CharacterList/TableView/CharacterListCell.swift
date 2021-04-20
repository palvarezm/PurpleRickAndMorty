//
//  CharacterListCell.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import UIKit

class CharacterListCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    var character: CharacterResponse? {
        didSet {
            characterNameLabel.text = character?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
