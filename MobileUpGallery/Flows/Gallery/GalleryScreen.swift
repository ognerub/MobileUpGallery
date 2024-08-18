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
            trailing: LogoutButtonView(
                action: {
                    viewModel.logout()
                },
                isVisible: true)
        )
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { ToolbarItem(placement: .principal) {
            Text(Localization.GalleryScreen.NavigationBar.title)
            .font(Font.system(size: DSConstants.navTitleTextSize, weight: .semibold)) }
        }
    }
}

#Preview {
    GalleryScreen(viewModel: GalleryScreenViewModel(router: .previewMock()))
}

struct ImagesGridView: View {
    @ObservedObject var viewModel: GalleryScreenViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns, spacing: DSConstants.defaultSpacing) {
                ForEach(viewModel.photos) { photo in
                    Button(action: {
                        viewModel.pushToSinglePhotoScreen(imageName: photo.url)
                    }, label: {
                        Color.clear
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(
                                PhotoImageView(imageName: photo.url)
                            )
                            .clipShape(Rectangle())
                    })
                }
            }
        }
    }
}

struct VideosListView: View {
    @ObservedObject var viewModel: GalleryScreenViewModel

    var body: some View {
        ScrollView {
            LazyVStack(spacing: DSConstants.defaultSpacing) {
                ForEach(viewModel.videos) { video in
                    Button(action: {
                        viewModel.pushToSingleVideoScreen(video: video)
                    }, label: {
                        VideoImageView(video: video)
                    })
                }
            }
        }
    }
}
