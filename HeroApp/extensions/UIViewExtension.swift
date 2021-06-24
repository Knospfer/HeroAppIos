//
//  UIViewExtension.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 24/06/21.
//

import Foundation
import UIKit

extension UILabel {
    func setLineHeight(lineHeight: CGFloat) {
        guard let text = self.text else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        self.attributedText = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle : paragraphStyle
            ]
        )
    }
    
}
