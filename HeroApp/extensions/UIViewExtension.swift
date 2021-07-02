//
//  UIViewExtension.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 01/07/21.
//

import UIKit

extension UIView {
    
    func addSymmetricPadding(horizontal: Double, vertical: Double){
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: CGFloat(vertical), leading: CGFloat(horizontal), bottom: CGFloat(vertical), trailing: CGFloat(horizontal))

    }
}
