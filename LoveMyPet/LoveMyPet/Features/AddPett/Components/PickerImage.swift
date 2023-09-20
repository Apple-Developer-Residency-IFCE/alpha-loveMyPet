import PhotosUI
import SwiftUI

struct ImagePicker: View {
    @State var text: String
    @Binding var imageData: Data?
    @State private var avatarItem: PhotosPickerItem? = .init(itemIdentifier: UUID().uuidString)

    var body: some View {
        PhotosPicker(selection: $avatarItem, matching: .images) {
            ZStack {
                VStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 64, height: 64)
                    Text(text)
                        .foregroundColor(Color("background_text"))
                }

                if let imageData = imageData {
                    Image(data: imageData)
                        .resizable()
                        .frame(width: 64, height: 64)
                        .scaledToFit()
                        .cornerRadius(100)
                        .padding(.bottom, 30)
                }
            }
        }
        .onChange(of: avatarItem) { _ in
            Task {
                let loadedData = try? await avatarItem?.loadTransferable(type: Data.self)
                DispatchQueue.main.async {
                    self.imageData = loadedData
                }
            }
        }
    }
}
struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(text: "Escolher Foto",
                    imageData: .constant(.none))
    }
}


extension Image {
    init(data: Data) {
        self.init(uiImage: UIImage(data: data)!)
    }
}
