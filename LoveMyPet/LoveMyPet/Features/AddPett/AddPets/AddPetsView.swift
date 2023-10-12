import SwiftUI

struct AddPetsView: View {
    @State var isView: Bool = false
    @State private var selectedCastrated = ""
    @State private var petname = ""
    @EnvironmentObject private var vmAdd: PetViewModel
    var body: some View {
        VStack {
            Spacer(minLength: 25)
            ImagePicker(text: "Escolher foto", imageData: $vmAdd.imageData)
            PetPickerView(
                selectedGender: $vmAdd.gender,
                petName: $vmAdd.name,
                selectedData: $vmAdd.date,
                pEnum: $vmAdd.species,
                pBreed: $vmAdd.race
            )
            List {
                PickerKG(weight: $vmAdd.weight, isView: $isView, quilo: $vmAdd.quilo, grama: $vmAdd.gram )
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
                .environmentObject(PetViewModel(stack: .shared, imageFileManager: .init()))
        }
    }
}
