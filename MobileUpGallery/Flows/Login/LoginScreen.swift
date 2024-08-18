//
//  LoginScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct LoginScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: LoginScreenViewModel

    var body: some View {
        titleText
        loginButton
    }

    var titleText: some View {
        Text(Localization.LoginScreen.titleText)
            .font(Font.system(size: DSConstants.titleTextSize, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.blackPrimary)
            .padding(.horizontal, DSConstants.titleTextPadding)
            .frame(maxHeight: .infinity, alignment: .center)
    }

    var loginButton: some View {
        Button(action: {
            viewModel.pushToGalleryScreen()
        }, label: {
            Text(Localization.LoginScreen.loginButtonText)
                .font(Font.system(size: DSConstants.buttonTextSize, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: 52)
                .foregroundColor(.whitePrimary)
                .background(.blackPrimary)
                .clipShape(.rect(cornerRadius: DSConstants.defaultCornerRadius))
        })
        .padding(.horizontal, DSConstants.defaultPadding)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    LoginScreen(viewModel: LoginScreenViewModel(router: .previewMock()))
}
