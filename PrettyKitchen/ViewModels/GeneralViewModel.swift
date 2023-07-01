//
//  GeneralViewModel.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 28.06.2023.
//

import Foundation
import Combine

class GeneralViewModel: ObservableObject {
    
    private unowned let coordinator: MainCoordinatorObject
    
    @Published var categories: [Category] = []
    
    lazy private var getCategories: AnyPublisher<[Category], Never> = {
        coordinator.networkManager.getCategories()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }()
    
    init(coordinator: MainCoordinatorObject) {
        self.coordinator = coordinator
        
        getCategories
            .assign(to: &$categories)
    }
}
