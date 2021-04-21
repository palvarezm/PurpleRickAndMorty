//
//  SpeciesEnum.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 21/04/21.
//

import Foundation

enum SpeciesEnum: String {
    case human = "Human"
    case alien = "Alien"
    
    var imageName: String {
        switch self {
        case .human: return "ic_human"
        case .alien: return "ic_alien"
        }
    }
}
