//
//  SingleVideoScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct SingleVideoScreen: View {

    let video: VideoModel

    var body: some View {
        VideoImageView(video: video)
    }
}

#Preview {
    SingleVideoScreen(video: Mocks.videos[0])
}
