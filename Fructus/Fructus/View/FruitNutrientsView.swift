//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Elif Bilge Parlak on 29.06.2023.
//

import SwiftUI

struct FruitNutrientsView: View {
    //MARK: - PROPERTIES
    var fruit : Fruit
    let nutrients : [String] = ["ENergy", "Sugar", "Fat", "Protein", "Vitamins" , "Minerals" ]
    
    //MARK: - BODY
    var body: some View {
        GroupBox(){
            DisclosureGroup("Nutritional value per 100 g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider().padding(.vertical,2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.system(.body).bold())
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

//MARK: - PREVIEW
struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
