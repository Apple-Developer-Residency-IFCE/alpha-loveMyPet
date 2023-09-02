//
//  EditPetView.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct EditPetView: View {
    @EnvironmentObject private var vm: PetViewModel

    @State private var selectedAnimal = ""
    @State private var selectedGender = ""
    @State private var selectedRace = ""
    @State  var selectedData: Date
    @State private var selectedCastrated = ""
    @State var isView: Bool = false
    @State var namePet: String
    @State private var showingAlert: Bool = false
    //TODO: criar variáveis estáticas
    let castratedOptions = ["Sim", "Não"]
    let animalOptions = ["Não escolhida", "Cachorro", "Gato", "Pássaro", "Peixe"]
    let genderOptions = ["Nenhum", "Macho", "Fêmea"]
    let raceOptions = ["Não escolhida", "Golden Retriever", "Salsicha", "Goldfish"]
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ImagePicker(text: "Trocar foto")
                //                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                List {
                    Section {
                        Text(namePet)
                            .foregroundColor(.gray)
                            .listRowBackground(Color("forms_colors"))
                        PetPicker(title: "Gênero",
                                  options: genderOptions,
                                  selectedItem: $vm.gender,
                                  pickerStyle: DefaultPickerStyle())
                        .listRowBackground(Color("forms_colors"))
                        PetPicker(title: "Espécie",
                                  options: animalOptions,
                                  selectedItem: $vm.species,
                                  pickerStyle: DefaultPickerStyle())
                        .listRowBackground(Color("forms_colors"))
                        PetPicker(title: "Raça",
                                  options: raceOptions,
                                  selectedItem: $vm.race,
                                  pickerStyle: .navigationLink)
                        .listRowBackground(Color("forms_colors"))
                        DatePicker("Nascimento:",
                                   selection: $vm.date,
                                   in: ...Date(),
                                   displayedComponents: .date)
                        .listRowBackground(Color("forms_colors"))
                    }
                    Section {
                        PickerKG(weight: $vm.weight,isView: $isView,quilo: $vm.quilo,grama: $vm.gram)
                            .listRowBackground(Color("forms_colors"))
                        CastratedPickerView(castratedOptions: $vm.castrated)
                        .listRowBackground(Color("forms_colors"))
                    }
                }
                .frame(height: 450)
                .scrollContentBackground(.hidden)
                RoundedRectangle(cornerRadius: 7)
                    .frame(maxWidth: 320, maxHeight: 50)
                    .overlay {
                        Text("Excluir cadastro")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .foregroundColor(.red)
                    .onTapGesture {
                        showingAlert = true
                    }.alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Deseja excluir o cadastro?"),
                            message: Text("Uma vez excluída, essa ação não pode ser desfeita."),
                            primaryButton: .destructive(
                                Text("Excluir")
                                    .foregroundColor(.red),
                                action: {}
                            )
                            ,
                            secondaryButton: .cancel(Text("Cancelar")) {}
                        )
                    }
                Spacer()
            }
            .background(Color("backgroud_color"))
        }
    }
}

struct EditPetView_Previews: PreviewProvider {
    static var previews: some View {
        EditPetView(selectedData: Date.now, namePet: "Lua")
            .environmentObject(PetViewModel(stack: .shared))
    }
}
