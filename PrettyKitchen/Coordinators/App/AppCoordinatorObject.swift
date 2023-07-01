//
//  AppCoordinatorObject.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 28.06.2023.
//

import Foundation

enum CoordinatorTab {
    case general
    case search
    case cart
    case account
}

class AppCoordinatorObject: ObservableObject {
    
    @Published var tab = CoordinatorTab.general
    @Published var mainCoordinator: MainCoordinatorObject!
    
    init() {
        self.mainCoordinator = .init()
    }
    
}
