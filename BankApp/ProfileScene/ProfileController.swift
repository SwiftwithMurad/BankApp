//
//  ProfileController.swift
//  BankApp
//
//  Created by Mac on 02.12.24.
//

import UIKit
import Lottie

class ProfileController: UIViewController {

    let manager = UserDefaultsManager()
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPasswordLabel: UILabel!
    @IBOutlet weak var userNumberLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var profileAnimation: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        if let fullname = manager.getString(key: .fullName),
           let password = manager.getString(key: .password),
           let number = manager.getString(key: .phoneNumber),
           let email = manager.getString(key: .email) {
            userNameLabel.text = "Username: \(fullname)"
            userPasswordLabel.text = "Password: \(password)"
            userNumberLabel.text = "Phone number: \(number)"
            userEmailLabel.text = "Email: \(email)"
            
            profileAnimation.play()

        }
        
    }
    
}
