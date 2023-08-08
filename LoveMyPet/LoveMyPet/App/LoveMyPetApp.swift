//
//  LoveMyPetApp.swift
//  LoveMyPet
//
//  Created by userext on 05/07/23.
//

import SwiftUI
@main
struct LoveMyPetApp: App {
    @StateObject private var settingsviewmodel = SettingsViewModel()
    @State var selectedTab: Tab = .pets
    var body: some Scene {
        WindowGroup {
            TabBarView(selectedTab: $selectedTab) {
                SettingsView()
            } profilesView: {
                EditPetView(selectedData: .now, namePet: "Lua")
            }
                .environmentObject(settingsviewmodel)
        }
    }
}
