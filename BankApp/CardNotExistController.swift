//
//  CardNotExistController.swift
//  BankApp
//
//  Created by Mac on 01.12.24.
//

import UIKit
import Lottie

class CardNotExistController: UIViewController {

    let manager = UserDefaultsManager()
    
    @IBOutlet private weak var cardNameField: UITextField!
    @IBOutlet private weak var cvcField: UITextField!
    @IBOutlet private weak var expireDateField: UITextField!
    @IBOutlet private weak var cardNumberField: UITextField!
    
    @IBOutlet weak var cardAnimation: LottieAnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Card"
        
        cardNameField.layer.borderWidth = 0.3
        cardNameField.layer.cornerRadius = 15
        cardNumberField.layer.borderWidth = 0.3
        cardNumberField.layer.cornerRadius = 15
        cardNumberField.keyboardType = .numberPad
        expireDateField.layer.borderWidth = 0.3
        expireDateField.layer.cornerRadius = 15
        expireDateField.keyboardType = .numberPad
        cvcField.layer.borderWidth = 0.3
        cvcField.layer.cornerRadius = 15
        cvcField.keyboardType = .numberPad
        
        cardAnimation.play()
        
    }
    
    func appendMethod(card: String, number: String, amount: Int) {
        cards.title.append(card)
        cards.number.append(number)
        cards.amount.append(amount)
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        manager.setValue(value: true, key: .haveAddedCard)
        if let card = cardNameField.text, !card.isEmpty,
           let number = cardNumberField.text, !number.isEmpty, number.count == 16,
           let expire = expireDateField.text, !expire.isEmpty, expire.count == 4,
           let cvc = cvcField.text, !cvc.isEmpty, cvc.count == 3 {
            appendMethod(card: card, number: number, amount: 1000)
            navigationController?.popToRootViewController(animated: true)
            print(cards)
            
        }
    }
}

