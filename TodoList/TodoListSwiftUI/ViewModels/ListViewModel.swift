//
//  ListViewModel.swift
//  TodoListSwiftUI
//
//  Created by Elif Bilge Parlak on 23.05.2023.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = []{//any time items changes
        didSet{
            saveItems()
        }
    }
    let itemsKey = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey), let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{
            return
        }
        
        self.items = savedItems
        
    }
    
    func deleteItem(indexSet : IndexSet){
        items.remove(atOffsets: indexSet)

    }
    func moveItem(from : IndexSet , to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
     }
    
    func updateItem(item : ItemModel){
//        let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id }){//$ is existing item in the previous code
            items[index] = item.update()
        }
        
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
