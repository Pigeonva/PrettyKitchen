//
//  CartCoordinatorView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 30.06.2023.
//

import SwiftUI

struct CartCoordinatorView: View {
    @ObservedObject var coordinator: MainCoordinatorObject
    
    var body: some View {
        CartView(viewModel: coordinator.cartViewModel)
            .environmentObject(coordinator)
    }
}

