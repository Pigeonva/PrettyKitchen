//
//  ProductView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 30.06.2023.
//

import SwiftUI

struct ProductView: View {
    
    @State var product: Product
    
    var body: some View {
        VStack(spacing: 2) {
            ZStack {
                Color(CustomColor.itemBack.rawValue)
                    .cornerRadius(10)
                    .frame(width: 109, height: 109)
                AsyncImage(url: URL(string: product.image_url), scale: 1, content: { image in
                    image
                        .resizable()
                }, placeholder: {
                    Color(CustomColor.itemBack.rawValue)
                        .cornerRadius(10)
                })
                .aspectRatio(contentMode: .fit)
                .frame(width: 109, height: 109)
            }
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(Font.custom("SF Pro Display", size: 14))
                    .kerning(0.14)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .topLeading)
            }
        }
    }
}

