//
//  EditPetView.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct EditPetView: View {
    @State private var selectedAnimal = ""
    @State private var selectedGender = ""
    @State private var selectedRace = ""
    @State  var selectedData: Date
    @State private var selectedCastrated = ""
    @State var isView: Bool = false
    @State var namePet: String
    let castratedOptions = ["Sim", "Não"]
    let animalOptions = ["Não escolhida", "Cachorro", "Gato", "Pássaro", "Peixe"]
    let genderOptions = ["Nenhum", "Macho", "Fêmea"]
    let raceOptions = ["Não escolhida", "Golden Retriever", "Salsicha", "Goldfish"]
    var body: some View {
            List {
                ImagePicker(text: "Trocar foto")
                    .frame(maxWidth: .infinity, alignment: .center)

                Section {
                    Text(namePet)
                        .foregroundColor(.gray)
                        .listRowBackground(Color("forms_colors"))

                    PetPicker(title: "Gênero",
                              options: genderOptions,
                              selectedItem: $selectedAnimal,
                              pickerStyle: DefaultPickerStyle())
                    .listRowBackground(Color("forms_colors"))

                    PetPicker(title: "Espécie",
                              options: animalOptions,
                              selectedItem: $selectedGender,
                              pickerStyle: DefaultPickerStyle())
                    .listRowBackground(Color("forms_colors"))

                    PetPicker(title: "Raça",
                              options: raceOptions,
                              selectedItem: $selectedRace,
                              pickerStyle: .navigationLink)
                    .listRowBackground(Color("forms_colors"))

                    DatePicker("Nascimento:",
                               selection: $selectedData,
                               in: ...Date(),
                               displayedComponents: .date)
                    .listRowBackground(Color("forms_colors"))
                }

                Section {
                    PickerKG(isView: $isView)
                        .onTapGesture {
                            withAnimation(Animation.easeInOut(duration: 0.5)) {
                                isView.toggle()
                            }
                        }
                        .listRowBackground(Color("forms_colors"))

                    PetPicker(title: "Castrado(a)?",
                              options: castratedOptions,
                              selectedItem: $selectedCastrated,
                              pickerStyle: DefaultPickerStyle())
                    .listRowBackground(Color("forms_colors"))
                }

                RoundedRectangle(cornerRadius: 7)
                    .frame(maxWidth: 320, maxHeight: 50)
                    .overlay {
                        Text("Excluir cadastro")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .foregroundColor(.red)
                    .onTapGesture {
                    }
                Spacer()
            }
            .scrollContentBackground(.hidden)
            .background(Color("background_color"))
    }
}

struct EditPetView_Previews: PreviewProvider {
    static var previews: some View {
        EditPetView(selectedData: Date.now, namePet: "Lua")
    }
}
