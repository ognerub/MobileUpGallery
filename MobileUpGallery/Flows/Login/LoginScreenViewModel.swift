//
//  LoginScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import XCoordinator

final class LoginScreenViewModel: ObservableObject {

    @Published var webView: WebView = WebView(url: nil)
    @Published var currentUrlString: String = ""
    @Published var isWebViewLoading: Bool = true
    @Published var isWebViewPresented: Bool = false

    private let router: UnownedRouter<AppRoute>
    private let networkService: NetworkServiceProtocol
    private let storage = OAuthTokenStorage.shared

    init(router: UnownedRouter<AppRoute>, networkService: NetworkServiceProtocol) {
        self.router = router
        self.networkService = networkService
        self.webView = WebView(url: createWebViewUrl())
        self.webView.delegate = self
    }

    func pushToGalleryScreen() {
        router.trigger(.gallery)
    }

    func saveOAuthToken(_ token: String) {
        storage.token = token
    }

    func checkOAuthTokenIsEmpty() -> Bool {
        return storage.token == nil
    }

    func getAccessToken(from currentUrlString: String) async throws -> ExchangeAuthorizationCodeResponseModel {
        return try await networkService.getAccessToken(from: currentUrlString)
    }

    private func createWebViewUrl() -> URL? {
        return networkService.createWebViewUrl()
    }
}

extension LoginScreenViewModel: WebViewProtocol {
    func sendCurrentURL(string: String) {
        self.currentUrlString = string
    }

    func sendWebViewStatus(isLoading: Bool) {
        self.isWebViewLoading = isLoading
    }

    func sendWebViewVisibility(isVisible: Bool) {
        self.isWebViewPresented = isVisible
    }
}
