//
//  OAuthTokenStorage.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 19.08.2024.
//

import Foundation
import SwiftKeychainWrapper

final class OAuthTokenStorage {

    static let shared = OAuthTokenStorage()
    private let keychainWrapper = KeychainWrapper.standard

    var token: String? {
        get { keychainWrapper.string(forKey: NetworkConstants.access_token.name) }
        set { guard let newValue = newValue else { return }
            keychainWrapper.set(newValue, forKey: NetworkConstants.access_token.name) }
    }

    func clearToken() {
        token = nil
        keychainWrapper.removeObject(forKey: NetworkConstants.access_token.name)
    }

}
