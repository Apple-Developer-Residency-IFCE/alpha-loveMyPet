
import SwiftUI
struct CastratedPickerView: View {
    @Binding var castratedOptions: Bool
    var body: some View {
        List {
            HStack {
                Picker("Castrado(a)?", selection: $castratedOptions) {
                    Text("Sim").tag(true)
                    Text("Não").tag(false)
                }
                .pickerStyle(DefaultPickerStyle())
                .listRowBackground(Color("forms_colors"))
            }
        }
    }
}
struct CastratedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CastratedPickerView(castratedOptions: .constant(false) )
    }
}
