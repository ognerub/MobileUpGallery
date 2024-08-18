//
//  LaunchScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct LaunchScreen: View {

    var body: some View {
        ZStack {
            Color.black
            Color.clear
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    PhotoImageView(imageURL: "ItemMockImage01")
                        .cornerRadius(10)
                )
                .clipShape(Rectangle())
                .padding(DSConstants.doublePadding)
        }
        .ignoresSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LaunchScreen()
}
