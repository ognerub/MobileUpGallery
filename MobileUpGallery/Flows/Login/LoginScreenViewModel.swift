//
//  LoginScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import XCoordinator

final class LoginScreenViewModel: ObservableObject, WebViewProtocol {

    @Published var webView: WebView = WebView(url: nil)
    @Published var currentUrlString: String = ""
    @Published var isWebViewLoading: Bool = true
    @Published var isWebViewPresented: Bool = false

    private let router: UnownedRouter<AppRoute>
    let networkService: NetworkServiceProtocol

    init(router: UnownedRouter<AppRoute>, networkService: NetworkServiceProtocol) {
        self.router = router
        self.networkService = networkService
        self.webView = WebView(url: createWebViewUrl())
        self.webView.delegate = self
    }

    func pushToGalleryScreen() {
        router.trigger(.gallery)
    }

    func sendCurrentURL(string: String) {
        self.currentUrlString = string
    }

    func sendWebViewStatus(isLoading: Bool) {
        self.isWebViewLoading = isLoading
    }

    func sendWebViewVisibility(isVisible: Bool) {
        self.isWebViewPresented = isVisible
    }

    func getAccessToken(from currentUrlString: String) async throws -> ExchangeAuthorizationCodeResponseModel {
        return try await networkService.getAccessToken(from: currentUrlString)
    }

    private func createWebViewUrl() -> URL? {
        return networkService.createWebViewUrl()
    }

}
