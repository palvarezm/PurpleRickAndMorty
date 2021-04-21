//
//  EmptyTableView.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import Foundation
import UIKit

class EmptyTableView : UIView{
    private let stackView = UIStackView()
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 148).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 148).isActive = true
        
        return imageView
    }()
    private let message : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    convenience init(image : UIImage? , message : String){
        self.init(frame : .zero)
        self.imageView.image = image
        self.message.text = message
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(){
        self.backgroundColor = UIColor(named: "#E5E5E5")
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(message)
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 14
        self.addSubview(stackView)
        stackView.centerInSuperview()
    }
    
}
