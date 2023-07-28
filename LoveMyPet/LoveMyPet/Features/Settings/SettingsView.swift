import SwiftUI
struct SettingsView: View {
    @EnvironmentObject private var themeviewmodel: SettingsViewModel
    @State var selectedButton: Int = 0
    var body: some View {
            VStack {
                Color("background_color")
                    .ignoresSafeArea()
                Text("Configurações")
                    .bold()
                    .font(.system(size: 30))
                    .padding(.bottom, 50)
                    .padding(.horizontal, -150)
                Text("APARÊNCIA")
                    .bold()
                    .font(.system(size: 15))
                    .padding(.bottom, 50)
                    .padding(.horizontal, -150)
                HStack(spacing: 30) {
                    RadiusButton(buttonId: 0, selectedButton: $selectedButton, image: "image_conf_system", title: "Sistema") {themeviewmodel.currentTheme = .system}
                    RadiusButton(buttonId: 1, selectedButton: $selectedButton, image: "image_conf_ light", title: "Claro") {themeviewmodel.currentTheme = .light}
                    RadiusButton(buttonId: 2, selectedButton: $selectedButton, image: "image_conf_dark", title: "Escuro") {themeviewmodel.currentTheme = .dark}
                }
                .padding(.bottom, 350)
            }
            .background(Color("backgroud_color"))
            .preferredColorScheme(getPreferredColorSheme(for: themeviewmodel.currentTheme))
        }
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}
