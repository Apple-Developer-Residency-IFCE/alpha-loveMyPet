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
                }
                .pickerStyle(pickerStyle)
            }
        }
    }
}

struct PetPickerView: View {
    @State private var selectedAnimal = ""
    @State private var selectedGender = ""
    @State private var selectedRace = ""
    let animalOptions = ["Não escolhida", "Cachorro", "Gato", "Pássaro", "Peixe"]
    let genderOptions = ["Nenhum", "Macho", "Fêmea"]
    let raceOptions = ["Não escolhida", "Golden Retriever", "Salsicha", "Goldfish"]

    var body: some View {
        VStack {
            List {
                   PetPicker(title: "Gênero",
                             options: genderOptions,
                             selectedItem: $selectedAnimal,
                             pickerStyle: DefaultPickerStyle())
                   PetPicker(title: "Espécie",
                             options: animalOptions,
                             selectedItem: $selectedGender,
                             pickerStyle: DefaultPickerStyle())
                   PetPicker(title: "Raça",
                             options: raceOptions,
                             selectedItem: $selectedRace,
                             pickerStyle: .navigationLink)
            }
        }
    }
}

struct PetPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PetPickerView()
        }
    }
}
