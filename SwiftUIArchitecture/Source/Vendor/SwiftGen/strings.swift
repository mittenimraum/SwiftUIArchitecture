// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
    /// Add %@ to burr
    internal static func activityHashtagAdd(_ p1: String) -> String {
        return L10n.tr("Localizable", "activity-hashtag-add", p1)
    }

    /// Open in Safari
    internal static let activitySafariOpen = L10n.tr("Localizable", "activity-safari-open")
    /// Nothing found.
    internal static let errorFeedNoData = L10n.tr("Localizable", "error-feed-no-data")
    /// burr uses the Standard Twitter API which has a request limit of 450 calls per every 15 minutes.\nUnfortunately the limit has been exceeded right now, please wait a couple of minutes until the limit has been reset.
    internal static let errorRateLimitExceeded = L10n.tr("Localizable", "error-rate-limit-exceeded")
    /// An unknown error occured
    internal static let errorUnknown = L10n.tr("Localizable", "error-unknown")
    /// Cancel
    internal static let generalCancel = L10n.tr("Localizable", "general-cancel")
    /// Do you want to remove %@?
    internal static func generalDeleteText(_ p1: String) -> String {
        return L10n.tr("Localizable", "general-delete-text", p1)
    }

    /// No
    internal static let generalNo = L10n.tr("Localizable", "general-no")
    /// Yes
    internal static let generalYes = L10n.tr("Localizable", "general-yes")
    /// ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_
    internal static let onboardingAddHashtagInputCharacters = L10n.tr("Localizable", "onboarding-add-hashtag-input-characters")
    /// The hashtag has been already added 🐒
    internal static let onboardingAddHashtagInputDuplicate = L10n.tr("Localizable", "onboarding-add-hashtag-input-duplicate")
    /// swiftui
    internal static let onboardingAddHashtagInputPlaceholder = L10n.tr("Localizable", "onboarding-add-hashtag-input-placeholder")
    /// Which Twitter hashtag do you want to observe?
    internal static let onboardingAddHashtagTitle = L10n.tr("Localizable", "onboarding-add-hashtag-title")
    /// Twitter
    internal static let onboardingAddHashtagTitleHighlighted = L10n.tr("Localizable", "onboarding-add-hashtag-title-highlighted")
}

// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        // swiftlint:disable:next nslocalizedstring_key
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {}
