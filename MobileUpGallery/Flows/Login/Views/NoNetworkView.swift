//
//  NoNetworkView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 21.08.2024.
//

import SwiftUI

enum NetworkErrorType {
    case noInternet
    case serverError
}

struct NoNetworkView: View {

    let action: (() -> Void)?
    let errorType: NetworkErrorType

    var body: some View {
        ZStack {
            VStack{
                Image(uiImage: getImage())
                Text(getTitle())
                    .font(Font.system(size: DSConstants.titleText, weight: .bold))
                    .foregroundColor(Color(uiColor: .blackPrimary))
                    .padding(DSConstants.defaultPadding)
            }
            CloseButtonView(action: action)
        }

    }

    private func getTitle() -> String {
        switch errorType {
        case .noInternet:
            return "No internet"
        case .serverError:
            return "Server error"
        }
    }

    private func getImage() -> UIImage {
        switch errorType {
        case .noInternet:
            return UIImage.noInternet
        case .serverError:
            return UIImage.serverError
        }
    }
}

#Preview {
    NoNetworkView(action: nil, errorType: .serverError)
}
