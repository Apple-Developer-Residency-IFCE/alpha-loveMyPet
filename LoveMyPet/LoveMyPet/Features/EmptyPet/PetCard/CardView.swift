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
                        .frame(maxWidth: 70, maxHeight: 70)
                        .cornerRadius(36)
                }
                else {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(maxWidth: 70,maxHeight: 70)
                        .cornerRadius(37)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(name)
                        .bold()
                    Text(specie)
                }
                .background(Color("backgroud_color"))
                Spacer()
//                Image("arrow_icon")
//                    .foregroundColor(.gray)
//                    .padding(.trailing, 40)
            }
        }.background(Color("backgroud_color"))
            .padding(.vertical, 40)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("borders_color"))
                    .frame(width: 330, height: 100)
            )
            .background(Color("backgroud_color"))
            //.cardStyle(.plain)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardView()
        }
    }
}
