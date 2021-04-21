//
//  LoadingIndicatorView.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import Foundation
import UIKit

class LoadingIndicatorView {

    static var currentOverlay : UIView?
    static var currentOverlayTarget : UIView?
    static var currentLabel : UILabel?
    static var currentLoadingText: String?

    static func show(_ overlayTarget : UIView, loadingText: String?,_ showBackground:Bool = true) {
        // Clear it first in case it was already shown
        hide()

        // Create the overlay
        let overlay = UIView()
        overlay.alpha = 0
        overlay.backgroundColor = UIColor.black
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubviewToFront(overlay)

        overlay.widthAnchor.constraint(equalTo: overlayTarget.widthAnchor).isActive = true
        overlay.heightAnchor.constraint(equalTo: overlayTarget.heightAnchor).isActive = true

        // Create and animate the activity indicator
        var indicator : UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            indicator = UIActivityIndicatorView(style: .medium)
        } else {
            indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
        }

        indicator.color = UIColor.white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        overlay.addSubview(indicator)

        indicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true

        // Create label
        if let textString = loadingText {
            let label = UILabel()
            label.text = textString
            label.textColor = UIColor.white
            overlay.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 16).isActive = true
            label.centerXAnchor.constraint(equalTo: indicator.centerXAnchor).isActive = true
            currentLabel = label
        }

        // Animate the overlay to show
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            overlay.alpha = overlay.alpha > 0 ? 0 : 0.5
        }, completion: nil)
        currentOverlay = overlay
        currentOverlayTarget = overlayTarget
        currentLoadingText = loadingText
    }

    static func hide() {
        if currentOverlay != nil {
            currentOverlay?.removeFromSuperview()
            currentOverlay =  nil
            currentLoadingText = nil
            currentLabel = nil
            currentOverlayTarget = nil
        }
    }
}
