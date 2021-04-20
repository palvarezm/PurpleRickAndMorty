//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import Foundation

struct CharacterResponse: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: OriginResponse?
    let location: LocationResponse?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}
