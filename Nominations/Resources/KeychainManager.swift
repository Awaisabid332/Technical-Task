//
//  KeychainManager.swift
//  Nominations
//
//  Created by AWS Macbook on 23/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import Security

class KeychainManager {

    private static var _sharedManager: KeychainManager?
    private let serviceIdentifier: String
    private let userToken = "User_Token"

    public static var shared: KeychainManager {
        if _sharedManager == nil {
            _sharedManager = KeychainManager()
        }
        return _sharedManager ?? KeychainManager()
    }

    private init() {
        self.serviceIdentifier = "com.3sidedcube.Nominations"
        //Save Auth Token in keychain for Api's calls
        self.saveUserToken(token: "100|cyXs1Npf9dST0q76eAZU4rcNaRaFp1Y67ulq9fjhf92936de")
    }

    func saveUserToken(token: String) {
        guard let valueData = token.data(using: .utf8) else { return }
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceIdentifier,
            kSecAttrAccount as String: userToken,
            kSecValueData as String: valueData,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        ]
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

    func getUserToken() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceIdentifier,
            kSecAttrAccount as String: userToken,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue!
        ]
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        if status == errSecSuccess,
           let retrievedData = result as? Data,
           let stringValue = String(data: retrievedData, encoding: .utf8) {
            return stringValue
        } else {
            return nil
        }
    }
}
