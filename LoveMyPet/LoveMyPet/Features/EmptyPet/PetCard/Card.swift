import Foundation
import SwiftUI

struct Card {
    @State var imagePet = Image("")
    @State var name: String
    @State var specie: String
    static var pet = Card(imagePet: Image(""), name: "", specie: "")
}
