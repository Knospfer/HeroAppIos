//
//  DetailViewController.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 23/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    let dividerGrey = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let subView = createUI()
        view.addSubview(subView)
        
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            subView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            subView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    private func createUI() -> UIView{
        let subView = UIView()
        let paddedSubView = createPaddedSubView()
        let imageView = HeroViewBuilder.createHeroImageView(imageName: "ironman")
       
        HeroViewBuilder.addItemsToSubView(items: [imageView,paddedSubView], subview: subView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: subView.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: subView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: subView.trailingAnchor),
            
            paddedSubView.widthAnchor.constraint(equalTo: subView.widthAnchor, multiplier: 0.8),
            paddedSubView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            paddedSubView.centerYAnchor.constraint(equalTo: subView.centerYAnchor),
            paddedSubView.centerXAnchor.constraint(equalTo: subView.centerXAnchor)
        ])
        
        return subView
    }
    
    private func createPaddedSubView() -> UIView {
        let paddedSubView = UIView()
        let heroNameLabel = HeroViewBuilder.createHeroNameLabel(name: "iron\nman", color: .black)
        let secondaryRow = createHeroRealNameAndMarvelLogoRow()
        let startSeparator = createSeparator()
        let descriptionLabel = createDescriptionLabel()
        
        HeroViewBuilder.addItemsToSubView(items: [heroNameLabel,secondaryRow,startSeparator, descriptionLabel], subview: paddedSubView)
        
        NSLayoutConstraint.activate([
            heroNameLabel.topAnchor.constraint(equalTo: paddedSubView.topAnchor),
            heroNameLabel.leadingAnchor.constraint(equalTo: paddedSubView.leadingAnchor),
            heroNameLabel.trailingAnchor.constraint(equalTo: paddedSubView.trailingAnchor),
            
            secondaryRow.topAnchor.constraint(equalTo: heroNameLabel.bottomAnchor,constant: 24),
            secondaryRow.leadingAnchor.constraint(equalTo: paddedSubView.leadingAnchor),
            secondaryRow.trailingAnchor.constraint(equalTo: paddedSubView.trailingAnchor),
            
            startSeparator.topAnchor.constraint(equalTo: secondaryRow.bottomAnchor, constant: 20),
            startSeparator.leadingAnchor.constraint(equalTo: paddedSubView.leadingAnchor),
            startSeparator.trailingAnchor.constraint(equalTo: paddedSubView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: startSeparator.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: paddedSubView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: paddedSubView.trailingAnchor),
            
            
        ])
        
        return paddedSubView
    }
    
    private func createMarvelLogo() -> UIImageView{
        let image = UIImage(named: "marvel")
        let imageView = UIImageView(image: image)
        
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 74).isActive = true
        
        return imageView
    }
    
    private func createHeroRealNameAndMarvelLogoRow() -> UIStackView {
        let heroRealNameLabel = HeroViewBuilder.createRealNameLabel(name: "tony stark", color: .black)
        let marvelLogo = createMarvelLogo()
        
        heroRealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        marvelLogo.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [heroRealNameLabel, marvelLogo])
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        return stackView
    }
    
    private func createSeparator() -> UIView {
        let separator = UIView()
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.backgroundColor = dividerGrey
        
        return separator
    }
    
    private func createDescriptionLabel() -> UILabel {
        let descriptionLabel = UILabel()
        
        descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        
        descriptionLabel.textColor = .gray
        
        return descriptionLabel
    }
    
}
