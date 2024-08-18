//
//  SinglePhotoScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct SingleMediaScreen: View {

    @ObservedObject var viewModel: SingleMediaScreenViewModel
    let photo: PhotoModel?
    let video: VideoModel?

    init(viewModel: SingleMediaScreenViewModel, photo: PhotoModel? = nil, video: VideoModel? = nil) {
        self.viewModel = viewModel
        self.photo = photo
        self.video = video
    }

    var body: some View {
        NavigationView {
            VStack {
                if photo != nil {
                    Color.clear
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(
                            PhotoImageView(imageURL: photo?.url)
                                .cornerRadius(10)
                        )
                        .clipShape(Rectangle())
                        .ignoresSafeArea(.all)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    VideoImageView(video: video)
                }
            }
            .navigationBarItems(
                leading: NavigationBarButtonView(
                    action: {
                        viewModel.pop()
                    },
                    type: .backArrow)
            )
            .navigationBarItems(
                trailing: NavigationBarButtonView(
                    action: {
                        print("share")
                    },
                    type: .share)
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
    SingleMediaScreen(viewModel: SingleMediaScreenViewModel(router: .previewMock()), photo: Mocks.photos[0])
}
