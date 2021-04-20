//
//  UITableViewCellExtension.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var cellIdentifier : String{
        return "\(String(describing: self))Identifier"
    }
}
