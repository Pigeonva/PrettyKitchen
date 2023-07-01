//
//  ProductsViewModel.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 30.06.2023.
//

import SwiftUI
import Combine

class ProductsViewModel: ObservableObject {
    
    private unowned let coordinator: MainCoordinatorObject
    
    @Published var products: [Product] = []
    @Published var container: [Product] = []
    @Published var name = ""
    @Published var tegs = ["Все меню", "Салаты", "С рисом", "С рыбой"]
    @Published var currentTeg = "Все меню"
    @Published var showDetail = false
    
    lazy private var getProducts: AnyPublisher<[Product], Never> = {
        coordinator.networkManager.getProducts()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }()
    
    init(coordinator: MainCoordinatorObject) {
        self.coordinator = coordinator
        
        getProducts
            .assign(to: &$products)
        getProducts
            .assign(to: &$container)
    }
    
    func filter(with teg: String) {
        products = container.filter { $0.tegs.contains(currentTeg)}
    }
    func addInCart(product: Product) {
        if !coordinator.cartViewModel.cartProducts.contains(product){
            coordinator.cartViewModel.cartProducts.append(product)
            coordinator.cartViewModel.amount += product.price
        }
    }
}
