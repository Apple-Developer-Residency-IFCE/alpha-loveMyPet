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
                List {
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
                        .buttonStyle(.plain)
                    }
                    .listRowBackground(Color("backgroud_color"))
                }
                // 1. Transformar o Pet am Hashable
                // 2. Estudar sobre navigationDetination e NavigationLoink(value) linha 16
                //.navigationDestination(for: Pet, destination: PetDetails())
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
