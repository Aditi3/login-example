//
//  HLSignUpVC.swift
//  HelloLogin
//
//  Created by Aditi Agrawal on 30/10/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import UIKit

class HLSignUpVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        emailTextField.delegate = self
        confirmPasswordTextField.delegate = self
        passwordTextField.delegate = self
    }
}


//MARK:- UITextFieldDelegate

extension HLSignUpVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        return true
    }
    
}
