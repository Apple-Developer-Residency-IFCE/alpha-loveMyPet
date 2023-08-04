//  ProfilesView.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct ProfilesView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
        }
        .navigationTitle("Pets")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NavigationLink(destination: SecondView()) {
                    Text("Adcionar")
                }
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        Text("Esta é a segunda página!")
    }
}

struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfilesView()
                .onAppear {
                }
        }
    }
}
