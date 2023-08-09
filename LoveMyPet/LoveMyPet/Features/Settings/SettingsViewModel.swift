import SwiftUI

enum Theme: Int, CaseIterable {
    case system = 0
    case light = 1
    case dark = 2
}

class SettingsViewModel: ObservableObject {
    @AppStorage("App theme") var currentTheme: Theme = .system
    @Published var selectedButton: Int = 0
    func setTheme(_ theme: Theme) {
        currentTheme = theme
        selectedButton = theme.rawValue
    }
}

func getPreferredColorSheme(for theme: Theme) -> ColorScheme {
    switch theme {
    case .system:
        return .light
    case .light:
        return .light
    case .dark:
        return .dark
    }
}
