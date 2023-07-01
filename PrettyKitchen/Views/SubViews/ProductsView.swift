//
//  ProductsView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 30.06.2023.
//

import SwiftUI

struct ProductsView: View {
    
    @ObservedObject var viewModel: ProductsViewModel
    @EnvironmentObject var coordinator: MainCoordinatorObject
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        viewModel.currentTeg = "Все меню"
                        viewModel.filter(with: viewModel.currentTeg)
                        coordinator.pop()
                    } label: {
                        Image("back")
                    }
                    .foregroundColor(.black)
                    Spacer()
                    Text(viewModel.name)
                        .font(
                            Font.custom("SF Pro Display", size: 18)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    Spacer()
                    Image("avatar")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 44, height: 44)
                }
                .padding(.horizontal, 16)
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 8){
                        Spacer(minLength: 16)
                        ForEach($viewModel.tegs, id: \.self) { $teg in
                            Button {
                                viewModel.currentTeg = teg
                                viewModel.filter(with: viewModel.currentTeg)
                            } label: {
                                Text(teg)
                                    .font(Font.custom("SF Pro Display", size: 14))
                                    .kerning(0.14)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 16)
                                    .background(teg == viewModel.currentTeg ? Color(CustomColor.buttonBlue.rawValue) : Color(CustomColor.itemBack.rawValue))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(teg == viewModel.currentTeg ? .white : .black)
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach($viewModel.products, id: \.self) { $product in
                            Button {
                                coordinator.detailView = DetailView(product: product)
                                viewModel.showDetail = true
                                
                            } label: {
                                ProductView(product: product)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 16,
                        bottom: 0,
                        trailing: 16
                    )
                )
                
            }
            if viewModel.showDetail {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                coordinator.detailView
                    .padding(.horizontal, 16)
                    .padding(.vertical, 150)
                    .ignoresSafeArea()
                
            }
            
        }
    }
}
