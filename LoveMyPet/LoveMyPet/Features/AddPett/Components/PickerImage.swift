import PhotosUI
import SwiftUI

struct ImagePicker: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    var body: some View {
        PhotosPicker(selection: $avatarItem, matching: .images) {
            ZStack {
            
            VStack {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 64, height: 64)
                Text("Escolher foto")
                    .foregroundColor(.black)
                }
                
                
                
            }
        }
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                        return
                    }
                }
                print("Failed")
            }
        }
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}
//}
//if let avatarImage {
//    avatarImage
//        .resizable()
//        .frame(width: 64, height: 64)
//        .scaledToFit()
//        .cornerRadius(100)
//    Text("Trocar foto")
//        .foregroundColor(.black)
//} else {
//    Circle()
//        .foregroundColor(.gray)
//        .frame(width: 64, height: 64)
//}
//    Text("Escolher foto")
//        .foregroundColor(.black)
