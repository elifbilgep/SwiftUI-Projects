//
//  FructusApp.swift
//  Fructus
//
//  Created by Elif Bilge Parlak on 28.06.2023.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnBoarding") var isOnboarding : Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnBoardingView()
            }else{
                ContentView()
            }
           
        }
    }
}
