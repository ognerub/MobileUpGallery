//
//  GalleryScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import XCoordinator

enum GalleryPage: Int {
    case photo
    case video
}

final class GalleryScreenViewModel: ObservableObject {

    let columns = [
        GridItem(.flexible(), spacing: DSConstants.defaultSpacing, alignment: .center),
        GridItem(.flexible(), spacing: DSConstants.defaultSpacing, alignment: .center)
    ]

    @Published var photos: [PhotoModel] = Mocks.photos
    @Published var videos: [VideoModel] = Mocks.videos
    @Published var page = GalleryPage.photo

    private let router: UnownedRouter<AppRoute>
    private let photosService: PhotosServiceProtocol
    private let storage = OAuthTokenStorage.shared

    init(router: UnownedRouter<AppRoute>, photosService: PhotosServiceProtocol) {
        self.router = router
        self.photosService = photosService
    }

    func pushToSingleMediaScreen(photo: PhotoModel) {
        router.trigger(.media(photo, nil))
    }

    func pushToSingleMediaScreen(video: VideoModel) {
        router.trigger(.media(nil, video))
    }

    func pop() {
        router.trigger(.pop)
    }

    func logout() {
        storage.clearToken()
        router.trigger(.login)
    }

    func getPhotos() async throws {
        let response = try await photosService.getPhotos()
        let items = response.response.items
        var photos = [PhotoModel]()
        items.forEach { item in
            let photo = PhotoModel(
                id: UUID(),
                title: item.text,
                date: String(item.date),
                url: item.origPhoto.url,
                thrumb: item.sizes[0].url
            )
            photos.append(photo)
        }
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.photos = photos
        }
    }
}
