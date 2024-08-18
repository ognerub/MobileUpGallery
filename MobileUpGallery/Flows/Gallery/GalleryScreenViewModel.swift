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
    @Published var page = GalleryPage.video

    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }

    func pushToSinglePhotoScreen(imageName: String) {
        router.trigger(.photo(imageName))
    }

    func pushToSingleVideoScreen(video: VideoModel) {
        router.trigger(.video(video))
    }

    func pop() {
        router.trigger(.pop)
    }

    func logout() {
        router.trigger(.login)
    }
}
