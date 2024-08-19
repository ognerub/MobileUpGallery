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
    @Published var currentURL: String = ""
    @Published var isWebViewLoading: Bool = true
    @Published var isWebViewPresented: Bool = false

    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
        self.webView = WebView(url: createWebViewUrl())
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

    func getAccessToken() async throws -> ExchangeAuthorizationCodeResponseModel {
        var responseModel = ExchangeAuthorizationCodeResponseModel(accessToken: "", expiresIn: 0, userId: 0)
        if let url = createExchangeAuthorizationCodeUrl() {
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                responseModel = try decoder.decode(ExchangeAuthorizationCodeResponseModel.self, from: data)
            } catch {
                print(error.localizedDescription)
            }
            return responseModel
        }
        return responseModel
    }

    private func createExchangeAuthorizationCodeUrl() -> URL? {
        var code: String = currentURL
        if let range = code.range(of: "code=") {
            let codeRange = code[range.upperBound...].trimmingCharacters(in: .whitespaces)
            code = codeRange
        }
        var components = URLComponents(string: NetworkConstants.access_token.description)
        components?.queryItems = [
            URLQueryItem(name: NetworkConstants.client_id.name, value: NetworkConstants.client_id.description),
            URLQueryItem(name: NetworkConstants.client_secret.name, value: NetworkConstants.client_secret.description),
            URLQueryItem(name: NetworkConstants.redirect_uri.name, value: NetworkConstants.redirect_uri.description),
            URLQueryItem(name: "code", value: code)
        ]
        let url = components?.url
        return url
    }

    private func createWebViewUrl() -> URL? {
        var components = URLComponents(string: NetworkConstants.authorize_url.description)
        components?.queryItems = [
            URLQueryItem(name: NetworkConstants.client_id.name, value: NetworkConstants.client_id.description),
            URLQueryItem(name: NetworkConstants.display.name, value: NetworkConstants.display.description),
            URLQueryItem(name: NetworkConstants.redirect_uri.name, value: NetworkConstants.redirect_uri.description),
            URLQueryItem(name: NetworkConstants.scope.name, value: NetworkConstants.scope.description),
            URLQueryItem(name: NetworkConstants.response_type.name, value: NetworkConstants.response_type.description),
            URLQueryItem(name: NetworkConstants.v.name, value: NetworkConstants.v.description)
        ]
        let url = components?.url
        return url
    }

}
