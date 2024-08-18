//
//  EmptyRouter.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import UIKit
import XCoordinator

final class EmptyRouter<T: Route>: Router {
    var viewController: UIViewController!
    func contextTrigger(_ route: T, with options: TransitionOptions, completion: ContextPresentationHandler?) {}
}
