//
//  TodoListSwiftUIApp.swift
//  TodoListSwiftUI
//
//  Created by Elif Bilge Parlak on 23.05.2023.
//

import SwiftUI
/*
 MVVM Architecture
 
 Model - Data Point
 View - UI
 ViewModel - Manages models for views
 
 */
@main
struct TodoListSwiftUIApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
           
        }
    }
}
