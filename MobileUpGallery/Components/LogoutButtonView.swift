//
//  LogoutButtonView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct LogoutButtonView: View {

    var action: () -> Void = { }
    var isVisible: Bool

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(Localization.GalleryScreen.NavigationBar.exit)
                .foregroundColor(.blackPrimary)
        })
        .frame(alignment: .center)
    }

}

#Preview {
    LogoutButtonView(isVisible: true)
}

