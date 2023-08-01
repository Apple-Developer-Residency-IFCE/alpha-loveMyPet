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
    @State var isView: Bool = false
    let numbers = Array(0...100)
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Peso")
                    Spacer()
                    Rectangle()
                        .overlay {
                            HStack {
                                Text("\(quilo)")
                                    .foregroundColor(.black)
                                Text(",")
                                    .foregroundColor(.black)
                                Text("\(grama) Kg")
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(width: 100, height: 32)
                        .foregroundColor(.gray.opacity(0.10))
                        .cornerRadius(4)
                }.padding()
                    .onTapGesture {
                        withAnimation(Animation.easeInOut(duration: 0.5)) {
                            isView.toggle()
                        }
                    }
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                HStack(spacing: 0) {
                    if isView {
                        Group {
                            Picker("Quilo", selection: $quilo) {
                                ForEach(0..<100) {
                                    Text("\($0)")
                                }
                            }
                            Picker("Gramas", selection: $grama) {
                                ForEach(0..<100) {
                                    Text("\($0)")
                                }
                            }
                            .overlay {
                                Text("Kg")
                                    .offset(x: 50)
                            }
                        }
                        .frame(width: geometry.size.width / 2 + 30)
                        .labelsHidden()
                        .fixedSize(horizontal: true, vertical: true)
                        .frame(width: geometry.size.width / 2, height: 160)
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
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PickerKG()
    }
}
