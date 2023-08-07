import SwiftUI

struct PetsView: View {
    @State var isView: Bool = false
    @State private var selectedCastrated = ""
    @State private var petname = ""
    let castratedOptions = ["Sim", "Não"]
    var body: some View {
        VStack {
            Spacer(minLength: 25)
            ImagePicker(text: "Escolher foto")
            PetPickerView(selectedData: Date.now)
                List {
                    PickerKG(isView: $isView)
                        .listRowBackground(Color("forms_colors"))
                        .padding(.bottom, -20)
                    PetPicker(title: "Castrado(a)?",
                              options: castratedOptions,
                              selectedItem: $selectedCastrated,
                              pickerStyle: DefaultPickerStyle())
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
            PetsView()
        }
    }
}
