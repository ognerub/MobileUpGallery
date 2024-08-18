//
//  AppCoordinator.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.

import SwiftUI
import XCoordinator

enum AppRoute: Route {
    case launch
    case login
    case gallery
    case photo(String)
}

final class AppCoordinator: NavigationCoordinator<AppRoute> {

    private var window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
        super.init(initialRoute: .launch)
        updateLauchInstructions()
    }

    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .launch:
            guard let window = window else { return .set([])}
            setRoot(for: window)
            return .set([buildLaunchScreen()])
        case .login:
            return .set([buildLoginScreen()])
        case .gallery:
            return .set([buildGalleryScreen()])
        case .photo(let imageName):
            return .push(buildPhotoScreen(imageName: imageName))
        }
    }

    // MARK: - Build Screens

    private func buildLaunchScreen() -> UIViewController {
        let rootView = LaunchScreen()
        let vc = UIHostingController(rootView: rootView)
        return vc
    }

    private func buildLoginScreen() -> UIViewController {
        let rootView = LoginScreen(viewModel: LoginScreenViewModel(router: unownedRouter))
        let vc = UIHostingController(rootView: rootView)
        return vc
    }

    private func updateLauchInstructions() {
        trigger(.login)
    }

    private func buildGalleryScreen() -> UIViewController {
        let viewModel = GalleryScreenViewModel(router: unownedRouter)
        let rootView = GalleryScreen(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }

    private func buildPhotoScreen(imageName: String) -> UIViewController {
        let rootView = SinglePhotoScreen(imageName: imageName)
        return UIHostingController(rootView: rootView)
    }

}
