//
//  AppCoordinatorView.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 28.06.2023.
//

import SwiftUI

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinatorObject
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            GeneralCoordinatorView(coordinator: coordinator.mainCoordinator)
                .tabItem {
                    Label {
                        Text("Главная")
                    } icon: {
                        Image("general")
                            .frame(width: 28, height: 28)
                    }
                }
                .tag(CoordinatorTab.general)
            SearchView()
                .tabItem {
                    Label {
                        Text("Поиск")
                    } icon: {
                        Image("search")
                            .frame(width: 28, height: 28)
                    }
                }
                .tag(CoordinatorTab.search)
            CartCoordinatorView(coordinator: coordinator.mainCoordinator)
                .tabItem {
                    Label {
                        Text("Корзина")
                    } icon: {
                        Image("cart")
                            .frame(width: 28, height: 28)
                    }
                }
                .tag(CoordinatorTab.cart)
            AccountView()
                .tabItem {
                    Label {
                        Text("Аккаунт")
                    } icon: {
                        Image("account")
                            .frame(width: 28, height: 28)
                    }
                }
                .tag(CoordinatorTab.account)
        }
    }
}
