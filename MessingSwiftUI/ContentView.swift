//
//  ContentView.swift
//  MessingSwiftUI
//
//  Created by Zhenxiang Chen on 27/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet = false
    
    @StateObject var model = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(model.dishesList) { dish in
                    DishItemView(dish: dish)
                }
            }
            .navigationTitle("Dishes")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showSheet.toggle()
                }) {
                    Image(systemName: "plus").imageScale(.large)
                }
            )
            .sheet(isPresented: $showSheet) {
                SheetView { newDish in
                    self.model.addDish(dish: newDish)
                }
            }
        }
    }
}

private struct DishItemView: View {
    let dish: DishModel
    
    var body: some View {
        VStack {
            Text(dish.dishName)
            Text(dish.dishDescription)
        }
    }
}

private struct SheetView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var dishName: String = ""
    @State var dishDescription: String = ""
    
    let onAddDish: (DishModel) -> Void

    var body: some View {
        NavigationView {
            Form {
                TextField("Dish name", text: $dishName)
                TextField("Dish description", text: $dishDescription)
            }
            .navigationTitle("Add new dish")
            .navigationBarItems(
                trailing: Button("Save") {
                    dismiss()
                    onAddDish(getDish())
                }
            )
        }
    }
    
    func getDish() -> DishModel {
        return DishModel(
            id: UUID(),
            dishName: dishName,
            dishDescription: dishDescription
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
