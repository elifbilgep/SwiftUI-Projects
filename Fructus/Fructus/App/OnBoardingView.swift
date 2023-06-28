//
//  OnBoardingView.swift
//  Fructus
//
//  Created by Elif Bilge Parlak on 28.06.2023.
//

import SwiftUI

struct OnBoardingView: View {
    //MARK: - PROPERTIES
    var fruists : [Fruit] = fruitsData
    
    //MARK: - BODY
    var body: some View {
        TabView{
            ForEach(fruists[0...5]){ item in
                FruitCardView(fruit: item)
               
            }
            
        }//TabView
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical,20)
        
    }
}

//MARK: - PREVIEW
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
