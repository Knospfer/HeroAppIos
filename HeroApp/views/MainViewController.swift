//
//  MainViewController.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 23/06/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let subView = createUI()
        view.addSubview(subView)
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            subView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func createUI() -> UIView{
        let heroImageView = createHeroImageView(imageName: "ironman")
        let heroNameLabel = createHeroNameLabel(name: "iron\nman")
        let heroRealNameLabel = createRealNameLabel(name: "tony stark")
        
        let uiView = UIView()
        addItemsToSubView(items: [heroImageView,heroNameLabel,heroRealNameLabel], subview: uiView)
        
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: uiView.topAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: uiView.leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: uiView.trailingAnchor),
            
            heroNameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor),
            heroNameLabel.leadingAnchor.constraint(equalTo: uiView.leadingAnchor),
            heroNameLabel.trailingAnchor.constraint(equalTo: uiView.trailingAnchor),
            
            
            heroRealNameLabel.topAnchor.constraint(equalTo: heroNameLabel.bottomAnchor),
            heroRealNameLabel.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 3.8),
            heroRealNameLabel.trailingAnchor.constraint(equalTo: uiView.trailingAnchor)
        ])
        
        return uiView
    }
    
    private func createHeroImageView(imageName: String) -> UIImageView {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
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
    
    private func addButton(){
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setTitle("To Detail", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = .green
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    @objc  private func buttonTapped(){
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
