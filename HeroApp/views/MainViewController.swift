//
//  MainViewController.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 23/06/21.
//

import UIKit

class MainViewController: UIViewController {
    
    let customOrange = UIColor(red: 254/255, green: 154/255, blue: 50/255, alpha: 1)//226 236 17

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let subView = createUI()
        view.addSubview(subView)
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            subView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        ])
    }
    
    private func createUI() -> UIView{
        let heroImageView = createHeroImageView(imageName: "ironman")
        let heroNameLabel = createHeroNameLabel(name: "iron\nman")
        let heroRealNameLabel = createRealNameLabel(name: "tony stark")
        let knowMoreButton = createKnowMoreButton()
        
        let uiView = UIView()
        addItemsToSubView(items: [heroImageView,heroNameLabel,heroRealNameLabel,knowMoreButton], subview: uiView)
        
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
    
    private func createHeroImageView(imageName: String) -> UIImageView {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .bottom
        return imageView
    }
    
    private func createHeroNameLabel(name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 76)
        label.setLineHeightBasedOn(fontSize: 76)
            
        return label
    }
    
    private func createRealNameLabel(name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }
    
    private func createKnowMoreButton() -> UIButton{
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func addItemsToSubView(items: [UIView], subview: UIView){
        subview.translatesAutoresizingMaskIntoConstraints = false
        for item in items {
            item.translatesAutoresizingMaskIntoConstraints = false
            subview.addSubview(item)
        }
    }
}
