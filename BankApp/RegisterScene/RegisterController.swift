//
//  RegisterController.swift
//  BankApp
//
//  Created by Mac on 29.11.24.
//

import UIKit
import Lottie

class RegisterController: UIViewController {
    
    @IBOutlet private weak var fullnameField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var phoneField: UITextField!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var bankAnimation: LottieAnimationView!
    
    
    var sendDataToLogin: ((UserInfo) -> Void)?
    
    let manager = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Register"
        
        fullnameField.layer.borderWidth = 0.3
        fullnameField.layer.cornerRadius = 15
        passwordField.layer.cornerRadius = 15
        passwordField.layer.borderWidth = 0.3
        phoneField.layer.cornerRadius = 15
        phoneField.layer.borderWidth = 0.3
        emailField.layer.cornerRadius = 15
        emailField.layer.borderWidth = 0.3
        
        passwordField.isSecureTextEntry = true
        emailField.keyboardType = .emailAddress
        phoneField.keyboardType = .phonePad
        
        bankAnimation.play()
        bankAnimation.loopMode = .loop
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        if let fullname = fullnameField.text, !fullname.isEmpty,
           let password = passwordField.text, !password.isEmpty,
           let phone = phoneField.text, !phone.isEmpty,
           let email = emailField.text, !email.isEmpty
            {
            manager.setValue(value: fullname, key: .fullName)
            manager.setValue(value: password, key: .password)
            manager.setValue(value: phone, key: .phoneNumber)
            manager.setValue(value: email, key: .email)
            sendDataToLogin?(UserInfo.init(fullname: fullname, email: email, password: password, phone: phone, homeInfo: []))
            navigationController?.popViewController(animated: true)
    
        }
        
        
        
    }
}
