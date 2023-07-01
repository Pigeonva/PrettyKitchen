//
//  CartView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 28.06.2023.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("Location")
                    .frame(width: 28, height: 28)
                VStack(alignment: .leading) {
                    Text("Санкт-Петербург")
                        .font(
                            Font.custom("SF Pro Display", size: 18)
                                .weight(.medium)
                        )
                        .foregroundColor(.black)
                    Text("12 Августа, 2023")
                        .font(Font.custom("SF Pro Display", size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black.opacity(0.5))
                }
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
            }
            .padding(12)
            List {
                ForEach($viewModel.cartProducts, id: \.self) { $product in
                    CartProductView(product: product, count: 1)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            Spacer()
            Button {
                //
            } label: {
                Text(!(viewModel.amount == 0) ? "Оплатить \(String(viewModel.amount)) ₽" : "К покупкам")
                    .frame(minWidth: 200, idealWidth: 343, maxWidth: 400, minHeight: 48, idealHeight: 48, maxHeight: 48, alignment: .center)
                    .background(Color(CustomColor.buttonBlue.rawValue))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 16)
            .padding(.horizontal, 16)

        }
    }
}

