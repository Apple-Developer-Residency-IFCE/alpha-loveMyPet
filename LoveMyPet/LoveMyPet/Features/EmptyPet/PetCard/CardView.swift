import SwiftUI
struct CardView: View {
    @State var imagepet: Data?
    @State var name: String = "Bud"
    @State var specie: String = "Husky Siberiano"
    var body: some View {

        HStack(spacing: 16) {
            if let uiimage = UIImage(data: imagepet ?? Data()){
                let image = Image(uiImage: uiimage)
                    .cornerRadius(64)
            }
            else {
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(name)
                    .bold()
                Text(specie)
            }.background(Color("backgroud_color"))
            Spacer()
            Image("arrow_icon")
                .foregroundColor(.gray)
        }.background(Color("backgroud_color"))
        .padding(40)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
                .foregroundColor(Color("borders_color"))
                .frame(width: 350, height: 100)
            )
                .background(Color("backgroud_color"))
    }
}
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}

