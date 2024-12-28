//
//  TransferController.swift
//  BankApp
//
//  Created by Mac on 02.12.24.
//

import UIKit
import Lottie

class TransferController: UIViewController {

    
    @IBOutlet private weak var cardView: LottieAnimationView!
    @IBOutlet private weak var amountField: UITextField!
    @IBOutlet private weak var receiveCardField: UITextField!
    @IBOutlet private weak var transferButton: UIButton!
    @IBOutlet private weak var cardAmountLabel: UILabel!
    
    var selectedCardIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Transfer"
        
        amountField.layer.borderWidth = 0.3
        amountField.layer.cornerRadius = 15
        receiveCardField.layer.borderWidth = 0.3
        receiveCardField.layer.cornerRadius = 15
        
        cardAmountLabel.text = "Your current amount is \(cards.amount[0])$"
            
        cardView.play()
        cardView.loopMode = .loop
        
        if let index = selectedCardIndex {
            cardAmountLabel.text = "Total amount: \(cards.amount[index])$"
        }

    }
    
    @IBAction func transferButtonTapped(_ sender: Any) {
        if let card = receiveCardField.text, !card.isEmpty, card.count == 16,
           let amount = amountField.text, !amount.isEmpty,
           let enteredValue = Int(amount),
           let index = selectedCardIndex {
            if cards.amount[index] >= enteredValue {
                cards.amount[index] -= enteredValue
                cardAmountLabel.textColor = .black
                cardAmountLabel.text = "Your current amount is \(cards.amount[index])$"
            } else if enteredValue > cards.amount[index] {
                cardAmountLabel.textColor = .red
                cardAmountLabel.text = "You don't have enough money"
            }
        }
    }
    
}
