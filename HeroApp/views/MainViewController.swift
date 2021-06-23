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
        addButton()
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
