//
//  HomeController.swift
//  BankApp
//
//  Created by Mac on 29.11.24.
//

import UIKit

class HomeController: UIViewController {

    
    let manager = UserDefaultsManager()
    var exist = CardExistController()
    
    @IBOutlet private weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Welcome"
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
    }
    
  
    
    
    
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.homeInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        cell.labelName.text = info.homeInfo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            if cards.title.count == 0 {
                cardNotExistRoot()
            } else {
                cardExistRoot()
            }
        }
        
        if indexPath.row == 1 {
            if cards.title.count > 0 {
                cardExistRoot()
            } else if cards.title.count == 0 {
                showAlert()
            }
        } else if indexPath.row == 2 {
            profileScreen()
        }
    }
    
    func cardNotExistRoot() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CardNotExistController") as! CardNotExistController
        navigationController?.show(controller, sender: nil)
    }

    func cardExistRoot() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CardExistController") as! CardExistController
        navigationController?.show(controller, sender: nil)
    }
    
    func transferScreen() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TransferController") as! TransferController
        navigationController?.show(controller, sender: nil)
    }
    
    func profileScreen() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ProfileController") as! ProfileController
        navigationController?.show(controller, sender: nil)
    }
    
    func showAlert() {
        let failureAlert = UIAlertController(title: "Error", message: "Type a card to enter this page.", preferredStyle: .alert)
        failureAlert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(failureAlert, animated: true)
    }
}
