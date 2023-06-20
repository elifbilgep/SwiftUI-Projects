//
//  ItemModel.swift
//  TodoListSwiftUI
//
//  Created by Elif Bilge Parlak on 23.05.2023.
//

import Foundation

//Immutable Struct
struct ItemModel : Identifiable, Codable{
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id : String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func update() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
    
}
