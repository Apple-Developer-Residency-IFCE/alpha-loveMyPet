//  TabBarView.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI
struct TabBarView<Settings: View, Profiles: View>: View {
    @Binding var selectedTab: Tab
    @ViewBuilder let settingsView: () -> Settings
    @ViewBuilder let profilesView: () -> Profiles
    var body: some View {
        TabView(selection: $selectedTab) {
            profilesView()
                .tabItem {
                    Label {
                        Text(Tab.pets.rawValue)
                            .foregroundColor(.white)
                    } icon: {
                        Image(selectedTab == .pets ? "Icons_selected_pet" : "pets_icon")
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color("TabBar_colors"), for: .tabBar)
                .tag(Tab.pets)
            settingsView()
                .tabItem {
                    Label {
                        Text(Tab.settings.rawValue)
                            .foregroundColor(.white)
                    } icon: {
                        Image(selectedTab == .settings ? "Icons_selected_settings" : "settings_icon")
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color("TabBar_colors"), for: .tabBar)
                .tag(Tab.settings)
        } .accentColor(Color("primary_colors"))
    }
}

enum Tab: String {
    case pets = "Pets"
    case settings = "Configurações"
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView(selectedTab: .constant(.pets),
//                   settingsView: {
//            SettingsView()
//        }, profilesView: {
//            PetsView()
//        })
//        .environmentObject(SettingsViewModel())
//    }
//}
