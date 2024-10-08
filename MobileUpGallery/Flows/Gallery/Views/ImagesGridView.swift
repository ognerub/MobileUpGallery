//
//  ImagesGridView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct ImagesGridView: View {
    @ObservedObject var viewModel: GalleryScreenViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns, spacing: DSConstants.defaultSpacing) {
                ForEach(viewModel.photos) { photo in
                    Button(action: {
                        viewModel.pushToSingleMediaScreen(photo: photo)
                    }, label: {
                        Color.clear
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(
                                PhotoImageView(imageURL: photo.thrumb)
                            )
                            .clipShape(Rectangle())
                    })
                }
            }
        }
        .task {
            do {
                try await viewModel.getPhotos()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ImagesGridView(viewModel: GalleryScreenViewModel(router: .previewMock(), photosService: PhotosService(), videoService: VideoService()))
}
