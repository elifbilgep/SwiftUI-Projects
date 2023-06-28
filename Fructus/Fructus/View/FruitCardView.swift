//
//  FruitCardView.swift
//  Fructus
//
//  Created by Elif Bilge Parlak on 28.06.2023.
//

import SwiftUI

struct FruitCardView: View {
    //MARK: - PROPERTIES
    var fruit : Fruit
    
    @State private var isAnimating : Bool = false
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            
            VStack(spacing:20) {
                //Fruit image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.25), radius: 8,x:6, y:8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                //Fruit title
                Text(fruit.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.15) ,radius: 2,x: 2,y: 2)
                
                //Fruit headline
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: 480)
                //Button start
                StartButtonView()
                
            }//VStack
        }//ZSTACK
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom))
        
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

//MARK: - PREVIEW

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1]).previewLayout(.fixed(width: 320, height: 640))
    }
}
