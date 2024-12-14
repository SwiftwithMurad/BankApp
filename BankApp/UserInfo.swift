//
//  UserData.swift
//  BankApp
//
//  Created by Mac on 30.11.24.
//

import Foundation

struct UserInfo {
    let fullname: String
    let email: String
    let password: String
    let phone: String
    let homeInfo: [String]
}

var info = UserInfo(fullname: "", email: "", password: "", phone: "", homeInfo: ["Cards", "Transfer", "Profile"])


