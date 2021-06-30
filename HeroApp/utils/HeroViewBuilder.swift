//
//  HeroViewBuilder.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 30/06/21.
//

import UIKit

struct HeroViewBuilder {
    
    static func createHeroImageView(imageName: String) -> UIImageView {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .bottom
        
        return imageView
    }
    
    static func createHeroNameLabel(name: String, color: UIColor = .white) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.text = name
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 76)
        label.setLineHeightBasedOn(fontSize: 76)
        
        return label
    }
    
    static func createRealNameLabel(name: String, color: UIColor = .white) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.text = name
        label.font = UIFont.systemFont(ofSize: 30)
        
        return label
    }
    
    static func addItemsToSubView(items: [UIView], subview: UIView){
        subview.translatesAutoresizingMaskIntoConstraints = false
        for item in items {
            item.translatesAutoresizingMaskIntoConstraints = false
            subview.addSubview(item)
        }
    }
}
