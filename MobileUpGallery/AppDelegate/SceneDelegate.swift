//
//  SceneDelegate.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import UIKit
import VKSdkFramework
import VKID

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { fatalError("No one window scene exists") }
        window = UIWindow(windowScene: windowScene)
        appCoordinator = AppCoordinator(window: window)
    }

//    func scene(
//        _ scene: UIScene,
//        openURLContexts URLContexts: Set<UIOpenURLContext>
//    ) {
//        URLContexts.forEach { ctx in
//            VKIDManager().vkid?.open(url: ctx.url)
//        }
//    }

//    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//            guard let url = URLContexts.first?.url else { return }
//            if VKSdk.processOpen(url, fromApplication: nil) {
//                //print("Current URL: \(url.absoluteString)")
//                if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems {
//                    for item in queryItems {
//                        if item.name == "code" {
//                            let authorizationCode = item.value
//                            print("Authorization Code: \(authorizationCode ?? "")")
//                        }
//                    }
//                }
//            }
//        }
}
