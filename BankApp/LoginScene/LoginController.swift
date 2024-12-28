//
//  LoginController.swift
//  BankApp
//
//  Created by Mac on 27.11.24.
//

import UIKit
import Lottie

class LoginController: UIViewController {

    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var registerButton: UIButton!
    let manager = UserDefaultsManager()
    
    @IBOutlet weak var bankAnimation: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.layer.borderWidth = 0.3
        emailField.layer.cornerRadius = 15
        passwordField.layer.borderWidth = 0.3
        passwordField.layer.cornerRadius = 15
        
        bankAnimation.play()
        bankAnimation.loopMode = .loop
        
    }
    
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        manager.setValue(value: true, key: .isLoggedIn)
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        if let email = emailField.text, !email.isEmpty,
           let password = passwordField.text, !password.isEmpty,
           let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.homeRoot()
            manager.setValue(value: email, key: .email)
            manager.setValue(value: password, key: .password)
            navigationController?.show(controller, sender: nil)
                
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        controller.sendDataToLogin = { UserInfo in
            self.emailField.text = UserInfo.email
            self.passwordField.text = UserInfo.password
        }
        navigationController?.show(controller, sender: nil)
    }

}
