//
//  GalleryScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct GalleryScreen: View {
    @ObservedObject var viewModel: GalleryScreenViewModel

    var body: some View {
        NavigationView {
            VStack {
                PickerView(selection: $viewModel.page)
                    .padding(.horizontal, DSConstants.defaultPadding)
                TabView(selection: $viewModel.page,
                        content:  {
                    ImagesGridView(viewModel: viewModel).tag(GalleryPage.photo)
                    VideosListView(viewModel: viewModel).tag(GalleryPage.video)
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .navigationBarItems(
                trailing: NavigationBarButtonView(
                    action: {
                        viewModel.logout()
                    },
                    type: .logout)
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { ToolbarItem(placement: .principal) {
                Text(Localization.GalleryScreen.NavigationBar.title)
                .font(Font.system(size: DSConstants.navTitleTextSize, weight: .semibold)) }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    GalleryScreen(viewModel: GalleryScreenViewModel(router: .previewMock(), photosService: PhotosService(), videoService: VideoService()))
}
