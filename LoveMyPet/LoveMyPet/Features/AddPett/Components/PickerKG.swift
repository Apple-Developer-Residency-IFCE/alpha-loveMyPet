//
//  SwiftUIView.swift
//  LoveMyPet
//
//  Created by userext on 19/07/23.
//

import SwiftUI

struct PickerKG: View {
    @Binding var weight: Double
    @Binding var isView: Bool
    @Binding var quilo: Int
    @Binding var grama: Int
    let numbers = Array(0...100)

    var body: some View {
        VStack {
            HStack {
                Text("Peso")
                    .foregroundColor(Color("background_text"))
                Spacer()
                Rectangle()
                    .overlay {
                        HStack {
                            Text("\(Int(quilo)),\(Int(grama)) Kg ")
                                .foregroundColor(Color("background_text"))
                        }
                    }
                    .frame(width: 100, height: 32)
                    .foregroundColor(.gray.opacity(0.10))
                    .cornerRadius(4)
            }
            .padding(.top, 0)
            .onTapGesture {
                isView.toggle()
            }
            HStack(spacing: 0) {
                if isView {
                    Group {
                        Picker("Quilo", selection: $quilo) {
                            ForEach(0..<100) {
                                Text("\($0)")
                            }
                        }
                        .onChange(of: quilo, perform: { _ in
                            self.weight = Double(quilo) + Double(grama)
                        })
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
            .padding(.top, -70)
            .overlay {
                if isView {
                    HStack {
                        Text(",")
                            .padding(.top, -50)
                    }
                }
            }
        }
    }
}
//
// struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerKG(weight: .constant(10),
//                 isView: .constant(true),
//                 quilo: .constant(10),
//                 grama: .constant(10)
//        )
//    }
// }
