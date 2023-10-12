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
    @Binding var selectedGender: String
    @Binding var petName: String
    @Binding var selectedData: Date
    @Binding var pEnum: Species
    @Binding var pBreed: String
    let animalOptions = ["Não escolhida", "Cachorro", "Gato", "Pássaro", "Peixe"]
    let genderOptions = ["Nenhum", "Macho", "Fêmea"]
    let raceOptions = ["Não escolhida", "Golden Retriever", "Salsicha", "Goldfish"]
    struct StringIdentifiable: Identifiable {
        let id: String
        let string: String
    }
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
                Picker("Espécie", selection: $pEnum) {
                    ForEach(Species.allCases) {option in
                        Text(String(describing: option.rawValue))
                    }
                }
                .pickerStyle(DefaultPickerStyle())
                .listRowBackground(Color("forms_colors"))
                Picker("Raça", selection: $pBreed) {
                    ForEach(pEnum.breed.map { StringIdentifiable(id: $0, string: $0) }) {breed in
                        Text(breed.string)
                    }
                }
                .pickerStyle(.navigationLink)
                .listRowBackground(Color("forms_colors"))
                DatePicker("Nascimento:", selection: $selectedData, in: ...Date(), displayedComponents: .date)
                    .environment(\.locale, Locale.init(identifier: "pt"))
                    .listRowBackground(Color("forms_colors"))
            }
        }
    }
}
