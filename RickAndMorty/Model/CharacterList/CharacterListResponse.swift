//
//  CharacterListResponse.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import Foundation

struct CharacterListResponse: Decodable {
    let info: InfoResponse?
    let characterList: [CharacterResponse]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case characterList = "results"
    }
}


