//
//  CharacterListCell.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import UIKit
import SDWebImage

class CharacterListCell: UITableViewCell {

    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var statusImageView: UIImageView!
    
    var character: CharacterResponse? {
        didSet {
            characterNameLabel.text = character?.name
            if let characterUrlPath = character?.image, let newURL = URL(string: characterUrlPath){
                characterImageView.sd_setImage(with: newURL)
            }
            let genderImageName = GenderEnum.allCases.first { $0.rawValue == character?.gender}?.imageName ?? ""
            genderImageView.image = UIImage(named: genderImageName)
            statusImageView.image = character?.status == "Alive" ? #imageLiteral(resourceName: "ic_alive") : #imageLiteral(resourceName: "ic_dead")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        characterImageView.makeRounded()
        characterNameLabel.font = characterNameLabel.font.withSize(20)
    }
    
}
