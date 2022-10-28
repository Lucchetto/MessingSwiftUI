//
//  ContentViewModel.swift
//  MessingSwiftUI
//
//  Created by Zhenxiang Chen on 27/10/22.
//

import Foundation

@MainActor class ContentViewModel : ObservableObject {
    
    @Published private(set) var dishesList = [DishModel]()
    
    func addDish(dish: DishModel) {
        dishesList.append(dish)
    }
}
