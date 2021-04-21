//
//  GenderEnum.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 21/04/21.
//

import Foundation

enum GenderEnum: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case unknown = "unknown"
    
    var imageName: String {
        switch self {
        case .male: return "ic_male"
        case .female: return "ic_female"
        case .unknown: return "ic_unknown"
        }
    }
}
