import SwiftUI

struct SheetAddPet: View {
    @State  var showingSheet = false
    @State var isView: Bool = false
    @EnvironmentObject private var vmSheet: PetViewModel
    var body: some View {
        Button("Adicionar") {
            showingSheet = true
        }
        .foregroundColor(Color("cancel_button"))
        .bold()
        .sheet(isPresented: $showingSheet, onDismiss: {
            vmSheet.clear()
            vmSheet.fetchPet()
        }) {
            NavigationStack {
                VStack(spacing: -15) {
                    Rectangle()
                        .padding(.top, 100)
                        .background(Color("forms_colors"))
                        .frame(height: 80)
                        .padding(.top, -79)
                        .overlay(
                            HStack(spacing: 50) {
                                Button("Cancelar") {
                                    showingSheet = false
                                    vmSheet.clear()
                                }
                                .foregroundColor(Color("cancel_button"))
                                Text("Adicionar Pet")
                                    .bold()
                                Button("Adicionar") {
                                    showingSheet = false
                                    Task { await vmSheet.save()}
                                    vmSheet.fetchPet()
                                }
                                .bold()
                                .foregroundColor(Color("cancel_button"))
                            }
                                .padding(.top, -30))
                        .frame(height: 100)
                    Rectangle()
                        .frame(width: 400, height: 0.5)
                        .foregroundColor(.gray)
                        .padding(.top, -30)
                    Divider()
                        .foregroundColor(Color("backgroud_color"))
                    AddPetsView(isView: isView)
                }
            }
        }
    }
}

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SheetAddPet()
        }
    }
}
