//
//  LoginScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import UIKit
import XCoordinator
import VKID
import VKSdkFramework

final class LoginScreenViewModel: NSObject, ObservableObject, WebViewProtocol  {

    lazy var oneTapSheet = OneTapBottomSheet(
        serviceName: "Your service name",
        targetActionText: .signIn,
        oneTapButton: .init(
            height: .medium(.h44),
            cornerRadius: 8
        ),
        theme: .matchingColorScheme(.system),
        autoDismissOnSuccess: true
    ) { [weak self] authResult in
        // Обработка результата авторизации.
        do {
            let session = try authResult.get()
            print("Auth succeeded with token: \(session.accessToken)")
            self?.saveOAuthToken(session.accessToken.value)
            print("Current token is \(self?.storage.token)")
            self?.pushToGalleryScreen()
        } catch AuthError.cancelled {
            print("Auth cancelled by user")
        } catch {
            print("Auth failed with error: \(error)")
        }
    }

    let networkService: NetworkServiceProtocol

    @Published var webView: WebView = WebView(url: nil)
    @Published var currentUrlString: String = ""
    @Published var isWebViewLoading: Bool = true
    @Published var isWebViewPresented: Bool = false
    @Published var vkid: VKID?
    @Published var isLoggedIn = false

    private let router: UnownedRouter<AppRoute>
    private let storage = OAuthTokenStorage.shared

    init(router: UnownedRouter<AppRoute>, networkService: NetworkServiceProtocol) {
        self.router = router
        self.networkService = networkService
        super.init()
        self.webView = WebView(url: createWebViewUrl())
        self.webView.delegate = self
//        let sdkInstance = VKSdk.initialize(withAppId: NetworkConstants.client_id.description)
//        sdkInstance?.register(self)
//        sdkInstance?.uiDelegate = self
        vkid = self.initializeVKID()
    }

    func initiateVKLogin() {
        let scope = ["photos", "video"] // Specify your desired permissions
        VKSdk.authorize(scope)
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

    private func initializeVKID() -> VKID? {
        guard let vkid = VKIDManager().vkid else { return nil }
        return vkid
    }

    func presentBottomSheet() {

        guard let sheetViewController = vkid?.ui(for: oneTapSheet).uiViewController() else { return }

        UIApplication.shared.windows.first?.rootViewController?.present(sheetViewController, animated: true) {
            print("bottomSheet presented")
        }


    }

}

extension LoginScreenViewModel: VKSdkDelegate {
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if let token = result.token {
            print("Access Token: \(token.accessToken)")
            isLoggedIn = true
        } else if let error = result.error {
            print("Authorization Error: \(error.localizedDescription)")
        }
    }

    func vkSdkUserAuthorizationFailed() {
        print("User authorization failed")
    }
}

extension LoginScreenViewModel: VKSdkUIDelegate {
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        UIApplication.shared.windows.first?.rootViewController?.present(controller, animated: true, completion: {
            print("opened")
        })
        }

        func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
            print("Captcha required")
        }
}
