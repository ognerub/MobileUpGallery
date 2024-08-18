//
//  PreviewRoute.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import XCoordinator

extension UnownedRouter {
    static func previewMock<T: Route>() -> UnownedRouter<T> {
        return UnownedRouter(EmptyRouter<T>(), erase: { StrongRouter<T>($0) })
    }
}
