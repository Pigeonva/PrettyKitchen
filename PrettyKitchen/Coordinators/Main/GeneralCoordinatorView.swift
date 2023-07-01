//
//  GeneralCoordinatorView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 28.06.2023.
//

import SwiftUI

struct GeneralCoordinatorView: View {
    
    @ObservedObject var coordinator: MainCoordinatorObject
    
    var body: some View {
        NavigationStack(path: $coordinator.generalPath) {
            coordinator.build(page: .firstLevel)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environmentObject(coordinator)
    }
}

