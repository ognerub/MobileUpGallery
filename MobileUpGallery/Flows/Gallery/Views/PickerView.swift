//
//  PickerView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct PickerView: View {
    @Binding var selection: GalleryPage

    var body: some View {
        Picker("", selection: $selection) {
            Text(Localization.GalleryScreen.PickerTitles.photo)
                .tag(GalleryPage.photo)
            Text(Localization.GalleryScreen.PickerTitles.video)
                .tag(GalleryPage.video)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

#Preview {
    struct previewStruct: View {
        @State var selection: GalleryPage
        var body: some View {
            PickerView(selection: $selection)
        }
    }
    return previewStruct(selection: .photo)
}
