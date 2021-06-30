//
//  MainViewController.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 23/06/21.
//

import UIKit

class MainViewController: UIViewController {
    
    let customOrange = UIColor(red: 254/255, green: 203/255, blue: 35/255, alpha: 1)
    let backgroundOrange = UIColor(red: 228/255, green: 154/255, blue: 4/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let title = createPageTitle()
        let subView = createUI()
        let backgroundColor = createColoredBackground()
        
        view.addSubview(title)
        view.addSubview(backgroundColor)
        view.addSubview(subView)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundColor.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            subView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        ])
    }
    
    private func createPageTitle() -> UILabel{
        let title = UILabel()
        title.text = "movies"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 34)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }
    
    private func createUI() -> UIView{
        let heroImageView = HeroViewBuilder.createHeroImageView(imageName: "ironman")
        let heroNameLabel = HeroViewBuilder.createHeroNameLabel(name: "iron\nman")
        let heroRealNameLabel = HeroViewBuilder.createRealNameLabel(name: "tony stark")
        let knowMoreButton = createKnowMoreButton()
        
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        HeroViewBuilder.addItemsToSubView(items: [heroImageView,heroNameLabel,heroRealNameLabel,knowMoreButton], subview: uiView)
        
        heroNameLabel.setContentHuggingPriority(UILayoutPriority(1000), for: .vertical)
        heroRealNameLabel.setContentHuggingPriority(UILayoutPriority(1000), for: .vertical)
        
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: uiView.topAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: uiView.leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: uiView.trailingAnchor),
            
            heroNameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor),
            heroNameLabel.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 40),
            heroNameLabel.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: 40),
            
            
            heroRealNameLabel.topAnchor.constraint(equalTo: heroNameLabel.bottomAnchor, constant: 24),
            heroRealNameLabel.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 43.8),
            heroRealNameLabel.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: 40),
            
            knowMoreButton.topAnchor.constraint(equalTo: heroRealNameLabel.bottomAnchor, constant: 22),
            knowMoreButton.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 44),
            knowMoreButton.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: 40),
            knowMoreButton.bottomAnchor.constraint(equalTo: uiView.bottomAnchor)
        ])
        
        return uiView
    }
    
    private func createColoredBackground() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backgroundOrange
        view.layer.cornerRadius = 50
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        
        return view
    }
    
    private func createKnowMoreButton() -> UIButton{
        let button = UIButton()
        button.addTarget(self, action: #selector(navigateToDetailView), for: .touchUpInside)
        button.setTitle("know more", for: .normal)
        button.contentHorizontalAlignment = .leading
        button.setTitleColor(customOrange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        
        return button
    }
    
    @objc  private func navigateToDetailView(){
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
