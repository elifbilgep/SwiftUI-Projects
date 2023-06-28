//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Elif Bilge Parlak on 29.06.2023.
//

import SwiftUI

struct FruitDetailView: View {
    //MARK: - PROPERTIES
    var fruit : Fruit
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                VStack(alignment: .center, spacing: 20) {
                    //Header
                    FruitHeaderView(fruit: fruit)
                    VStack(alignment: .leading, spacing: 20) {
                        //Title
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        //headline
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        //nutrients
                        FruitNutrientsView(fruit: fruit)
                        
                        //subheadline
                        Text("Learn more about \(fruit.title.uppercased())")
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[0])
                        
                        //description
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        //link
                        SourceLinkView()
                    }//VStack
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }//VSTACK
            }//Scroll
            .navigationTitle(fruit.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
        }//Navigation view
    }
}

//MARK: - PREVIEW
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
