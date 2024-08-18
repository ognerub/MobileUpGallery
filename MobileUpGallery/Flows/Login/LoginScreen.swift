//
//  LoginScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI

struct LoginScreen: View {

    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = LoginScreenViewModel()

    var body: some View {
        titleText
        loginButton
    }

    var titleText: some View {
        Text(Localization.LoginScreen.titleText)
            .font(Font.system(size: DSConstants.titleTextSize, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(colorScemeColor(.black))
            .padding(.horizontal, DSConstants.titleTextPadding)
            .frame(maxHeight: .infinity, alignment: .center)
    }

    var loginButton: some View {
        Button(action: {
            // TODO: - press to login
        }, label: {
            Text(Localization.LoginScreen.loginButtonText)
                .font(Font.system(size: DSConstants.buttonTextSize, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: 52)
                .foregroundColor(colorScemeColor(.white))
                .background(colorScemeColor(.black))
                .clipShape(.rect(cornerRadius: DSConstants.buttonCornerRadius))
        })
        .padding(.horizontal, DSConstants.buttonPadding)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

private extension LoginScreen {
    func colorScemeColor(_ value: Color) -> Color {
        let currentColor = value
        if currentColor == Color.black {
            return colorScheme == .dark ? Color.white: currentColor
        } else if currentColor == Color.white {
            return colorScheme == .dark ? Color.black: currentColor
        } else {
            return currentColor
        }
    }
}

#Preview {
    LoginScreen()
}
