//
//  ViewController.swift
//  HelloLogin
//
//  Created by Aditi Agrawal on 24/10/20.
//

import UIKit

class HLHomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar()
    }
}

extension HLHomeVC {
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }    
}


