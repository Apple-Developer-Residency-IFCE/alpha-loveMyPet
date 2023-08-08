//
//  SheetsPetView.swift
//  LoveMyPet
//
//  Created by userext on 08/08/23.
//

import SwiftUI

struct SheetPetView: View {
    @State var showSheet: Bool = false
    var body: some View {
        Button("Adicionar") {
            showSheet = true
        }
        .foregroundColor(Color("cancel_button"))
        .bold()
        .sheet(isPresented: $showSheet) {
            NavigationStack {
                VStack(spacing: -15) {
                    Rectangle()
                        .padding(.top, 100)
                        .background(Color("forms_colors"))
                        .frame(height: 80)
                        .padding(.top, -79)
                        .overlay(
                            HStack(spacing: 50) {
                                Button("Cancelar") {
                                    showSheet = false
                                }
                                .foregroundColor(Color("cancel_button"))
                                Text("Adicionar Pet")
                                    .bold()
                                Button("Adicionar") {
                                    showSheet = false
                                }
                                .bold()
                                .foregroundColor(Color("cancel_button"))
                            }
                                .padding(.top, -30))
                        .frame(height: 100)
                    Rectangle()
                        .frame(width: 400, height: 0.5)
                        .foregroundColor(.gray)
                        .padding(.top, -30)
                    Divider()
                        .foregroundColor(Color("backgroud_color"))
                    EditPetView(selectedData: .now, namePet: "Lua")
                }
            }
        }
    }
}
    struct SheetPetView_Previews: PreviewProvider {
        static var previews: some View {
            SheetPetView()
        }
    }

