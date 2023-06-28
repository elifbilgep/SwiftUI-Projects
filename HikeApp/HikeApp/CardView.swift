//
//  CardView.swift
//  HikeApp
//
//  Created by Elif Bilge Parlak on 27.06.2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [Color("ColorIndigoMedium"),Color("ColorSalmonLight")], startPoint: UnitPoint.topLeading, endPoint: .bottomTrailing
                                  )
                )
                .frame(width: 256,height: 256)
            Image("image-1")
                .resizable()
            .scaledToFit()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
