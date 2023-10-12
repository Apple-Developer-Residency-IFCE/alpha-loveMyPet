import SwiftUI
struct CardView: View {
    @State var imagepet: Data?
    @State var name: String = "Bud"
    @State var specie: String = "Husky Siberiano"
    var body: some View {
        VStack {
            HStack(spacing: 17) {
                if let uiimage = UIImage(data: imagepet ?? Data()) {
                    Image(uiImage: uiimage)
                        .resizable()
                        .cornerRadius(36)
                        .frame(width: 64, height: 64)
                        .padding(.leading, 25)
                } else {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 64, height: 64)
                        .cornerRadius(36)
                        .padding(.leading, 25)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(name)
                        .bold()
                    Text(specie)
                }
                .foregroundColor(Color("background_text"))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color("chevron_color"))
                    .padding(.trailing, 35)
                    .bold()
            }
        }
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .circular).fill(Color("petcard_background"))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .circular)
                .strokeBorder(lineWidth: 3))
        .foregroundColor(Color("petcard_foreground"))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardView()
        }
    }
}
