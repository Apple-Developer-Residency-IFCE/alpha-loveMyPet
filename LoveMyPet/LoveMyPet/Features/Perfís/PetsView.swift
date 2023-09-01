//  ProfilesView.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//

import SwiftUI

struct PetsView: View {
    @State var hasPet: Bool = false
    @State var sheetShow: Bool = false
    @State var imagePet: [Image] = [Image]()
    @StateObject var viewmodel = PetViewModel(stack: PetProvider())

    var body: some View {
        VStack {
            if viewmodel.items.isEmpty {
                EmptyCard()
                Spacer()
            } else {
                List {
                    ForEach(viewmodel.items, id: \.self) { pet in
                        CardView(
                            imagepet: try? Data(contentsOf: pet.imagepath!),
                            name: pet.name!,
                            specie: pet.species!)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("backgroud_color"))
        .navigationTitle("Pets")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Sheet()
            }
        }
        .environmentObject(viewmodel)
    }
}

struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PetsView()
            }
    }
}

//extension UIImage {
//    static func download(at path: URL) async throws -> UIImage {
//        let (data, _) = try await URLSession.shared.data(from: path)
//
//        return UIImage(data: data) ?? UIImage()
//    }
//}
