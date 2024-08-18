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
        PickerView(selection: $viewModel.page)
            .padding(.horizontal, DSConstants.defaultPadding)
        TabView(selection: $viewModel.page,
                content:  {
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
            }.tag(GalleryPage.photo)
            ScrollView {
                LazyVStack(spacing: DSConstants.defaultSpacing) {
                    ForEach(viewModel.photos) { photo in
                        ZStack {
                            PhotoImageView(imageName: photo.url)
                            Text(photo.title)
                                .padding(.horizontal, DSConstants.fouthSpacing)
                                .padding(.vertical, DSConstants.defaultSpacing)
                                .background(Color(uiColor: UIColor.white.withAlphaComponent(0.5)))
                                .cornerRadius(DSConstants.defaultCornerRadius)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding(DSConstants.fouthSpacing)
                                .lineLimit(2)
                        }
                    }
                }
            }.tag(GalleryPage.video)
        })
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    GalleryScreen(viewModel: GalleryScreenViewModel(router: .previewMock()))
}
