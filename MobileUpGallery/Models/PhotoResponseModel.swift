//
//  PhotoResponseModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 19.08.2024.
//

import Foundation

struct PhotoResponseModel: Codable {
    let response: PhotoResponseData
}

struct PhotoResponseData: Codable {
    let count: Int
    let items: [PhotoItem]
}

struct PhotoItem: Codable {
    let date: Int
    let sizes: [PhotoData]
    let text: String
    let origPhoto: PhotoData
}

struct PhotoData: Codable {
    let height: Int
    let type: String
    let width: Int
    let url: String
}
