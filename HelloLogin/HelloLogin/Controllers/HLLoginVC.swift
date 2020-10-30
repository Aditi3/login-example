//
//  HLLoginVC.swift
//  HelloLogin
//
//  Created by Aditi Agrawal on 26/10/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import UIKit

class HLLoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var keyboardScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}


//MARK:- UITextFieldDelegate

extension HLLoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardScrollView.setContentOffset(CGPoint(x: 0, y: (textField.superview?.frame.origin.y)!), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        keyboardScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}
