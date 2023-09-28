import SwiftUI
struct PetsView: View {
    @State var hasPet: Bool = false
    @State var sheetShow: Bool = false
    @StateObject var vmPetsView = PetViewModel(stack: .shared, imageFileManager: .init())
    var imageFileManager: ImageFileManager
    var body: some View {
        VStack {
            if vmPetsView.items.isEmpty {
                EmptyCard()
                Spacer()
            } else {
                ScrollView {
                    ForEach(vmPetsView.items, id: \.self) { pet in
                        NavigationLink {
                            PetDetails()
                                .environmentObject(vmPetsView)
                                .onAppear {
                                    vmPetsView.setPetToEdit(pet)
                                }
                        } label: {
                                CardView(imagepet: vmPetsView.loadImage(name: pet.id!.uuidString),
                                         name: pet.name ?? "",
                                         specie: pet.race ?? "")
                        }
                        .padding(.vertical, 5)

                    }
                    .listRowBackground(Color("backgroud_color"))
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 30)
                .background(.clear)
                .scrollContentBackground(.hidden)
            }
        }
        .onAppear {
            vmPetsView.fetchPet()
            vmPetsView.clear()
        }
        .frame(maxWidth: .infinity)
        .background(Color("backgroud_color"))
        .navigationTitle("Pets")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                SheetAddPet()
                    .environmentObject(vmPetsView)
            }
        }
    }
}
