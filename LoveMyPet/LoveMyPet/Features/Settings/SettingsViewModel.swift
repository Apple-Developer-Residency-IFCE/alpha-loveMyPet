import SwiftUI

enum Theme: Int, CaseIterable {
    case system
    case light
    case dark
}

class SettingsViewModel: ObservableObject {
    @AppStorage("App theme") var currentTheme: Theme = .system
    func setTheme(_ theme: Theme) {
        currentTheme = theme
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
