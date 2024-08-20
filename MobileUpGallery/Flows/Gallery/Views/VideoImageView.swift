//
//  VideoImageView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import Kingfisher

struct VideoImageView: View {
    let video: VideoModel?

    var body: some View {
        ZStack {
            Group {
                if let imageURL = video?.thrumb,
                    let url = URL(string: imageURL) {
                    KFImage(url)
                        .placeholder{
                                ProgressView()
                            }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Image(systemName: "nosign")
                }
            }
            Text(video?.title ?? "")
                .padding(.horizontal, DSConstants.fouthSpacing)
                .padding(.vertical, DSConstants.defaultSpacing)
                .foregroundColor(.black)
                .background(Color(uiColor: UIColor.white.withAlphaComponent(0.5)))
                .cornerRadius(DSConstants.defaultCornerRadius)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(DSConstants.fouthSpacing)
                .lineLimit(2)
        }
    }
}

#Preview {
    VideoImageView(video: Mocks.videos[0])
}
