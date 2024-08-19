//
//  AppCoordinator.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.

import UIKit
import SwiftUI
import XCoordinator

enum AppRoute: Route {
    case launch
    case login
    case gallery
    case media(PhotoModel?, VideoModel?)
    case pop
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
        case .media(let photo, let video):
            return .push(buildSingleMediaScreen(photo: photo, video: video))
        case .pop:
            return .pop()
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

    private func buildSingleMediaScreen(photo: PhotoModel? = nil, video: VideoModel? = nil) -> UIViewController {
        let viewModel = SingleMediaScreenViewModel(router: unownedRouter)
        let rootView = SingleMediaScreen(viewModel: viewModel, photo: photo, video: video)
        return UIHostingController(rootView: rootView)
    }

}
