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
    @IBOutlet weak var keyboardScrollView: UIScrollView!
    @IBOutlet weak var signUpHeadlineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        emailTextField.delegate = self
        confirmPasswordTextField.delegate = self
        passwordTextField.delegate = self
                
        setUp()
        addObservers()
    }
    
    func setUp() {
        signUpHeadlineLabel.numberOfLines = 0
        signUpHeadlineLabel.text = "Welcome to our\nWorld".uppercased()
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = self.keyboardScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        keyboardScrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        
        keyboardScrollView.contentInset = UIEdgeInsets.zero
    }
}


//MARK:- UITextFieldDelegate

extension HLSignUpVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardScrollView.setContentOffset(CGPoint(x: 0, y: (textField.frame.origin.y - 20)), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        keyboardScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
}
