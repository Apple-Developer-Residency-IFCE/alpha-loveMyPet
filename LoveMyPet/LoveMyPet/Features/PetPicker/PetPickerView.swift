import SwiftUI

struct PetPicker<ComponentStyle: PickerStyle>: View {
    var title: String
    var options: [String]
    @Binding var selectedItem: String
    var pickerStyle: ComponentStyle
    var body: some View {
        VStack {
            HStack {
                Text(title)
                Picker( selection: $selectedItem, label: Text("")) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                    }
                }.listRowBackground(Color.red)
                    .pickerStyle(pickerStyle)
            }
        }
    }
}

struct PetPickerView: View {
    @Binding var selectedAnimal: String
    @Binding var selectedGender: String
    @Binding var selectedRace: String
    @Binding var petName: String
    @Binding var selectedData: Date
    let animalOptions = ["Não escolhida", "Cachorro", "Gato", "Pássaro", "Peixe"]
    let genderOptions = ["Nenhum", "Macho", "Fêmea"]
    let raceOptions = ["Não escolhida", "Golden Retriever", "Salsicha", "Goldfish"]
    var body: some View {
        VStack {
            List {
                TextField("Nome do Pet", text: $petName)
                    .foregroundColor(.gray)
                    .listRowBackground(Color("forms_colors"))
                PetPicker(title: "Gênero",
                          options: genderOptions,
                          selectedItem: $selectedGender,
                          pickerStyle: DefaultPickerStyle())
                .listRowBackground(Color("forms_colors"))
                PetPicker(title: "Espécie",
                          options: animalOptions,
                          selectedItem: $selectedAnimal,
                          pickerStyle: DefaultPickerStyle())
                .listRowBackground(Color("forms_colors"))
                PetPicker(title: "Raça",
                          options: raceOptions,
                          selectedItem: $selectedRace,
                          pickerStyle: .navigationLink)
                .listRowBackground(Color("forms_colors"))
                DatePicker("Nascimento:", selection: $selectedData, in: ...Date(), displayedComponents: .date)
                    .environment(\.locale, Locale.init(identifier: "pt"))
                    .listRowBackground(Color("forms_colors"))
            }
        }
    }
}
