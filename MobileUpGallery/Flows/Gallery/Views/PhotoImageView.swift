//
//  PhotoImageView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct PhotoImageView: View {

    let imageName: String

    var body: some View {
        Image(uiImage: UIImage(named: imageName) ?? UIImage())
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    PhotoImageView(imageName: "ItemMockImage01")
}
