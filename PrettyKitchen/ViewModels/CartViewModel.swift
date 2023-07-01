//
//  CartViewModel.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 30.06.2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
    private unowned let coordinator: MainCoordinatorObject
    
    @Published var cartProducts = [Product]()
    @Published var amount = 0
    
    init(coordinator: MainCoordinatorObject) {
        self.coordinator = coordinator
    }
    
    func deleteFromCart(product: Product) {
        var tempCounter = 0
        for prod in cartProducts {
            if prod == product {
                cartProducts.remove(at: tempCounter)
                return
            } else {
                tempCounter += 1
            }
        }
    }
}
