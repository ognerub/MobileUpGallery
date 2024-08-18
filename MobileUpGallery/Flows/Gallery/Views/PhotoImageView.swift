//
//  PhotoImageView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct PhotoImageView: View {
    let imageURL: String?

    var body: some View {
        Image(uiImage: UIImage(named: imageURL ?? "") ?? UIImage())
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    PhotoImageView(imageURL: "ItemMockImage01")
}
