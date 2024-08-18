//
//  VideoImageView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct VideoImageView: View {
    let video: VideoModel?

    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: video?.url ?? "") ?? UIImage())
                .resizable()
                .scaledToFill()
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
