//
//  CloseButtonView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 21.08.2024.
//

import SwiftUI

struct CloseButtonView: View {

    let action: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                (action ?? { })()
            }, label: {
                Image(uiImage: UIImage(systemName: "xmark") ?? UIImage())
            })
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(20)
            Spacer()
        }
        .opacity(action != nil ? 1 : 0)
    }
}

#Preview {
    CloseButtonView(action: { print("close button pressed") })
}
