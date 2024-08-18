//
//  AppCoordinator.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.

import SwiftUI
import XCoordinator

enum AppRoute: Route {
    case launch
}

final class AppCoordinator: NavigationCoordinator<AppRoute> {

    private var window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
        super.init(initialRoute: .launch)
    }

    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .launch:
            guard let window = window else { return .set([])}
            setRoot(for: window)
            return .set([buildLaunchScreen()])
        }
    }

    // MARK: - Build Screens
    private func buildLaunchScreen() -> UIViewController {
        let rootView = ContentView()
        let vc = UIHostingController(rootView: rootView)
        return vc
    }
}
