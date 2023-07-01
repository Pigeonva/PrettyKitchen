//
//  CartProductView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 01.07.2023.
//

import SwiftUI

struct CartProductView: View {
    
    @EnvironmentObject var coordinator: MainCoordinatorObject
    @State var product: Product
    @State var count: Int
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                Color(CustomColor.itemBack.rawValue)
                    .cornerRadius(10)
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: product.image_url), scale: 1, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }, placeholder: {
                        Color(CustomColor.itemBack.rawValue)
                            .cornerRadius(10)
                    })
                    .padding(5)
                }
            }
            .frame(width: 62, height: 62, alignment: .center)
            VStack {
                HStack {
                    Text(product.name)
                        .font(
                            Font.custom("SF Pro Display", size: 14)
                                .weight(.medium)
                        )
                        .kerning(0.16)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.horizontal, 16)
                HStack(spacing: 1) {
                    Text("\(product.price)₽")
                        .font(
                            Font.custom("SF Pro Display", size: 14)
                        )
                        .kerning(0.14)
                        .foregroundColor(.black)
                    Text(".\(product.weight)г")
                        .font(
                            Font.custom("SF Pro Display", size: 14)
                        )
                        .kerning(0.14)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            HStack {
                Button {
                    if count == 1 {
                        coordinator.cartViewModel.deleteFromCart(product: product)
                        coordinator.cartViewModel.amount -= product.price
                    } else {
                        count -= 1
                        coordinator.cartViewModel.amount -= product.price
                    }
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 24, height: 24, alignment: .center)
                        .foregroundColor(.black)
                }
                .buttonStyle(BorderlessButtonStyle())
                Text(String(count))
                    .font(
                        Font.custom("SF Pro Display", size: 14)
                            .weight(.medium)
                    )
                    .kerning(0.14)
                    .foregroundColor(.black)
                Button {
                    count += 1
                    coordinator.cartViewModel.amount += product.price
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 24, height: 24, alignment: .center)
                        .foregroundColor(.black)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .background(Color(CustomColor.itemBack.rawValue))
            .cornerRadius(10)
        }
    }
}

