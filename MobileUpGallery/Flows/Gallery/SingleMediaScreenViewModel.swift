//
//  SinglePhotoScreenViewModel.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import XCoordinator
import Kingfisher

final class SingleMediaScreenViewModel: ObservableObject {

    @Published var isShowingShareSheet = false

    private let router: UnownedRouter<AppRoute>

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }

    func pop() {
        router.trigger(.pop)
    }

    func getImage(from urlString: String?) -> UIImage {
        var img = UIImage()
        if let urlString = urlString,
           let url = URL(string: urlString) {
            KingfisherManager.shared.retrieveImage(with: url) { result in
                switch result {
                case .success(let image):
                    img = image.image
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        return img
    }
}
