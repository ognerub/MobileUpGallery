//
//  LoginScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import XCoordinator

final class LoginScreenViewModel: ObservableObject, WebViewProtocol {

    @Published var webView: WebView
    @Published var currentURL: String = ""
    @Published var isWebViewLoading: Bool = true
    @Published var isWebViewPresented: Bool = false

    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>, webView: WebView) {
        self.router = router
        self.webView = webView
        self.webView.delegate = self
    }

    func pushToGalleryScreen() {
        router.trigger(.gallery)
    }

    func sendCurrentURL(string: String) {
        self.currentURL = string
    }

    func sendWebViewStatus(isLoading: Bool) {
        self.isWebViewLoading = isLoading
    }

    func sendWebViewVisibility(isVisible: Bool) {
        self.isWebViewPresented = isVisible
    }

}
