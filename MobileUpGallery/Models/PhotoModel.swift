//
//  PhotoModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import Foundation

struct PhotoModel: Identifiable, Decodable {
    let id: UUID
    let title: String
    let date: String
    let url: String
    let thrumb: String?
}
