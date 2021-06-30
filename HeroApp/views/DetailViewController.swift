//
//  DetailViewController.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 23/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    
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
        let imageView = HeroViewBuilder.createHeroImageView(imageName: "ironman")
        let heroNameLabel = HeroViewBuilder.createHeroNameLabel(name: "iron\nman", color: .black)
        let secondaryRow = createHeroRealNameAndMarvelLogoRow()
        
        HeroViewBuilder.addItemsToSubView(items: [imageView,heroNameLabel,secondaryRow ], subview: subView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: subView.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: subView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: subView.trailingAnchor),
            
            heroNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            heroNameLabel.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 40),
            heroNameLabel.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: 40),
            
            secondaryRow.topAnchor.constraint(equalTo: heroNameLabel.bottomAnchor,constant: 24),
            secondaryRow.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 43.8),
            secondaryRow.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: 40),
        ])
        
        return subView
    }
    
    private func createMarvelLogo() -> UIImageView{
        let image = UIImage(named: "marvel")
        let imageView = UIImageView(image: image)
        
        imageView.contentMode = .scaleAspectFit
        
        
        
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
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
    
    
}
