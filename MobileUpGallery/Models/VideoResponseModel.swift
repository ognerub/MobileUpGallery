//
//  VideoResponseModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 20.08.2024.
//

import Foundation

struct VideoResponseModel: Codable {
    let response: VideoResponseData
}

struct VideoResponseData: Codable {
    let count: Int
    let items: [VideoItem]
}

struct VideoItem: Codable {
    let addingDate: Int
    let canComment: Int
    let canLike: Int
    let canRepost: Int
    let canSubscribe: Int
    let canAddToFaves: Int
    let canAdd: Int
    let comments: Int
    let date: Int
    let description: String
    let duration: Int
    let image: [VideoImage]
    let firstFrame: [VideoImage]
    let width: Int
    let height: Int
    let id: Int
    let ownerId: Int
    let ovId: String
    let title: String
    let isFavorite: Bool
    let player: String
    let added: Int
    let repeatCount: Int?
    let type: String
    let views: Int
    let likes: Likes
    let reposts: Reposts
}

struct VideoImage: Codable {
    let url: String
    let width: Int
    let height: Int
    let withPadding: Int?
}

struct Likes: Codable {
    let count: Int
    let userLikes: Int
}

struct Reposts: Codable {
    let count: Int
    let userReposted: Int
}

