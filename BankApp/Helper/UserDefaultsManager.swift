//
//  UserDefaultsManager.swift
//  BankApp
//
//  Created by Mac on 30.11.24.
//

import Foundation

class UserDefaultsManager {
    enum UserDefaultsTypes: String, CaseIterable {
        case isLoggedIn = "isLoggedIn"
        case fullName = "fullName"
        case email = "email"
        case password = "password"
        case phoneNumber = "phoneNumber"
        case haveAddedCard = "haveAddedCard"
    }
    
    func setValue(value: Any?, key: UserDefaultsTypes) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getBool(key: UserDefaultsTypes) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }

    func getString(key: UserDefaultsTypes) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
}
