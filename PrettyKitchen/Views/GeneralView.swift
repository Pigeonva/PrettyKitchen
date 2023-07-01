//
//  GeneralView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 28.06.2023.
//

import SwiftUI

struct GeneralView: View {
    
    @EnvironmentObject var coordinator: MainCoordinatorObject
    @ObservedObject var viewModel: GeneralViewModel
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
                Image("avatar")
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
            }
            .padding(12)
            List {
                ForEach($viewModel.categories, id: \.self) { $category in
                    Button {
                        coordinator.productViewModel.name = category.name
                        coordinator.push(.secondLevel)
                    } label: {
                        CategoryView(url: category.image_url, name: category.name)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .foregroundColor(.black)
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: 12,
                            bottom: 0,
                            trailing: 12
                        )
                    )
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
        }
    }
}

