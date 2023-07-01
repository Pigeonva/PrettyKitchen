//
//  MainCoordinatorObject.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 28.06.2023.
//

import SwiftUI

enum Page: String, Identifiable {
    case firstLevel
    case secondLevel
    
    var id: String {
        self.rawValue
    }
}

class MainCoordinatorObject: ObservableObject {
    
    @Published var generalViewModel: GeneralViewModel!
    @Published var cartViewModel: CartViewModel!
    @Published var productViewModel: ProductsViewModel!
    @Published var detailView: DetailView?
    
    var networkManager = NetworkManager()
    
    @Published var generalPath = NavigationPath()
    
    init() {
        self.generalViewModel = .init(coordinator: self)
        self.cartViewModel = .init(coordinator: self)
        self.productViewModel = .init(coordinator: self)
    }
    
    func push(_ page: Page) {
        generalPath.append(page)
    }
    func pop() {
        generalPath.removeLast()
    }
    func popToRoot() {
        generalPath.removeLast(generalPath.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .firstLevel:
            GeneralView(viewModel: generalViewModel)
        case .secondLevel:
            ProductsView(viewModel: productViewModel)
        }
    }
}
