//
//  UIViewControllerExtension.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import Foundation
import UIKit

extension UIViewController{
    func showInfoAlert(message: String?){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok_alert".localized, style: .default, handler: nil))
        alert.show(self, sender: nil)
        self.present(alert, animated: true, completion: nil)
    }
}
