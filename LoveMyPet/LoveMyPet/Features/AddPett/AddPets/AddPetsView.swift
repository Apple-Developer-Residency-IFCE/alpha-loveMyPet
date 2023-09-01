import SwiftUI

struct AddPetsView: View {
    @State var isView: Bool = false
    @State private var selectedCastrated = ""
    @State private var petname = ""
    @StateObject var vmAdd = PetViewModel(stack: PetProvider())
    let castratedOptions = ["Sim", "Não"]
    var body: some View {
        VStack {
            Spacer(minLength: 25)
            ImagePicker(text: "Escolher foto")
                PetPickerView(selectedAnimal: $vmAdd.species,
                           selectedGender: $vmAdd.gender,
                           selectedRace: $vmAdd.race,
                           petName: $vmAdd.name,
                           selectedData: $vmAdd.date)
            List {
                PickerKG(weight: $vmAdd.weight, isView: $isView)
                    .listRowBackground(Color("forms_colors"))
                    .padding(.bottom, -20)
                CastratedPickerView(castratedOptions: $vmAdd.castrated)
                .listRowBackground(Color("forms_colors"))
            }
            .padding(.top, -30)
        }
        .background(Color("backgroud_color"))
        .background(.clear)
        .scrollContentBackground(.hidden)
    }
}

struct PetsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddPetsView()
        }
    }
}
