// 🤖 This file was code-generated. Do not edit!!!

import UIKit
// No assets found

// MARK: - Strings
import Foundation

public enum Localization {

    public enum GalleryScreen {

        public enum NavigationBar {
            /// Exit
            public static let exit = localize("galleryScreen.navigationBar.exit")
            /// MobileUp
            public static let title = localize("galleryScreen.navigationBar.title")
        }

        public enum PickerTitles {
            /// Photo
            public static let photo = localize("galleryScreen.pickerTitles.photo")
            /// Video
            public static let video = localize("galleryScreen.pickerTitles.video")
        }
    }

    public enum LoginScreen {
        /// Enter using VK
        public static let loginButtonText = localize("loginScreen.loginButtonText")
        /// Mobile Up\nGallery
        public static let titleText = localize("loginScreen.titleText")
    }
}

extension Localization {

    fileprivate static func localize(_ key: String, _ args: CVarArg...) -> String {
        return String(
            format: NSLocalizedString(key, comment: ""),
            locale: Locale.current,
            arguments: args
        )
    }
}
