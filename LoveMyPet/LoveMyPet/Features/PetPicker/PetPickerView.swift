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
    @State private var selectedGenero = ""
    @State private var selectedRaca = ""
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
                             selectedItem: $selectedGenero,
                             pickerStyle: DefaultPickerStyle())
                   PetPicker(title: "Raça",
                             options: raceOptions,
                             selectedItem: $selectedRaca,
                             pickerStyle: DefaultPickerStyle())
            }
        }
    }
}

struct PetPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PetPickerView()
    }
}
