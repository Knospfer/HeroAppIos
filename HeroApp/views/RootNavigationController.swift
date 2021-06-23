//
//  RootNavigationController.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 23/06/21.
//

import UIKit

class RootNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set Nav bar transparent
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        //Set back button black with no text
        navigationBar.topItem?.backButtonDisplayMode = .minimal
        navigationBar.tintColor = .black
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
