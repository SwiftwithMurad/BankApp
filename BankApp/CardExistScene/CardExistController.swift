//
//  CardExistController.swift
//  BankApp
//
//  Created by Mac on 01.12.24.
//

import UIKit

class CardExistController: UIViewController {

    
    @IBOutlet private weak var cardsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cards"
        
        cardsTableView.dataSource = self
        cardsTableView.delegate = self
        
        cardsTableView.register(UINib(nibName: "CardExistCell", bundle: nil), forCellReuseIdentifier: "CardExistCell")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapMenuButton))
    }
    
}




extension CardExistController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.title.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardExistCell") as! CardExistCell
        cell.cardExistLabel.text = cards.title[indexPath.row]
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TransferController") as! TransferController
        controller.selectedCardIndex = indexPath.row
        navigationController?.show(controller, sender: nil)
    }
    
    @objc func tapMenuButton() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CardNotExistController") as! CardNotExistController
        navigationController?.show(controller, sender: nil)
    }
    
}
