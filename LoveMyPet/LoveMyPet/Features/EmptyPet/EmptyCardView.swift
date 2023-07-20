//
//  EmptyCard.swift
//  LoveMyPet
//
//  Created by userext on 06/07/23.
//

import SwiftUI

struct EmptyCard: View {
    var body: some View {
        VStack{
            Image("EmptyCard")
                .resizable()
                .frame(width: 350,height: 100)
            Group{
                Text("Você não possui nenhum pet")
                Text("adicionado :(")
            }.foregroundColor(.gray)
                
        }
    }
}

struct EmptyCard_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCard()
    }
}
