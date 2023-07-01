//
//  CategoryView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 29.06.2023.
//

import SwiftUI

struct CategoryView: View {
    
    @State var url: String
    @State var name: String
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: url), scale: 1, content: { image in
                image
                    .resizable()
            }, placeholder: {
                Color(CustomColor.itemBack.rawValue)
                    .frame(width: 343, height: 148, alignment: .center)
                    .cornerRadius(10)
            })
            .aspectRatio(contentMode: .fill)
            VStack {
                HStack {
                    Text(name)
                        .font(
                            Font.custom("SF Pro Display", size: 20)
                                .weight(.medium)
                        )
                        .kerning(0.2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(width: 191, height: 50, alignment: .topLeading)
                        .padding(10)
                    Spacer()
                }
                Spacer()
            }
        }
        .cornerRadius(10)
    }
}

