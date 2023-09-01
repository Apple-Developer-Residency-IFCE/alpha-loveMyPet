import SwiftUI

struct Sheet: View {
    @State  var showingSheet = false
    @State var isView: Bool = false
    @StateObject var vmSheet = PetViewModel(stack: PetProvider())
    var body: some View {
        Button("Adicionar") {
            showingSheet = true
        }
        .foregroundColor(Color("cancel_button"))
        .bold()
        .sheet(isPresented: $showingSheet) {
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
                                }
                                .foregroundColor(Color("cancel_button"))
                                Text("Adicionar Pet")
                                    .bold()
                                Button("Adicionar") {
                                    showingSheet = false
                                    vmSheet.save()
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
            Sheet()
        }
    }
}
