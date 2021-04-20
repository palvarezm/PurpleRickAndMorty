//
//  InfoResponse.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import Foundation

struct InfoResponse: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
