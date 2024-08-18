//
//  Mocks.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import Foundation

public enum Mocks {
    static let photos: [PhotoModel] = [
        PhotoModel(
            id: UUID(),
            title: "This is first photo",
            date: "25-may-2024",
            url: "ItemMockImage01"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is second photo, with long writen text, that should be automatically cutted",
            date: "10-may-2024",
            url: "ItemMockImage02"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is third photo",
            date: "07-april-2024",
            url: "ItemMockImage03"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is fouth photo",
            date: "20-march-2024",
            url: "ItemMockImage04"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is fifth photo",
            date: "01-august-2024",
            url: "ItemMockImage05"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is six photo",
            date: "23-february-2024",
            url: "ItemMockImage06"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is seventh photo",
            date: "21-january-2024",
            url: "ItemMockImage07"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is eight photo",
            date: "08-june-2024",
            url: "ItemMockImage08"
        )
    ]
}
