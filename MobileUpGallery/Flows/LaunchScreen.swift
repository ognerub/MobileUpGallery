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
            Color(.black)
            Color.clear
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    PhotoImageView(imageURL: "ItemMockImage01")
                )
                .clipShape(Rectangle())
                .frame(width: 240, height: 240)
        }
        .ignoresSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LaunchScreen()
}
