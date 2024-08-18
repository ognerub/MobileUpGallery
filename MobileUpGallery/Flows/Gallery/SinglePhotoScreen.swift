//
//  SinglePhotoScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct SinglePhotoScreen: View {

    let imageName: String

    var body: some View {
        Color.clear
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                PhotoImageView(imageName: imageName)
                    .cornerRadius(10)
            )
            .clipShape(Rectangle())
            .ignoresSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SinglePhotoScreen(imageName: "ItemMockImage01")
}
