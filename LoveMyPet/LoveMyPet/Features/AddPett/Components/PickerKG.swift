//
//  SwiftUIView.swift
//  LoveMyPet
//
//  Created by userext on 19/07/23.
//

import SwiftUI

struct PickerKG: View {
    @State  var quilo = 1
    @State var grama = 1
    @Binding var isView: Bool
    let numbers = Array(0...100)
    var body: some View {
        VStack {
            HStack {
                Text("Peso")
                Spacer()
                Rectangle()
                    .overlay {
                        HStack {
                            Text("\(quilo),\(grama) Kg ")
                                .foregroundColor(.black)
                        }
                    }
                    .frame(width: 100, height: 32)
                    .foregroundColor(.gray.opacity(0.10))
                    .cornerRadius(4)
                  

            }
            .onTapGesture {
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    isView.toggle()
                }
            }
            .padding()
            HStack(spacing: 0) {
                if isView {
                    Group {
                        Picker("Quilo", selection: $quilo) {
                            ForEach(0..<100) {
                                Text("\($0)")
                            }
                        }
                        .frame(width: 50)

                        Picker("Gramas", selection: $grama) {
                            ForEach(0..<100) {
                                Text("\($0)")
                            }
                        }
                        .frame(width: 50)
                        .overlay {
                            Text("Kg")
                                .offset(x: 50)
                        }
                    }
                    .labelsHidden()
                    .fixedSize(horizontal: true, vertical: true)
                    .clipped()
                    .pickerStyle(.wheel)
                }
            }
            .overlay {
                if isView {
                    Text(",")
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PickerKG(isView: .constant(true))
    }
}
