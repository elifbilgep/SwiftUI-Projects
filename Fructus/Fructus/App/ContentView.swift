//
//  ContentView.swift
//  Fructus
//
//  Created by Elif Bilge Parlak on 28.06.2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var isShowingSettings : Bool = false
    
    var fruits : [Fruit] = fruitsData
    
    //MARK: - BODY
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink {
                        FruitDetailView(fruit: fruit)
                    } label: {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }

                   
                }
            }.navigationTitle("Fruits")
                .navigationBarItems(trailing: Button(action: {
                    isShowingSettings = true
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                })//Button
                    .sheet(isPresented: $isShowingSettings, content: {
                        SettingsView()
                    })
                )
        }
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
