//
//  ExchangeAuthorizationCodeResponseModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 19.08.2024.
//

import Foundation

struct ExchangeAuthorizationCodeResponseModel: Decodable {
    let accessToken: String
    let expiresIn: Int
    let userId: Int
}
