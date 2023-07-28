//
//  RadiusButton.swift
//  LoveMyPet
//
//  Created by userext on 24/07/23.
//
import SwiftUI
struct RadiusButton: View {
    var buttonId: Int
    @EnvironmentObject private var themeviewmodel: SettingsViewModel
    @Binding var selectedButton: Int
    var image: String
    var title: String
    let action: () -> Void
    var body: some View {
        VStack {
            Image(image)
            Text(title)
            Button {
                themeviewmodel.currentTheme = Theme(rawValue: buttonId) ?? .system
                action()
            } label: {
                if themeviewmodel.currentTheme.rawValue == buttonId {
                    Image("Icon_select")
                } else {
                    Circle()
                        .stroke(Color("primary_colors"), lineWidth: 2)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.clear)
                }
            }
        }
    }
}
