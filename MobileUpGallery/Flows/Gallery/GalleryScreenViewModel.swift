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

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
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
        router.trigger(.login)
    }
}
