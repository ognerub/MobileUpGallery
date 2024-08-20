//
//  VKIDManager.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 20.08.2024.
//

import Foundation
import VKID

final class VKIDManager {

    var vkid: VKID?

    init() {
        do {
            vkid = try VKID(
                config: Configuration(
                    appCredentials: AppCredentials(
                        clientId: NetworkConstants.client_id.description,
                        clientSecret: NetworkConstants.client_secret.description
                    )
                ))
        } catch {
            preconditionFailure("Failed to initialize VKID: \(error)")
        }
    }
}
