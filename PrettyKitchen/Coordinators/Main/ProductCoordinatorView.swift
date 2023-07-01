//
//  ProductCoordinatorView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 30.06.2023.
//

import SwiftUI

struct ProductCoordinatorView: View {
    
    @ObservedObject var coordinator: MainCoordinatorObject
    
    var body: some View {
        ProductsView(viewModel: coordinator.productViewModel)
    }
}

