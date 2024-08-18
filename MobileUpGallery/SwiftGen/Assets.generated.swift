// 🤖 This file was code-generated. Do not edit!!!

import UIKit

// MARK: - Images
public extension UIImage {
}

// MARK: - Colors
public extension UIColor {
  static let accentColor: UIColor = UIColor(named: "AccentColor") ?? UIColor()
}

// MARK: - Strings
import Foundation

public enum L10n {
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
