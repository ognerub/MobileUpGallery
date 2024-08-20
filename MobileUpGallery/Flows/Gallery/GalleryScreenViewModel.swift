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
    private let videoService: VideoServiceProtocol
    private let storage = OAuthTokenStorage.shared

    init(
        router: UnownedRouter<AppRoute>,
        photosService: PhotosServiceProtocol,
        videoService: VideoServiceProtocol
    ) {
        self.router = router
        self.photosService = photosService
        self.videoService = videoService
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
            let thrumb: String? = item.sizes.count > 0 ? item.sizes[0].url : nil
            let photo = PhotoModel(
                id: UUID(),
                title: item.text,
                date: String(item.date),
                url: item.origPhoto.url,
                thrumb: thrumb
            )
            photos.append(photo)
        }
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.photos = photos
        }
    }

    func getVideos() {
        guard let response = videoService.getVideosFrom("VideoMock") else { return }
        let items = response.response.items
        var videos = [VideoModel]()
        items.forEach { item in
            let thrumb: String? = item.image.count > 0 ? item.image[0].url : nil
            let video = VideoModel(
                id: UUID(),
                title: item.title,
                date: String(item.date),
                url: item.player,
                thrumb: thrumb
            )
            videos.append(video)
        }
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.videos = videos
        }
    }
}
