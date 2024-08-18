//
//  LoginScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import XCoordinator

final class LoginScreenViewModel: ObservableObject {

    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }

    func pushToGalleryScreen() {
        router.trigger(.gallery)
    }

}
