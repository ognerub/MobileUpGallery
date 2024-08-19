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
            url: "ItemMockImage01",
            thrumb: "ItemMockImage01"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is second photo, with long writen text, that should be automatically cutted",
            date: "10-may-2024",
            url: "ItemMockImage02",
            thrumb: "ItemMockImage02"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is third photo",
            date: "07-april-2024",
            url: "ItemMockImage03",
            thrumb: "ItemMockImage03"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is fouth photo",
            date: "20-march-2024",
            url: "ItemMockImage04",
            thrumb: "ItemMockImage04"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is fifth photo",
            date: "01-august-2024",
            url: "ItemMockImage05",
            thrumb: "ItemMockImage05"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is six photo",
            date: "23-february-2024",
            url: "ItemMockImage06",
            thrumb: "ItemMockImage06"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is seventh photo",
            date: "21-january-2024",
            url: "ItemMockImage07",
            thrumb: "ItemMockImage07"
        ),
        PhotoModel(
            id: UUID(),
            title: "This is eight photo",
            date: "08-june-2024",
            url: "ItemMockImage08",
            thrumb: "ItemMockImage08"
        )
    ]

    static let videos: [VideoModel] = [
        VideoModel(
            id: UUID(),
            title: "This is first video",
            date: "25-may-2024",
            url: "ItemMockVideo01"
        ),
        VideoModel(
            id: UUID(),
            title: "This is second video, with long writen text, that should be automatically cutted",
            date: "10-may-2024",
            url: "ItemMockVideo02"
        ),
        VideoModel(
            id: UUID(),
            title: "This is third video",
            date: "07-april-2024",
            url: "ItemMockVideo03"
        ),
        VideoModel(
            id: UUID(),
            title: "This is fouth video",
            date: "20-march-2024",
            url: "ItemMockVideo04"
        ),
        VideoModel(
            id: UUID(),
            title: "This is fifth video",
            date: "01-august-2024",
            url: "ItemMockVideo01"
        ),
        VideoModel(
            id: UUID(),
            title: "This is six photo",
            date: "23-february-2024",
            url: "ItemMockVideo02"
        ),
        VideoModel(
            id: UUID(),
            title: "This is seventh video",
            date: "21-january-2024",
            url: "ItemMockVideo03"
        ),
        VideoModel(
            id: UUID(),
            title: "This is eight video",
            date: "08-june-2024",
            url: "ItemMockVideo04"
        )
    ]
}
