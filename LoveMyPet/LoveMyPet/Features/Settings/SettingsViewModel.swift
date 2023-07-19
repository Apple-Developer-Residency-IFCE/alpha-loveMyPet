//
//  SettingsViewModel.swift
//  LoveMyPet
//
//  Created by userext on 06/07/23.
//

import Foundation
import SwiftUI

enum Appearence: Int {
    static var identifier: String = "Appearence"

    case system = 0
    case light = 1
    case dark = 2
}

class SettingsViewModel: ObservableObject {
    static var shared:SettingsViewModel = SettingsViewModel()
    
    @AppStorage(Appearence.identifier) private var theme: Int = 0

    func setTheme(_ theme: Appearence) {
        self.theme = theme.rawValue
    }

    func getTheme() -> Appearence {
        guard let currentAppearence = Appearence(rawValue: theme)
        else {
            return Appearence.system
        }

        return currentAppearence
    }

}
