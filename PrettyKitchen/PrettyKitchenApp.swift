//
//  PrettyKitchenApp.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 28.06.2023.
//

import SwiftUI

@main
struct PrettyKitchenApp: App {
    
    @StateObject var coordinator = AppCoordinatorObject()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: coordinator)
        }
    }
}
