//
//  GalleryScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import XCoordinator

final class GalleryScreenViewModel: ObservableObject {

    let columns = [
        GridItem(.flexible(), spacing: DSConstants.gridSpacing, alignment: .center),
        GridItem(.flexible(), spacing: DSConstants.gridSpacing, alignment: .center)
    ]

    @Published var photos: [PhotoModel] = Mocks.photos

    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }

    func pushToSinglePhotoScreen(imageName: String) {
        router.trigger(.photo(imageName))
    }
}
