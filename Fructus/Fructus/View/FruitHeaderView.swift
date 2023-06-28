//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Elif Bilge Parlak on 29.06.2023.
//

import SwiftUI

struct FruitHeaderView: View {
    //MARK: - PROPERTIES
    var fruit : Fruit
    @State private var isAnimating : Bool = false
    
    //MARK: - BODY
    var body: some View {
        ZStack{
            LinearGradient(colors: fruit.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .scaleEffect(isAnimating ? 1 : 0.5)
                .shadow(radius: 10)
                .padding(.vertical, 20)
            
        }//ZStack
        .frame(height: 400)
        .onAppear{
            withAnimation(.easeInOut(duration: 0.5)){
                isAnimating = true
            }
        }
    }
}

//MARK: -  PREVIEW
struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[0]).previewLayout(.fixed(width: 375, height: 440))
    }
}
