//
//  GalleryScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

final class GalleryScreenViewModel: ObservableObject {

    let columns = [
        GridItem(.flexible(), spacing: DSConstants.gridSpacing, alignment: .center),
        GridItem(.flexible(), spacing: DSConstants.gridSpacing, alignment: .center)
    ]

    @Published var photos: [PhotoModel] = Mocks.photos
}
