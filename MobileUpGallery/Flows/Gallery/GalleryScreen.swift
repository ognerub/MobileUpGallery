//
//  GalleryScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct GalleryScreen: View {

    @StateObject var viewModel = GalleryScreenViewModel()

    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns, spacing: DSConstants.gridSpacing) {
                ForEach(viewModel.photos) { photo in
                    Color.clear
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(
                            PhotoImageView(imageName: photo.url)
                        )
                        .clipShape(Rectangle())
                }
            }
        }
    }
}

#Preview {
    GalleryScreen()
}
