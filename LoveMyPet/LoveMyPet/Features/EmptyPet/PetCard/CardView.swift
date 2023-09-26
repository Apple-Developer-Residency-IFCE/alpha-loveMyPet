import SwiftUI
struct CardView: View {
    @State var imagepet: Data?
    @State var name: String = "Bud"
    @State var specie: String = "Husky Siberiano"
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                if let uiimage = UIImage(data: imagepet ?? Data()) {
                    Image(uiImage: uiimage)
                        .resizable()
                        .cornerRadius(36)
                        .frame(width: 64, height: 64)
                } else {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(maxWidth: 70, maxHeight: 70)
                        .cornerRadius(37)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(name)
                        .bold()
                    Text(specie)
                }
                .foregroundColor(Color("background_text"))
                Spacer()
            }
        }
        .padding(.vertical, 12)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2)
                .foregroundColor(Color("borders_color"))
        )
        .background(Color("PetCard"))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardView()
        }
    }
}
