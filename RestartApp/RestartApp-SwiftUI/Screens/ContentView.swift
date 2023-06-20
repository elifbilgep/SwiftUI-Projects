//
//  ContentView.swift
//  RestartApp-SwiftUI
//
//  Created by Elif Bilge Parlak on 16.06.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive : Bool = true
    
    var body: some View {
        ZStack{
            if isOnBoardingViewActive {
                OnBoardingView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
