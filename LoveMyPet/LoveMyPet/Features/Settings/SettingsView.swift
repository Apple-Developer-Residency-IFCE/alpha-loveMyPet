import SwiftUI
struct SettingsView: View {
    @EnvironmentObject private var themeviewmodel: SettingsViewModel
    var body: some View {
        VStack {
            Color("background_color")
                .ignoresSafeArea()
            Text("Configurações")
                .bold()
                .font(.system(size: 32))
                .padding(.bottom, 50)
                .padding(.horizontal, -150)
                .padding(.top, 56)
            Text("APARÊNCIA")
                .bold()
                .font(.system(size: 15))
                .padding(.bottom, 50)
                .padding(.horizontal, -150)
            HStack(spacing: 30) {
                RadiusButton(buttonId: 0,
                             selectedButton: $themeviewmodel.selectedButton,
                             image: "image_conf_system",
                             title: "Sistema") {themeviewmodel.setTheme(.system)}
                RadiusButton(buttonId: 1,
                             selectedButton: $themeviewmodel.selectedButton,
                             image: "image_conf_ light",
                             title: "Claro") {themeviewmodel.setTheme(.light)}
                RadiusButton(buttonId: 2,
                             selectedButton: $themeviewmodel.selectedButton,
                             image: "image_conf_dark",
                             title: "Escuro") {themeviewmodel.setTheme(.dark)}
            }
            .padding(.bottom, 350)
        }
        .background(Color("backgroud_color"))
        }
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
                .environmentObject(SettingsViewModel())
        }
    }
}
