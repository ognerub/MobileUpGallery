//
//  LoginScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import XCoordinator

final class LoginScreenViewModel: ObservableObject {

    @Published var isWebViewPresented: Bool = false

    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }

    func pushToGalleryScreen() {
        router.trigger(.gallery)
    }

    func createWebViewUrl() -> URL? {
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
