//
//  PhotosService.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 19.08.2024.
//

import Foundation

protocol PhotosServiceProtocol: AnyObject {
    func getPhotos() async throws -> PhotoResponseModel
}

final class PhotosService: PhotosServiceProtocol {

    private let urlSession: URLSession
    private let storage = OAuthTokenStorage.shared

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func getPhotos() async throws -> PhotoResponseModel {
        var responseModel = PhotoResponseModel(response: PhotoResponseData(count: 0, items: []))
        if let url = createPhotosRequestUrl() {
            let request = URLRequest(url: url)
            let (data, _) = try await urlSession.data(for: request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            responseModel = try decoder.decode(PhotoResponseModel.self, from: data)
            return responseModel
        }
        return responseModel
    }

    private func createPhotosRequestUrl() -> URL? {
        var components = URLComponents(string: NetworkConstants.photos_get.description)
        components?.queryItems = [
            URLQueryItem(name: NetworkConstants.owner_id.name, value: NetworkConstants.owner_id.description),
            URLQueryItem(name: NetworkConstants.album_id.name, value: NetworkConstants.album_id.description),
            URLQueryItem(name: NetworkConstants.access_token.name, value: storage.token),
            URLQueryItem(name: NetworkConstants.v.name, value: NetworkConstants.v.description)
        ]
        let url = components?.url
        return url
    }

}
