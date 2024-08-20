//
//  NetworkConstants.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import Foundation

enum NetworkConstants: String {
    // https://oauth.vk.com/authorize
    case authorize_url = "https://oauth.vk.com/authorize"
    case client_id = "52164659"
    case redirect_uri = "https://github.com/"
    case display = "page"
    case scope = "photos, video"
    case response_type = "code"
    case v = "5.199"
    // https://oauth.vk.com/access_token
    case access_token = "https://oauth.vk.com/access_token"
    case client_secret = "o85qxHngwVdC82m1TaPk"
    // https://api.vk.com/method/photos.get
    case photos_get = "https://api.vk.com/method/photos.get"
    case owner_id = "-128666765"
    case album_id = "266276915"

    var name: String { get { return String(describing: self) } }
    var description: String { get { return self.rawValue } }
}
