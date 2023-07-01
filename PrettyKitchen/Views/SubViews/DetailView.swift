//
//  DetailView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 01.07.2023.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var coordinator: MainCoordinatorObject
    @State var product: Product
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                ZStack {
                    Color(CustomColor.itemBack.rawValue)
                        .cornerRadius(10)
                    AsyncImage(url: URL(string: product.image_url), scale: 1, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }, placeholder: {
                        Color(CustomColor.itemBack.rawValue)
                            .cornerRadius(10)
                    })
                    .padding(5)
                    VStack {
                        HStack(spacing: 8) {
                            Spacer()
                            Button {
                                //
                            } label: {
                                Image(systemName: "heart")
                                    .padding(10)
                                    .background(.white)
                                    .cornerRadius(8)
                                    .foregroundColor(.black)
                            }
                            Button {
                                coordinator.productViewModel.showDetail = false
                            } label: {
                                Image(systemName: "xmark")
                                    .padding(10)
                                    .background(.white)
                                    .cornerRadius(8)
                                    .foregroundColor(.black)
                            }
                            
                        }
                        .padding(8)
                        Spacer()
                    }
                }
                .frame(minWidth: 100, idealWidth: 250, maxWidth: 350, minHeight: 100, idealHeight: 250, maxHeight: 350, alignment: .center)
                .padding(.horizontal, 16)
                .padding(.top, 16)
                HStack {
                    Text(product.name)
                        .font(
                            Font.custom("SF Pro Display", size: 16)
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
                .padding(.vertical, 5)
                HStack {
                    Text(product.description)
                        .font(Font.custom("SF Pro Display", size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black.opacity(0.65))
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .leading)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                Button {
                    coordinator.productViewModel.addInCart(product: product)
                } label: {
                    Text("Добавить в корзину")
                        .padding(.vertical, 15)
                        .padding(.horizontal, 82)
                        .background(Color(CustomColor.buttonBlue.rawValue))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 16)
                
            }
        }
        .cornerRadius(10)
    }
}

