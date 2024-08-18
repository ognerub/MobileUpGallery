//
//  NavigationBarBackButtonView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct NavigationBarBackButtonView: View {

    var action: () -> Void = { }
    var isVisible: Bool

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Spacer()
            Image(.backArrow)
                .tint(Color(.blackPrimary))
                    .opacity(isVisible ? 1 : 0)
        })
        .frame(width: 24, height: 24, alignment: .center)
    }

}

#Preview {
    NavigationBarBackButtonView(isVisible: true)
}
