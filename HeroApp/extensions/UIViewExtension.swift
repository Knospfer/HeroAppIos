//
//  UIViewExtension.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 24/06/21.
//

import Foundation
import UIKit

extension UILabel {
    func setLineHeightBasedOn(fontSize: CGFloat) {
        guard let text = self.text else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = fontSize * 0.76 //58
        paragraphStyle.maximumLineHeight = fontSize * 0.76//58
        
        self.attributedText = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle : paragraphStyle,
                .baselineOffset: -fontSize * 0.22, //17
            ]
        )
        
    }
}
