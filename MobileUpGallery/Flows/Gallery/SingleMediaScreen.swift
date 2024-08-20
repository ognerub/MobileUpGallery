//
//  SinglePhotoScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import SwiftUIModal

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
                    ZStack {
                        viewModel.webView
                        if viewModel.isWebViewLoading {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .ignoresSafeArea(.all)
                        }
                    }
                }
            }
            .onAppear {
                if let url = URL(string: video?.url ?? "") {
                    viewModel.webView = WebView(url: url)
                }
            }
            .sheet(isPresented: $viewModel.isWebViewPresented, content: {
                viewModel.webView
            })
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
                        viewModel.isShowingShareSheet = true
                    },
                    type: .share)
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { ToolbarItem(placement: .principal) {
                Text(Localization.GalleryScreen.NavigationBar.title)
                .font(Font.system(size: DSConstants.navTitleTextSize, weight: .semibold)) }
            }
            .bottomSheet(isPresented: $viewModel.isShowingShareSheet, content: {
                let image = viewModel.getImage(from: photo?.url)
                if let url = URL(string: photo?.url ?? "") {
                    ShareSheet(items: [image, url])
                }
            })
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SingleMediaScreen(viewModel: SingleMediaScreenViewModel(router: .previewMock()), photo: nil, video: Mocks.videos[0])
}
