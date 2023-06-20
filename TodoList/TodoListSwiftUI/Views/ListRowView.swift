//
//  ListRowView.swift
//  TodoListSwiftUI
//
//  Created by Elif Bilge Parlak on 23.05.2023.
//

import SwiftUI

struct ListRowView: View {
    let item : ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
        }.font(.title2) .padding(.vertical,8 )

    }
}


struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Static Item1", isCompleted: false)
    static var item2 = ItemModel(title: "Static Item2", isCompleted: true)
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
