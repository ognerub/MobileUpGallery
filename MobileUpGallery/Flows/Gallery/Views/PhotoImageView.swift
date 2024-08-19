//
//  PhotoImageView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import Kingfisher

struct PhotoImageView: View {
    let imageURL: String?

    var body: some View {
        Group {
            if let imageURL = imageURL,
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
//        Image(uiImage: UIImage(named: imageURL ?? "") ?? UIImage())
//            .resizable()
//            .scaledToFill()
    }
}

#Preview {
    PhotoImageView(imageURL: "https://sun9-69.userapi.com/s/v1/ig2/_o38r35Oz6TsHE4QuAEHd3OYJQMBVbBxtNxMturbjwjOBto6jWCoVjtA6JD1mR6mAQtyQ4RCixg_2WB6pLYxZ1DX.jpg?quality=95&as=32x21,48x32,72x48,108x72,160x107,240x160,360x240,480x320,540x360,640x427,720x480,1080x720,1280x853,1440x960,2560x1707&from=bu&cs=75x50")
}
