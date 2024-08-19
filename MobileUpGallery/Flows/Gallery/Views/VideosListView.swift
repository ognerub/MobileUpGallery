//
//  VideosListView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct VideosListView: View {
    @ObservedObject var viewModel: GalleryScreenViewModel

    var body: some View {
        ScrollView {
            LazyVStack(spacing: DSConstants.defaultSpacing) {
                ForEach(viewModel.videos) { video in
                    Button(action: {
                        viewModel.pushToSingleMediaScreen(video: video)
                    }, label: {
                        VideoImageView(video: video)
                    })
                }
            }
        }
    }
}

#Preview {
    VideosListView(viewModel: GalleryScreenViewModel(router: .previewMock(), photosService: PhotosService()))
}
