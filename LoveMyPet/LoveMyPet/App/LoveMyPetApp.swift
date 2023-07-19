//
//  LoveMyPetApp.swift
//  LoveMyPet
//
//  Created by userext on 05/07/23.
//

import SwiftUI

@main
struct LoveMyPetApp: App {
    var mode: SettingsViewModel = SettingsViewModel.shared
    @Environment(\.colorScheme) var colorScheme

    var body: some Scene {
        WindowGroup {
            Group{
                ContentView()
            }
        }
    }
}
