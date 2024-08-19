//
//  LoginScreen.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import WebKit

struct LoginScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: LoginScreenViewModel

    var body: some View {
        NavigationView {
            VStack {
                titleText
                loginButton
            }
            .sheet(isPresented: $viewModel.isWebViewPresented, content: {
                ZStack {
                    viewModel.webView
                    if viewModel.isWebViewLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .ignoresSafeArea(.all)
                    }
                }
            })
        }
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
            //viewModel.pushToGalleryScreen()
            viewModel.isWebViewPresented = true
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
    LoginScreen(viewModel: LoginScreenViewModel(router: .previewMock(), webView: WebView(url: URL(string: "vk.com"))))
}
