//
//  NavigationBarBackButtonView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

public enum NavigationBarButtonType {
    case backArrow
    case logout
    case share
}

struct NavigationBarButtonView: View {

    var action: () -> Void = { }
    var type: NavigationBarButtonType

    var body: some View {
        Button(action: {
            action()
        }, label: {
            getButtonIconView(from: type)
        })
    }

    private func getButtonIconView(from type: NavigationBarButtonType) -> some View {
        switch type {
        case .backArrow:
            return AnyView(Image(.backArrow)
                .tint(Color(.blackPrimary)))
        case .logout:
            return AnyView(Text(Localization.GalleryScreen.NavigationBar.exit)
                .foregroundColor(.blackPrimary))
        case .share:
            return AnyView(Image(.shareButton)
                .renderingMode(.template)
                .tint(Color(.blackPrimary)))
        }
    }

}

#Preview {
    NavigationBarButtonView(action: { print("press check")}, type: .backArrow)
}
